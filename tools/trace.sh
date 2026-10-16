#!/usr/bin/env bash
# Usage : trace.sh <executable>
# Variables attendues (positionnées par common.mk) :
#   GDB, RUNNER, GDBPORT, TRACE_FUNCS, TRACE_IN, TRACE_HEX
# Sur x86_64, gdb lance le programme ; sur arm64 (Mac Apple Silicon), qemu-i386 le lance
# et gdb-multiarch s'y connecte. Dans les deux cas, tools/trace.py fait l'affichage.
set -e
prog="$1"
here="$(cd "$(dirname "$0")" && pwd)"
export TRACE_FUNCS TRACE_IN TRACE_HEX
# Lignes de gdb sans intérêt pour l'étudiant (points d'arrêt, noms de frame, avertissements)
BRUIT='^(Breakpoint [0-9]+|Temporary breakpoint|Remote debugging using|The target architecture|0x[0-9a-f]+ in |\[Inferior .* exited|warning: |[A-Za-z_.][A-Za-z0-9_.]* \(\)$|$)'

if [ -z "$RUNNER" ]; then
    TRACE_MODE=run "$GDB" -q -batch -ex "source $here/trace.py" "$prog" 2>&1 \
        | grep --line-buffered -v -E "$BRUIT"
else
    "$RUNNER" -g "${GDBPORT:-1234}" "$prog" < "${TRACE_IN:-/dev/null}" &
    qpid=$!
    TRACE_MODE=remote "$GDB" -q -batch \
        -ex 'set architecture i386' \
        -ex "target remote localhost:${GDBPORT:-1234}" \
        -ex "source $here/trace.py" "$prog" 2>&1 \
        | grep --line-buffered -v -E "$BRUIT"
    wait $qpid 2>/dev/null || true
fi
