# Installation sur Windows (PC)

Durée : 15 à 30 minutes, dont un ou deux redémarrages.

**L'installation se fait en classe**, au début de la première séance, avec l'enseignant. N'installez rien seul chez vous : en cas de blocage, vous perdriez du temps sans aide. Ce document est le pas à pas que nous suivrons ensemble, et il vous servira ensuite de référence.

Une seule chose à préparer avant de venir : créer un compte Docker Hub gratuit (§ 6).

Si votre PC refuse Docker (voir *Dépannage*), utilisez l'option GitHub Codespaces décrite dans le README : rien à installer.

## 1. Prérequis : Windows 10 (21H2 ou plus) ou Windows 11, 64 bits

Vérifier : `Paramètres → Système → Informations` (ou touche Windows + Pause).
Il faut aussi au moins 8 Go de RAM et 10 Go de disque libre.

## 2. Activer WSL 2

Ouvrir **PowerShell en administrateur** (clic droit sur le menu Démarrer → *Terminal (admin)*), puis :

```
wsl --install
```

Redémarrer le PC quand c'est demandé. Au redémarrage, une fenêtre Ubuntu peut s'ouvrir et demander un nom d'utilisateur et un mot de passe : choisissez ce que vous voulez, ce n'est pas utilisé par le cours.

Vérifier ensuite dans PowerShell :

```
wsl --status
```

La ligne *Version par défaut : 2* doit apparaître.

## 3. Installer Docker Desktop

1. Télécharger l'installateur : https://www.docker.com/products/docker-desktop/ (bouton *Download for Windows – AMD64*).
2. Lancer l'installateur, laisser cochée l'option **Use WSL 2 instead of Hyper-V**.
3. Redémarrer si demandé, puis lancer **Docker Desktop** depuis le menu Démarrer.
4. Accepter la licence, passer les écrans de connexion (un compte n'est pas obligatoire, mais recommandé, voir § 6).
5. Attendre que l'icône de la baleine en bas à droite soit stable et que la fenêtre affiche *Engine running*.

## 4. Installer Git pour Windows (pour la commande `./dev.sh`)

1. Télécharger : https://git-scm.com/download/win
2. Installer en gardant toutes les options par défaut. Cela installe **Git Bash**, le terminal que nous utiliserons.

## 5. Récupérer le dépôt et tester

Ouvrir **Git Bash** (menu Démarrer → *Git Bash*), puis :

```
cd ~/Documents
git clone https://github.com/youssef-esgi/asm-esgi.git assembleur
cd assembleur
./dev.sh
```

La première fois, Docker télécharge l'image du cours (environ 150 Mo). Vous obtenez ensuite un terminal Linux avec l'invite `root@...:/work#`. Tapez :

```
cd exercices/ex01-somme-tableau
make check
```

Si la dernière ligne est **Environnement prêt**, tout est bon. Tapez `exit` pour sortir du conteneur.

## 6. Créer un compte Docker Hub (recommandé)

Sans compte, Docker Hub limite les téléchargements d'images à 100 par 6 heures **par adresse IP**. En salle de TD, toute la classe partage la même adresse : le téléchargement peut échouer avec `toomanyrequests`.

1. Créer un compte sur https://hub.docker.com
2. Dans Git Bash : `docker login`, puis entrer identifiant et mot de passe.

Ou plus simple : faites le § 5 chez vous, l'image sera déjà sur votre PC en arrivant en TD.

## 7. Éditer les fichiers

Éditez les fichiers `.asm` avec l'éditeur de votre choix (VS Code recommandé, avec l'extension *x86 and x86_64 Assembly*).
Les fichiers sont dans `Documents\assembleur` sur votre PC ; le conteneur les voit en direct dans `/work`. Pas besoin de copier quoi que ce soit.

Alternative tout-en-un : dans VS Code, installer l'extension **Dev Containers**, ouvrir le dossier `assembleur`, puis accepter *Reopen in Container*. Le terminal intégré de VS Code est alors directement dans le conteneur.

## Dépannage

| Symptôme | Cause probable | Solution |
|---|---|---|
| `wsl --install` : *WSL n'est pas pris en charge* ou erreur de virtualisation | Virtualisation désactivée dans le BIOS/UEFI | Redémarrer, entrer dans le BIOS (F2, F10, Suppr ou Échap selon la marque), activer *Intel VT-x* / *AMD-V* / *SVM Mode*, enregistrer |
| Docker Desktop : *WSL 2 installation is incomplete* | Noyau WSL manquant | Dans PowerShell admin : `wsl --update`, puis redémarrer Docker Desktop |
| Docker Desktop reste sur *Starting...* pendant plusieurs minutes | Conflit avec un antivirus ou avec VirtualBox/VMware | Fermer VirtualBox/VMware, redémarrer le PC ; en dernier recours désinstaller/réinstaller Docker Desktop |
| `./dev.sh` : *docker: command not found* dans Git Bash | Docker Desktop pas lancé ou PATH non mis à jour | Lancer Docker Desktop, fermer et rouvrir Git Bash |
| `./dev.sh` : *the input device is not a TTY* | Lancé depuis PowerShell ou cmd | Utiliser Git Bash, ou préfixer avec `winpty ./dev.sh` |
| `./dev.sh` : *permission denied* | Fichier sans droit d'exécution | Taper `bash dev.sh` à la place |
| `toomanyrequests: You have reached your pull rate limit` | Limite Docker Hub atteinte (salle de TD) | `docker login` avec un compte Docker Hub, ou attendre 6 h, ou tirer l'image chez soi |
| Le conteneur ne voit pas mes fichiers modifiés | Dépôt cloné hors de `C:\Users\<vous>` | Cloner le dépôt dans `Documents` ; dans Docker Desktop → *Settings → Resources → File sharing*, vérifier que le lecteur est partagé |
| Le PC est un Windows ARM (Surface Pro X, ...) | Docker Desktop tourne mais l'image arm64 est utilisée | Ça fonctionne : c'est la même variante que les Mac Apple Silicon |
| PC de l'école sans droits administrateur | Impossible d'installer Docker | Utiliser GitHub Codespaces (voir README), ou Git Bash + un serveur SSH fourni par l'enseignant |
