FROM krystalcode/f_fedora

RUN dnf install -y restic rclone && \
    dnf clean all && \
    restic self-update
