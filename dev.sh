#!/usr/bin/env bash
# Lance l'environnement du cours dans Docker (Mac Intel/Apple Silicon, Linux, Windows via Git Bash ou WSL).
#   ./dev.sh                 -> shell interactif dans le conteneur
#   ./dev.sh make test       -> exécute une commande dans le conteneur (à la racine du dépôt)
#   ./dev.sh pull            -> récupère la dernière version de l'image depuis Docker Hub
#   ./dev.sh build           -> reconstruit l'image localement depuis le Dockerfile (enseignant)
set -e
cd "$(dirname "$0")"
IMAGE=${IMAGE:-youssefesgi/asm-esgi:latest}

case "$1" in
    pull)  docker pull "$IMAGE"; exit 0 ;;
    build) docker build -t "$IMAGE" .; exit 0 ;;
esac

if ! docker image inspect "$IMAGE" >/dev/null 2>&1; then
    docker pull "$IMAGE" || docker build -t "$IMAGE" .
fi

TTY=""
[ -t 0 ] && TTY="-it"
exec docker run --rm $TTY \
    --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
    -v "$PWD":/work -w /work "$IMAGE" "$@"
