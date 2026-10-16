# Exercice 01 — Longueur

**Objectif** : écrire la fonction `longueur` dans `longueur.asm`. Elle avance octet par octet
dans `texte` jusqu'à l'octet nul et retourne le nombre de caractères dans `eax`.

Le code complet est dans `corrige.asm` et dans le guide du TP2.

## Commandes

```
make test    # il faut 4 PASS
make run     # tapez un mot
make trace   # suivez eax (la longueur) et esi (l'adresse) tour après tour
```

## Exemple

Entrée `bonjour`, sortie attendue :

```
longueur de "bonjour" = 7
```
