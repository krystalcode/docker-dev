ARG FEDORA_VERSION="latest"

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

ARG GHCUP_VERSION="latest"
ENV GHCUP_REPO="haskell/ghcup-hs"

RUN <<COMMAND
set -eux
if [ "${GHCUP_VERSION}" = "latest" ];
then
    GHCUP_VERSION=$(curl --silent "https://api.github.com/repos/${GHCUP_REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
fi
# Remove the "v" version prefix, as required by the file downloaded by `curl`
# below.
GHCUP_VERSION=${GHCUP_VERSION#?}
# Downloading the file on a separate `RUN` command fails as Not Found,
# `GCHUP_VERSION` is likely not available with the value calculated here.
curl -L https://github.com/haskell/ghcup-hs/releases/download/v${GHCUP_VERSION}/x86_64-linux-ghcup-${GHCUP_VERSION} -o /usr/local/bin/ghcup
chmod +x /usr/local/bin/ghcup
COMMAND

RUN dnf install -y \
    gcc \
    gcc-c++ \
    gmp \
    gmp-devel \
    make \
    ncurses \
    ncurses-compat-libs \
    xz \
    perl && \
    dnf -y clean all

COPY .bashrc.d/variables.sh /root/.bashrc.d/ghcup-variables.sh
