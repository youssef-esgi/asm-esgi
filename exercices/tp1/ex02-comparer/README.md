# Exercice 02 — Comparer

**Objectif** : écrire `maximum` (le plus grand de `a` et `b`) et `absolu` (la valeur absolue de `a`)
dans `comparer.asm`. Nouveauté : `cmp` et les sauts conditionnels (`jge`, `jl`, ...).

Le code complet est dans `corrige.asm` et dans le guide du TP1.

## Commandes

```
make test    # il faut 4 PASS
make run     # tapez deux entiers, par exemple : 3 7
make trace   # observez le saut : la ligne `mov eax, ebx` n'apparaît que si a < b
```

## Exemple

Entrée `-3 7`, sortie attendue :

```
maximum = 7
absolu  = 3
```

## Pour aller plus loin

Ajouter `signe` qui retourne -1, 0 ou 1 (code à la fin de `corrige.asm`).
