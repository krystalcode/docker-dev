FROM docker.io/krystalcode/f_fedora

    # Upgrade packages.
RUN dnf -y upgrade && \
    # Install MyCLI.
    dnf -y install python3-pip community-mysql && \
    pip install mycli && \
    # Clean up.
    dnf -y clean all
