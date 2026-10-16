# Exercice 00 — Octets

**Objectif** : écrire deux fonctions d'une ligne dans `octets.asm` : `code_premier` et `code_troisieme`.
Elles retournent dans `eax` le code ASCII du premier et du troisième caractère du mot lu par `main.c`.

Le code complet est dans `corrige.asm` et dans le guide du TP2.

## Commandes

```
make test    # il faut 4 PASS
make run     # tapez un mot, par exemple : bonjour
make trace   # affiche les registres instruction par instruction
```

## Exemple

Entrée `bonjour`, sortie attendue :

```
premier   : 'b' = 98
troisieme : 'n' = 110
```
