FROM krystalcode/f_fedora

    # Install stack.
RUN dnf -y install stack && \
    # Install other packages needed for development.
    dnf -y install git && \

    # Clean up.
    dnf -y clean all
