ARG FEDORA_VERSION=38

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

ARG LAGOON_VERSION 0.17.0

RUN dnf -y install rsync && \
    dnf -y clean all && \
    curl -L "https://github.com/uselagoon/lagoon-cli/releases/download/v${LAGOON_VERSION}/lagoon-cli-v${LAGOON_VERSION}-linux-amd64" -o /usr/local/bin/lagoon && \
    chmod +x /usr/local/bin/lagoon

COPY .bashrc.d/lagoon.aliases.sh /root/.bashrc.d/
COPY ssh-config /root/.ssh/config
COPY rsync.to.sh /usr/local/bin/rsync.to
