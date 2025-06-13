ARG FEDORA_VERSION="latest"

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

ARG LAGOON_VERSION="latest"

RUN dnf -y install rsync && \
    dnf -y clean all

ENV LAGOON_CLI_REPO="uselagoon/lagoon-cli"
ENV LAGOON_CLI_VERSION="latest"
RUN <<COMMAND
set -eux
if [ "${LAGOON_CLI_VERSION}" = "latest" ];
then
    LAGOON_CLI_VERSION=$(curl --silent "https://api.github.com/repos/${LAGOON_CLI_REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
fi
    curl -L -o /usr/bin/lagoon "https://github.com/${LAGOON_CLI_REPO}/releases/download/${LAGOON_CLI_VERSION}/lagoon-cli-${LAGOON_CLI_VERSION}-linux-amd64" && \
    chmod +x /usr/bin/lagoon
COMMAND

COPY .bashrc.d/lagoon.aliases.sh /root/.bashrc.d/
COPY ssh-config /root/.ssh/config
# This file needs to be created manually every time, so let's make sure it
# exists here. There's no indication that we need to maintain it across
# builds/runs, if that's the case we can leave it to the user to add it to a
# volume.
COPY ssh-known-hosts /root/.ssh/known_hosts
COPY rsync.to.sh /usr/local/bin/rsync.to
COPY rsync.from.sh /usr/local/bin/rsync.from
