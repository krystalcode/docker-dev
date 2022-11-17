ARG FEDORA_VERSION=36

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

ENV LAGOON_VERSION 0.15.4

RUN curl -L "https://github.com/uselagoon/lagoon-cli/releases/download/v${LAGOON_VERSION}/lagoon-cli-v${LAGOON_VERSION}-linux-amd64" -o /usr/local/bin/lagoon && \
    chmod +x /usr/local/bin/lagoon && \
    printf '\n%s\n%s\n\n' '# Lagoon alias' "alias l='lagoon --config-file /src/.lagoon.yml --ssh-key /root/.ssh/id_ed25519'"  >> ~/.bashrc

COPY ssh-config /root/.ssh/config
