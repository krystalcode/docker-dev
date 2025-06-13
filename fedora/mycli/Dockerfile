ARG FEDORA_VERSION="latest"

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

    # Upgrade packages.
RUN dnf -y upgrade && \
    # Install MyCLI.
    dnf -y install python3-pip community-mysql && \
    pip install mycli && \
    # Clean up.
    dnf -y clean all
