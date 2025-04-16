ARG FEDORA_VERSION="latest"

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

ENV NVM_VERSION="v0.40.2"

    # Install OS packages required.
    # Install "git", "make" and "gcc-c++", required by "npm" for installing some
    # packages.
RUN dnf -y install git make gcc-c++ && \
    dnf clean all && \
    # Install "nvm".
    #
    # Move its Bash configuration to a separate file. The installation script
    # adds it directly at the end of `.bashrc`, so we strip out. Strangely, when
    # we direct the output of `sed` (or `head -n -3` - if we were to use that)
    # to overwrite the file, it is emptied. We therefore use a temporary file.
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/{$NVM_VERSION}/install.sh | bash && \
    sed -e :a -e '$d;N;2,3ba' -e 'P;D' ~/.bashrc > /tmp/.bashrc && \
    mv -f /tmp/.bashrc ~/.bashrc

COPY .bashrc.d/nvm.sh /root/.bashrc.d/
