# Exercice 05 — Afficher (bonus)

*À faire une fois que les exercices 00 à 04 passent tous leurs tests.*

**Objectif** : écrire la fonction `afficher` dans `afficher.asm`. Elle écrit les octets de
`texte` à l'écran par l'appel système `write` (`int 0x80`), sans `printf`.

Le code complet est dans `corrige.asm` et dans le guide du TP2.

## Commandes

```
make test    # il faut 3 PASS
make run     # tapez un mot
make trace   # les quatre registres se remplissent, puis int 0x80 ; eax contient ensuite
             # le nombre d'octets écrits (la réponse du système)
```

## Exemple

Entrée `bonjour`, sortie attendue :

```
bonjour
(7 octet(s) ecrit(s) par l'appel systeme)
```
