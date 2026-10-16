# Exercice 03 — Boucle

**Objectif** : écrire `somme_1_a_n` dans `boucle.asm` : elle calcule 1 + 2 + ... + n avec une boucle.
Nouveauté : un compteur dans `ecx`, `dec`, et un saut en arrière (`jmp boucle`).

Le code complet est dans `corrige.asm` et dans le guide du TP1.

## Commandes

```
make test                     # il faut 4 PASS
make run                      # tapez un entier, par exemple : 5
make trace                    # suivez eax et ecx tour après tour (entrée : tests/01-simple.in)
make trace IN=tests/03-zero.in   # cas n = 0 : la boucle ne doit pas s'exécuter
```

## Exemple

Entrée `5`, sortie attendue :

```
somme de 1 a 5 = 15
```

## Pour aller plus loin

Ajouter `factorielle` (code à la fin de `corrige.asm`), avec sa déclaration et son `printf` dans `main.c`.
