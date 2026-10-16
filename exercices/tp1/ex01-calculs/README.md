# Exercice 01 — Calculs

**Objectif** : écrire trois fonctions de 2 lignes dans `calculs.asm` : `somme`, `difference`, `produit`.
Elles lisent les variables `a` et `b` (remplies par `main.c`) et laissent le résultat dans `eax`.

Le code complet est dans `corrige.asm` et dans le guide du TP1. Lisez-le, comprenez chaque ligne,
puis recopiez-le dans `calculs.asm`.

## Commandes

```
make test    # lance les tests : il faut 4 PASS
make run     # tapez deux entiers, par exemple : 7 5
make trace   # affiche les registres instruction par instruction
```

## Exemple

Entrée `7 5`, sortie attendue :

```
somme      = 12
difference = 2
produit    = 35
```

## Pour aller plus loin

Ajouter `quotient` (a / b). Le code est à la fin de `corrige.asm` ; il faut aussi ajouter
dans `main.c` la ligne `int quotient(void);` et un `printf`.
