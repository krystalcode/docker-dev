ARG GHCUP_VERSION="latest"

FROM docker.io/krystalcode/f_ghcup:${GHCUP_VERSION}

# Unless otherwise specified, use the latest HLS version.
ARG HLS_VERSION="2.9.0.1"
# Unless otherwise specified, use the latest GHC version that has a
# corresponding binary for the latest version of HLS. That might be neither the
# recommended nor the latest GHC version.
ARG GHC_VERSION="9.10.1"
# Unless otherwise specified, use the recommended Cabal version. Cabal is
# required as well otherwise the language server raises an error when the client
# tries to connect.
ARG CABAL_VERSION="3.14.1.0"

RUN dnf -y install socat && \
    dnf -y clean all && \
    ghcup install ghc --set ${GHC_VERSION} && \
    ghcup install hls --set ${HLS_VERSION} && \
    ghcup install cabal --set ${CABAL_VERSION}

COPY ./entrypoint.sh /root

ENTRYPOINT ["/root/entrypoint.sh"]

EXPOSE 8893
