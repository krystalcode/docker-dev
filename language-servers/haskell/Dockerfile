ARG GHCUP_VERSION="latest"

FROM docker.io/krystalcode/f_ghcup:${GHCUP_VERSION}

ARG GHC_VERSION="9.12.1"
ARG HLS_VERSION="2.9.0.1"

RUN dnf -y install socat && \
    dnf -y clean all && \
    ghcup install hls ${HLS_VERSION} && \
    # Install the latest GHC rather than the recommended.
    ghcup install ghc ${GHC_VERSION} && \
    ghcup set ghc ${GHC_VERSION}

COPY podman/entrypoint.sh /root

ENTRYPOINT ["/root/entrypoint.sh"]

EXPOSE 8893
