# Exercice 04 — Appeler

**Objectif** : écrire `carre` (une ligne) et `somme_carres` dans `appeler.asm`.
`somme_carres` appelle deux fois `carre` avec `call` et retourne a*a + b*b dans `eax`.

Le code complet est dans `corrige.asm` et dans le guide du TP2.

## Commandes

```
make test    # il faut 4 PASS
make run     # tapez deux entiers, par exemple : 3 4
make trace   # on voit le saut dans carre et le retour après chaque call
```

## Exemple

Entrée `3 4`, sortie attendue :

```
3*3 + 4*4 = 25
```
