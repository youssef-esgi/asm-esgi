#!/usr/bin/env bash
# Usage : [RUNNER=qemu-i386] run-tests.sh <executable> <dossier tests>
# Pour chaque tests/NOM.in, exécute le programme avec ce fichier sur stdin
# et compare stdout avec tests/NOM.out. Code de retour 0 si tout passe.
prog="$1"; dir="$2"
pass=0; fail=0
shopt -s nullglob
for in_file in "$dir"/*.in; do
    name=$(basename "$in_file" .in)
    expected="$dir/$name.out"
    [ -f "$expected" ] || { echo "??  $name : pas de fichier .out"; continue; }
    actual=$(timeout 10 ${RUNNER:-} "$prog" < "$in_file" 2>&1); code=$?
    if [ $code -eq 124 ]; then
        echo "FAIL $name : délai dépassé (boucle infinie ?)"; fail=$((fail+1)); continue
    fi
    if [ "$actual" = "$(cat "$expected")" ]; then
        echo "PASS $name"; pass=$((pass+1))
    else
        echo "FAIL $name"
        diff <(echo "$actual") "$expected" | sed 's/^/     /' | head -20
        fail=$((fail+1))
    fi
done
echo "-----"
echo "$pass réussi(s), $fail échoué(s)"
[ $fail -eq 0 ]
