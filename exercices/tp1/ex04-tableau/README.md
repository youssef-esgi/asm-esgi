# Exercice 04 — Tableau

**Objectif** : écrire `somme_tableau` dans `tableau.asm` : elle additionne les `n` entiers du tableau.
Nouveauté : une adresse dans `esi`, lue avec `[esi]`, avancée de 4 octets à chaque tour.

C'est la boucle de l'exercice 03, avec une adresse en plus. Le code complet est dans `corrige.asm`
et dans le guide du TP1.

## Commandes

```
make test     # il faut 4 PASS
make run      # tapez n, puis les n entiers : 3 puis 1 2 3
make trace    # observez esi avancer de 4 en 4 (make trace HEX=1 pour voir les adresses en hexadécimal)
```

## Exemple

Entrée :

```
3
1 2 3
```

Sortie attendue :

```
somme = 6
```

## Pour aller plus loin

Ajouter `maximum_tableau` (code à la fin de `corrige.asm`), avec sa déclaration et son `printf` dans `main.c`.
