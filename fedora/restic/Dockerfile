FROM krystalcode/f_fedora

RUN dnf install -y restic && \
    dnf clean all && \
    restic self-update
