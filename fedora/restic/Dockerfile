ARG FEDORA_VERSION="latest"

FROM docker.io/krystalcode/f_atuin:${FEDORA_VERSION}-latest AS atuin

FROM docker.io/krystalcode/f_just:${FEDORA_VERSION}-latest AS just

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

RUN dnf install -y restic rclone && \
    dnf clean all

# Add "atuin".
COPY --from=atuin /usr/bin/atuin /usr/bin/
COPY --from=atuin /root/.bashrc.d/atuin-client.sh /root/.bashrc.d/

# Add "just".
COPY --from=just /usr/bin/just /usr/bin/
