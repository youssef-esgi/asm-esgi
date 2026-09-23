# Règles communes à tous les exercices. Chaque exercice a un Makefile de 4 lignes qui inclut ce fichier.
#   make          compile l'exécutable (x86 32 bits, lié statiquement)
#   make run      compile puis exécute (entrée clavier)
#   make test     compile puis lance les tests de tests/*.in contre tests/*.out
#   make debug    compile puis ouvre gdb, arrêté à l'entrée de la fonction BREAK,
#                 avec le fichier IN sur l'entrée standard (défaut : premier tests/*.in)
#                 ex : make debug BREAK=somme_tableau IN=tests/03-negatifs.in
#   make clean    supprime les fichiers générés
#   make check    vérifie l'environnement (architecture, versions des outils, compilation d'un test)
#
# Variables attendues dans le Makefile de l'exercice :
#   PROG   nom de l'exécutable
#   ASM    fichiers .asm de l'élève
#   CSRC   fichiers .c fournis (entrées/sorties)
#   BREAK  (optionnel) symbole où gdb s'arrête (défaut : premier symbole global de ASM)
#
# Portabilité : sur une machine x86_64 tout est natif ; sur arm64 (Mac Apple Silicon)
# on compile avec gcc croisé, on exécute avec qemu-i386 et on débogue via son stub gdb.

ARCH := $(shell uname -m)
ifeq ($(ARCH),x86_64)
  CC      = gcc
  RUNNER  :=
  GDB     := gdb
else
  CC      = i686-linux-gnu-gcc
  RUNNER  := qemu-i386
  GDB     := gdb-multiarch
endif
NASM      ?= nasm
NASMFLAGS  = -f elf32 -g -F dwarf
CFLAGS     = -m32 -g -O0 -Wall -Wextra -fno-pie
LDFLAGS    = -m32 -static -no-pie -Wl,-z,noexecstack

ROOT   := $(dir $(lastword $(MAKEFILE_LIST)))
OBJ    := $(ASM:.asm=.o) $(CSRC:.c=.o)
BREAK  ?= $(shell grep -h -m1 -E '^\s*global\s+' $(ASM) | awk '{print $$2}')
IN     ?= $(firstword $(wildcard tests/*.in))
GDBPORT ?= 1234

.PHONY: all run test debug clean check

all: $(PROG)

$(PROG): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

run: $(PROG)
	$(RUNNER) ./$(PROG)

test: $(PROG)
	@RUNNER="$(RUNNER)" $(ROOT)tools/run-tests.sh ./$(PROG) tests

ifeq ($(ARCH),x86_64)
debug: $(PROG)
	$(GDB) -q -ex 'break $(BREAK)' -ex 'layout regs' -ex 'run < $(IN)' ./$(PROG)
else
debug: $(PROG)
	@echo ">> qemu-i386 en attente de gdb sur le port $(GDBPORT) (entrée : $(IN))"
	@$(RUNNER) -g $(GDBPORT) ./$(PROG) < $(IN) & \
	$(GDB) -q -ex 'set architecture i386' -ex 'target remote localhost:$(GDBPORT)' \
	       -ex 'break $(BREAK)' -ex 'layout regs' -ex 'continue' ./$(PROG); \
	wait
endif

clean:
	rm -f $(PROG) $(OBJ)

check:
	@$(ROOT)tools/check-env.sh "$(ARCH)" "$(CC)" "$(RUNNER)" "$(GDB)"
