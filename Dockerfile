# Environnement Assembleur x86 32 bits — ESGI
# Image multi-architecture (docker buildx) : youssefesgi/asm-esgi
#   linux/amd64 : nasm + gcc -m32 + gdb natifs            (PC, Codespaces, Linux)
#   linux/arm64 : nasm + gcc croisé i686 + qemu-i386 + gdb-multiarch (Mac Apple Silicon)
# Dans les deux cas, les commandes `make`, `make run`, `make test`, `make debug`
# sont identiques : common.mk choisit les bons outils.
FROM debian:bookworm-slim
ARG TARGETARCH

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        nasm make ca-certificates git less vim-tiny \
    && if [ "$TARGETARCH" = "amd64" ]; then \
         apt-get install -y --no-install-recommends gcc gcc-multilib libc6-dev-i386 gdb ; \
       else \
         apt-get install -y --no-install-recommends \
             gcc-i686-linux-gnu libc6-dev-i386-cross qemu-user gdb-multiarch ; \
       fi \
    && rm -rf /var/lib/apt/lists/*

RUN printf 'set disassembly-flavor intel\nset auto-load safe-path /\nset confirm off\n' > /root/.gdbinit

WORKDIR /work
CMD ["bash"]
