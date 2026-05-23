ARG FEDORA_VERSION="latest"

FROM krystalcode/f_fedora:${FEDORA_VERSION}

RUN dnf install -y restic rclone && \
    dnf clean all
