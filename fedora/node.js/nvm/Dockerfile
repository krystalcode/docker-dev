ARG FEDORA_VERSION="latest"

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

ENV NVM_VERSION="v0.40.2"

    # Install OS packages required.
    # Install "git", "make" and "gcc-c++", required by "npm" for installing some
    # packages.
RUN dnf -y install git make gcc-c++ && \
    dnf clean all && \
    # Install "nvm".
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/{$NVM_VERSION}/install.sh | bash
