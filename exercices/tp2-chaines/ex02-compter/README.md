# Exercice 02 — Compter

**Objectif** : écrire la fonction `compter` dans `compter.asm`. Elle retourne dans `eax`
le nombre de fois où le caractère `c` apparaît dans `texte`.

Le code complet est dans `corrige.asm` et dans le guide du TP2.

## Commandes

```
make test    # il faut 4 PASS
make run     # tapez un caractère puis un mot, par exemple : a banane
make trace   # suivez eax (le compte) ; make trace HEX=1 pour lire dl dans edx
```

## Exemple

Entrée `a banane`, sortie attendue :

```
'a' apparait 2 fois dans "banane"
```
