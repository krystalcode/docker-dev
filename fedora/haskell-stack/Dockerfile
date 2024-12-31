ARG GHCUP_VERSION="latest"

FROM docker.io/krystalcode/f_ghcup:${GHCUP_VERSION}

ARG GHC_VERSION="recommended"
ARG STACK_VERSION="recommended"
ARG CABAL_VERSION="recommended"
ARG HLS_VERSION="recommended"

RUN ghcup install ghc --set ${GHC_VERSION} && \
    ghcup install stack --set ${STACK_VERSION} && \
    ghcup install cabal --set ${CABAL_VERSION} && \
    ghcup install hls --set ${HLS_VERSION}
