ARG FEDORA_VERSION="latest"

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

RUN dnf -y install cargo && \
    dnf -y clean all && \
    cargo install atuin

COPY .bashrc.d/atuin.sh /root/.bashrc.d/

ENTRYPOINT ["atuin", "server", "start"]
