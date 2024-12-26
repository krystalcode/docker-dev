ARG GHCUP_VERSION="latest"

FROM docker.io/krystalcode/f_ghcup:${GHCUP_VERSION}

ARG GHC_VERSION="9.12.1"
ARG HLS_VERSION="2.9.0.1"

RUN dnf -y install socat && \
    dnf -y clean all && \
    ghcup install hls --set ${HLS_VERSION} && \
    # Install the requested GHC if not provided by the base image.
    ghcup install ghc --set ${GHC_VERSION}

COPY podman/entrypoint.sh /root

ENTRYPOINT ["/root/entrypoint.sh"]

EXPOSE 8893
