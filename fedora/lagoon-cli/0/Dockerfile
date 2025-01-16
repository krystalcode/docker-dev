ARG FEDORA_VERSION=38

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

ARG LAGOON_VERSION 0.17.0

RUN dnf -y install rsync && \
    dnf -y clean all && \
    curl -L "https://github.com/uselagoon/lagoon-cli/releases/download/v${LAGOON_VERSION}/lagoon-cli-v${LAGOON_VERSION}-linux-amd64" -o /usr/local/bin/lagoon && \
    chmod +x /usr/local/bin/lagoon

COPY .bashrc.d/lagoon.aliases.sh /root/.bashrc.d/
COPY ssh-config /root/.ssh/config
# This file needs to be created manually every time, so let's make sure it
# exists here. There's no indication that we need to maintain it across
# builds/runs, if that's the case we can leave it to the user to add it to a
# volume.
COPY ssh-known-hosts /root/.ssh/known_hosts
COPY rsync.to.sh /usr/local/bin/rsync.to
