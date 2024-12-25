ARG FEDORA_VERSION="41"

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

RUN dnf -y install nodejs-bash-language-server shfmt socat && \
    dnf -y clean all

COPY ./entrypoint.sh /root

ENTRYPOINT ["/root/entrypoint.sh"]

EXPOSE 8892
