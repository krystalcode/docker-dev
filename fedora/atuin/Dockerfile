ARG FEDORA_VERSION="latest"

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION} AS cargo

RUN dnf -y install cargo && \
    dnf -y clean all && \
    cargo install atuin

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

COPY --from=cargo /root/.cargo/bin/atuin /usr/bin/

ENTRYPOINT ["/usr/bin/atuin", "server", "start"]
