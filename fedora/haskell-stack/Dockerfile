ARG FEDORA_VERSION="latest"
ARG GHCUP_VERSION="latest"

FROM docker.io/krystalcode/f_atuin:${FEDORA_VERSION}-latest AS atuin

FROM docker.io/krystalcode/f_just:${FEDORA_VERSION}-latest AS just

FROM docker.io/krystalcode/f_ghcup:${GHCUP_VERSION}

ARG GHC_VERSION="recommended"
ARG STACK_VERSION="recommended"
ARG CABAL_VERSION="recommended"
ARG HLS_VERSION="recommended"

RUN ghcup install ghc --set ${GHC_VERSION} && \
    ghcup install stack --set ${STACK_VERSION} && \
    ghcup install cabal --set ${CABAL_VERSION} && \
    ghcup install hls --set ${HLS_VERSION}

# Add "atuin".
COPY --from=atuin /usr/bin/atuin /usr/bin/
COPY --from=atuin /root/.bashrc.d/atuin-client.sh /root/.bashrc.d/

# Add "just".
COPY --from=just /usr/bin/just /usr/bin/
