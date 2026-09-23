#!/usr/bin/env bash
# Diagnostic de l'environnement : appelé par `make check`.
# Usage : check-env.sh <arch> <cc> <runner> <gdb>
arch="$1"; cc="$2"; runner="$3"; gdb="$4"
ok=0; ko=0
green() { printf '\033[32mOK  \033[0m %s\n' "$1"; ok=$((ok+1)); }
red()   { printf '\033[31mKO  \033[0m %s\n' "$1"; ko=$((ko+1)); }

echo "Architecture du conteneur : $arch"
[ -f /.dockerenv ] && green "exécution dans Docker" || echo "     (hors Docker : environnement non standard)"

for tool in nasm make "$cc" "$gdb" ${runner:+$runner}; do
    if command -v "$tool" >/dev/null 2>&1; then
        green "$tool : $("$tool" --version 2>&1 | head -1 | cut -c1-60)"
    else
        red "$tool introuvable"
    fi
done

# Compilation + exécution d'un programme minimal
tmp=$(mktemp -d)
cat > "$tmp/t.asm" <<'ASM'
global val
section .text
val:
    mov eax, 42
    ret
ASM
cat > "$tmp/t.c" <<'C'
#include <stdio.h>
int val(void);
int main(void){ printf("%d\n", val()); return 0; }
C
if nasm -f elf32 -o "$tmp/t.o" "$tmp/t.asm" 2>"$tmp/err" \
   && "$cc" -m32 -static -no-pie -Wl,-z,noexecstack -o "$tmp/t" "$tmp/t.o" "$tmp/t.c" 2>>"$tmp/err"; then
    green "compilation nasm + $cc"
    out=$($runner "$tmp/t" 2>&1)
    if [ "$out" = "42" ]; then
        green "exécution ${runner:+via $runner }: résultat 42"
    else
        red "exécution : attendu 42, obtenu '$out'"
    fi
else
    red "compilation : $(head -3 "$tmp/err")"
fi

# Le montage du dépôt est-il en écriture ?
if touch "$(dirname "$0")/.w" 2>/dev/null; then rm -f "$(dirname "$0")/.w"; green "dossier du dépôt accessible en écriture"
else red "dossier du dépôt en lecture seule (problème de montage Docker)"; fi

rm -rf "$tmp"
echo "-----"
if [ $ko -eq 0 ]; then echo "Environnement prêt ($ok vérifications)."; else echo "$ko problème(s) : envoyez cette sortie à l'enseignant."; exit 1; fi
