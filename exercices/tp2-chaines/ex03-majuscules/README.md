# Exercice 03 — Majuscules

**Objectif** : écrire la fonction `majuscules` dans `majuscules.asm`. Elle remplace,
directement dans `texte`, chaque lettre minuscule par sa majuscule. Les autres caractères
ne changent pas.

Le code complet est dans `corrige.asm` et dans le guide du TP2.

## Commandes

```
make test    # il faut 4 PASS
make run     # tapez un mot
make trace   # suivez eax (l'octet courant) ; les sauts jl / jg enjambent le sub
```

## Exemple

Entrée `Esgi-2026`, sortie attendue :

```
ESGI-2026
```
