ARG FEDORA_VERSION=35

FROM docker.io/krystalcode/${FEDORA_VERSION}

ENV LAGOON_VERSION 0.14.0

RUN curl -L "https://github.com/uselagoon/lagoon-cli/releases/download/v${LAGOON_VERSION}/lagoon-cli-v${LAGOON_VERSION}-linux-amd64" -o /usr/local/bin/lagoon && \
    chmod +x /usr/local/bin/lagoon
