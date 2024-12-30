ARG GHCUP_VERSION="latest"

FROM docker.io/krystalcode/f_ghcup:${GHCUP_VERSION}

ARG HLS_VERSION="recommended"
ARG CABAL_VERSION="recommended"

RUN dnf -y install socat && \
    dnf -y clean all && \
    ghcup install hls --set ${HLS_VERSION} && \
    ghcup install cabal --set ${CABAL_VERSION}

COPY ./entrypoint.sh /root

ENTRYPOINT ["/root/entrypoint.sh"]

EXPOSE 8893
