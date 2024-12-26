ARG GHCUP_VERSION="latest"

FROM docker.io/krystalcode/f_ghcup:${GHCUP_VERSION}

# Unless otherwise specified, use the latest HLS version.
ARG HLS_VERSION="2.9.0.1"
# Unless otherwise specified, use the latest GHC version that has a
# corresponding binary for the latest version of HLS. That might be neither the
# recommended nor the latest GHC version.
ARG GHC_VERSION="9.10.1"

RUN dnf -y install socat && \
    dnf -y clean all && \
    ghcup install hls --set ${HLS_VERSION} && \
    # Install the requested GHC if not provided by the base image.
    ghcup install ghc --set ${GHC_VERSION}

COPY ./entrypoint.sh /root

ENTRYPOINT ["/root/entrypoint.sh"]

EXPOSE 8893
