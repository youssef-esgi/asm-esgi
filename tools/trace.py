# Script gdb (Python) utilisé par `make trace`.
# Exécute le programme, s'arrête à l'entrée de chaque fonction écrite en assembleur,
# puis avance instruction par instruction en affichant un tableau :
#     instruction | eax ebx ecx edx esi
# C'est le même tableau que celui des TD sur papier, calculé par la machine.
#
# Variables d'environnement (positionnées par tools/trace.sh) :
#   TRACE_FUNCS   fonctions à tracer, séparées par des espaces (défaut : tous les symboles
#                 globaux du .text listés par le Makefile)
#   TRACE_MODE    "run"    : gdb lance le programme lui-même (x86_64)
#                 "remote" : le programme est déjà lancé par qemu-i386, gdb y est connecté
#   TRACE_IN      fichier lu sur l'entrée standard (mode run)
#   TRACE_HEX     "1" pour afficher les registres en hexadécimal (défaut : décimal signé)
#   TRACE_MAX     nombre maximal d'instructions par fonction (défaut 400)

import os
import gdb

FUNCS = os.environ.get("TRACE_FUNCS", "").split()
MODE = os.environ.get("TRACE_MODE", "run")
INFILE = os.environ.get("TRACE_IN", "")
HEX = os.environ.get("TRACE_HEX", "") == "1"
MAX = int(os.environ.get("TRACE_MAX", "400"))
REGS = ["eax", "ebx", "ecx", "edx", "esi"]
W = 11  # largeur d'une colonne registre

gdb.execute("set pagination off")
gdb.execute("set confirm off")
gdb.execute("set print frame-info short-location")

_src_cache = {}


def source_line(pc):
    """Ligne de code source (.asm) correspondant à pc, sinon le désassemblage."""
    try:
        sal = gdb.find_pc_line(pc)
        if sal.symtab is not None and sal.line > 0:
            fname = sal.symtab.fullname()
            if fname not in _src_cache:
                with open(fname, encoding="utf-8", errors="replace") as f:
                    _src_cache[fname] = f.read().splitlines()
            lines = _src_cache[fname]
            if 0 < sal.line <= len(lines):
                txt = lines[sal.line - 1].split(";")[0].strip()
                if txt:
                    return txt
    except Exception:
        pass
    out = gdb.execute("x/i $pc", to_string=True)
    return out.split("\t", 1)[-1].strip() if "\t" in out else out.strip()


def symbol_at(pc):
    """Nom du symbole contenant pc ("calcul"), ou None."""
    try:
        out = gdb.execute("info symbol 0x%x" % pc, to_string=True)
    except gdb.error:
        return None
    if "in section" not in out:
        return None
    return out.split(" in section")[0].split(" + ")[0].strip()


def in_text(sym):
    try:
        out = gdb.execute("info symbol " + sym, to_string=True)
    except gdb.error:
        return False
    return "section .text" in out


def reg(name):
    v = int(gdb.parse_and_eval("$" + name)) & 0xFFFFFFFF
    if HEX:
        return "0x%08x" % v
    return str(v - (1 << 32) if v & 0x80000000 else v)


def out(text):
    # Écrit directement sur la sortie standard, sans passer par le tampon de gdb,
    # pour que le tableau apparaisse avant les lignes affichées par le programme.
    os.write(1, (text + "\n").encode("utf-8"))


def row(label):
    cells = "".join(reg(r).rjust(W) for r in REGS)
    out("%-28s%s" % (label[:28], cells))


def header(func):
    out("")
    out("=== %s ===" % func)
    out("%-28s%s" % ("instruction (exécutée)", "".join(r.rjust(W) for r in REGS)))
    out("-" * (28 + W * len(REGS)))


def pc():
    return int(gdb.parse_and_eval("$pc")) & 0xFFFFFFFF


def esp():
    return int(gdb.parse_and_eval("$esp")) & 0xFFFFFFFF


def trace_function(func):
    header(func)
    row("(entrée dans " + func + ")")
    esp_entree = esp()   # après le `ret` final, esp vaut esp_entree + 4 : on est sorti
    for _ in range(MAX):
        label = source_line(pc())
        step = "nexti" if label.lstrip().startswith("call") else "stepi"
        gdb.execute(step, to_string=True)
        row(label)
        if esp() > esp_entree:
            break
    else:
        out("... tracé interrompu après %d instructions : boucle infinie ?" % MAX)
        return
    out("%-28s%s" % ("retour : eax =", reg("eax")))


def main():
    funcs = [f for f in FUNCS if in_text(f)]
    if not funcs:
        out("trace : aucune fonction à tracer (variable FUNCS vide)")
        return
    for f in funcs:
        gdb.Breakpoint(f)
    try:
        if MODE == "remote":
            gdb.execute("continue", to_string=True)
        else:
            gdb.execute("run < %s" % INFILE if INFILE else "run", to_string=True)
        while True:
            try:
                p = pc()
            except gdb.error:
                break
            sym = symbol_at(p)
            if sym in funcs:
                trace_function(sym)
            gdb.execute("continue", to_string=True)
    except gdb.error as e:
        msg = str(e)
        if "not being run" not in msg and "exited" not in msg:
            out("trace : " + msg)
    out("")


main()
