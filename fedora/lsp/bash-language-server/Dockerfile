ARG FEDORA_VERSION=41

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

RUN dnf -y install nodejs-bash-language-server shfmt && \
    dnf -y clean all
