ARG FEDORA_VERSION="latest"

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

ARG SQLS_VERSION="latest"

RUN dnf -y install golang && \
    dnf -y clean all && \
    go install github.com/sqls-server/sqls@${SQLS_VERSION}

COPY .bashrc.d/sqls.sh /root/.bashrc.d/

COPY ./entrypoint.sh /root

ENTRYPOINT ["/root/entrypoint.sh"]

EXPOSE 8895
