# Assembleur x86 32 bits — Kit de démarrage (ESGI)

Dépôt : https://github.com/youssef-esgi/asm-esgi · Image Docker : `youssefesgi/asm-esgi`

Un seul environnement pour tout le monde, **Mac (Intel ou Apple Silicon), PC Windows, Linux** :
l'image Docker `youssefesgi/asm-esgi` contient `nasm`, `gcc` 32 bits, `gdb` et `make`.
Elle existe en deux variantes choisies automatiquement par Docker :

- `linux/amd64` (PC, Codespaces, Linux) : tout est natif.
- `linux/arm64` (Mac Apple Silicon) : compilation croisée i386, exécution par `qemu-i386`,
  débogage par le stub gdb de qemu. Aucune émulation lente de tout le conteneur.

Les commandes `make`, `make run`, `make test`, `make debug` sont identiques partout.

## Option A — GitHub Codespaces (recommandée, rien à installer)

1. Sur GitHub, bouton **Code → Codespaces → Create codespace**.
2. Attendre l'ouverture de VS Code dans le navigateur (l'image se construit la première fois, ~2 min).
3. Dans le terminal : `cd exercices/ex01-somme-tableau && make check` puis `make test`.

Gratuit 60 h/mois (90 h avec le GitHub Student Pack). Pensez à arrêter le codespace quand vous avez fini.

## Option B — Docker sur votre machine

1. Installer [Docker Desktop](https://www.docker.com/products/docker-desktop/) et le lancer.
2. Cloner ce dépôt, puis dans son dossier (l'image est téléchargée au premier lancement, ~150 Mo) :

```
./dev.sh                 # ouvre un shell Linux x86 dans le conteneur
cd exercices/ex01-somme-tableau
make test
```

Sur Windows, suivre le pas à pas [INSTALL-WINDOWS.md](INSTALL-WINDOWS.md) et lancer `./dev.sh` depuis **Git Bash**.
Vos fichiers restent sur votre machine : le dossier du dépôt est monté dans le conteneur, éditez-les avec votre éditeur habituel.

## Option C — VS Code + Dev Containers (local)

Installer l'extension *Dev Containers*, ouvrir le dossier, accepter *Reopen in Container*.
Même environnement que Codespaces, mais sur votre machine.

## Organisation

```
Dockerfile               recette de l'image youssefesgi/asm-esgi (amd64 + arm64)
.devcontainer/           configuration VS Code / Codespaces (utilise l'image Docker Hub)
dev.sh                   lance le conteneur Docker en local (./dev.sh pull pour mettre à jour)
common.mk                règles make partagées (make / run / test / debug / clean)
tools/run-tests.sh       compare la sortie du programme aux fichiers tests/*.out
tools/check-env.sh       diagnostic de l'environnement (make check)
INSTALL-WINDOWS.md       installation pas à pas sur PC Windows
exercices/exNN-.../      un dossier par exercice : main.c fourni, .asm à compléter, tests/
solutions/               corrigés enseignant (retirer avant distribution)
```

## Conventions du cours

- Syntaxe **Intel**, assembleur **NASM**, format objet `elf32`.
- Code **32 bits** : registres `eax`, `ebx`, ..., pile de mots de 4 octets.
- Convention d'appel **cdecl** : arguments sur la pile, retour dans `eax`,
  `ebx`/`esi`/`edi`/`ebp` à préserver.
- Le `main.c` fait les entrées/sorties ; vous écrivez les fonctions en assembleur.

## Vérifier son installation

Dans n'importe quel dossier d'exercice :

```
make check
```

Le script affiche l'architecture, les versions des outils, compile et exécute un programme minimal.
Si la dernière ligne n'est pas *Environnement prêt*, envoyez la sortie complète à l'enseignant.

## Déboguer avec gdb

```
make debug                                        # arrêt à l'entrée de la 1re fonction globale
make debug BREAK=somme_tableau IN=tests/03-negatifs.in   # choisir la fonction et l'entrée
```

Le programme lit son entrée dans le fichier `IN` (par défaut le premier `tests/*.in`),
ce qui évite de taper les valeurs à la main pendant le débogage.

Commandes utiles dans gdb :

| Commande        | Effet                                       |
|-----------------|---------------------------------------------|
| `si`            | exécute une instruction                     |
| `ni`            | idem, sans entrer dans les `call`           |
| `info registers`| affiche tous les registres                  |
| `p $eax`        | affiche eax (`p/x $eax` en hexadécimal)     |
| `x/4dw $esp`    | 4 mots de 4 octets au sommet de la pile     |
| `x/8xb $esi`    | 8 octets à l'adresse esi                    |
| `c`             | continue jusqu'au prochain point d'arrêt    |
| `q`             | quitte                                      |

Si l'affichage `layout regs` est perturbé, tapez `ctrl-L` pour le redessiner, ou `tui disable`.

### Lire le code sans exécuter

```
gdb ./somme                       # Mac Apple Silicon : gdb-multiarch ./somme
(gdb) list somme_tableau          # source .asm
(gdb) disassemble somme_tableau   # code machine, syntaxe Intel (déjà réglée dans .gdbinit)
```

### gdb à la main

Sur x86_64 (PC, Codespaces) : `gdb ./somme`, puis `break somme_tableau`, puis `run < tests/01-simple.in`.

Sur Mac Apple Silicon, le programme x86 est lancé par `qemu-i386` et gdb s'y connecte ; `run` ne fonctionne pas :

```
qemu-i386 -g 1234 ./somme < tests/01-simple.in &
gdb-multiarch -ex 'set architecture i386' -ex 'target remote localhost:1234' ./somme
(gdb) break somme_tableau
(gdb) continue
```

## Enseignant : reconstruire et publier l'image

```
docker buildx create --name mybuilder --use     # une seule fois
docker buildx build --platform linux/amd64,linux/arm64 -t youssefesgi/asm-esgi:latest --push .
```

## Ajouter un exercice

1. Copier `exercices/ex01-somme-tableau` vers `exercices/ex02-...`.
2. Adapter `PROG`, `ASM`, `CSRC` dans le `Makefile`.
3. Écrire les couples `tests/NOM.in` / `tests/NOM.out`.
