FROM krystalcode/f_fedora

ENV NVM_VERSION 0.31.2

    # Install OS packages required.
    # Git is frequently required by npm for installing various packages.
RUN dnf -y install git && \
    dnf clean all && \
    # Install "nvm".
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v{$NVM_VERSION}/install.sh | bash
