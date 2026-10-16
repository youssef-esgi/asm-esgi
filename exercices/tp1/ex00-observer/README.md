# Exercice 00 — Observer

**Objectif** : lire un programme en assembleur et prédire ce qu'il fait. Rien à écrire.

1. Ouvrir `observer.asm`. Remplir le tableau ci-dessous **à la main**, ligne par ligne.
2. Lancer `make trace` : la machine affiche le même tableau. Comparer.
3. Lancer `make run` : le programme affiche `calcul() = ...`.

| instruction exécutée | eax | edx | ecx |
|----------------------|-----|-----|-----|
| (entrée)             | ?   | ?   | ?   |
| `mov eax, 10`        |     |     |     |
| `mov edx, 3`         |     |     |     |
| `add eax, edx`       |     |     |     |
| `sub eax, 5`         |     |     |     |
| `imul eax, edx`      |     |     |     |
| `mov ecx, eax`       |     |     |     |
| `sub ecx, 4`         |     |     |     |
| `add eax, ecx`       |     |     |     |
| `ret`                |     |     |     |

## Commandes

```
make trace   # exécute instruction par instruction et affiche les registres
make run     # exécute et affiche le résultat
make test    # vérifie le résultat attendu
```

## Pour aller plus loin

Modifier une valeur (par exemple `mov edx, 3` → `mov edx, 4`), prédire le nouveau résultat, vérifier avec `make trace`.
