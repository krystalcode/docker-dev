ARG FEDORA_VERSION="latest"

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

ARG GHCUP_VERSION="0.1.30.0"

COPY .bashrc.d/variables.sh /root/.bashrc.d/ghcup-variables.sh

RUN curl -L https://github.com/haskell/ghcup-hs/releases/download/v${GHCUP_VERSION}/x86_64-linux-ghcup-${GHCUP_VERSION} -o /usr/local/bin/ghcup && \
    chmod +x /usr/local/bin/ghcup && \
    dnf install -y \
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
