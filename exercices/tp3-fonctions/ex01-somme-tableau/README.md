# Exercice 01 — Somme d'un tableau

**Objectif** : écrire la fonction `somme_tableau` dans `somme.asm`.
Elle reçoit l'adresse d'un tableau d'entiers 32 bits et son nombre d'éléments,
et retourne la somme dans `eax`.

`addition` est fournie comme modèle de fonction cdecl : lisez-la avant de commencer.

## Commandes

```
make        # compile
make run    # exécute : tapez n, puis les n entiers
make test   # lance les tests automatiques
make debug  # gdb, arrêté à l'entrée de addition (tapez `si` pour avancer, `q` pour quitter)
make check  # vérifie que l'environnement fonctionne
```

## Format d'entrée

```
3
1 2 3
```

Sortie attendue :

```
addition(2, 3) = 5
somme = 6
```

## Pour aller plus loin

1. Écrire `int maximum(const int *t, int n)`.
2. Réécrire la boucle avec `[esi + ecx*4]` (adressage indexé) au lieu d'avancer `esi`.
