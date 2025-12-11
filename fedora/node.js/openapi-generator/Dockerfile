ARG FEDORA_VERSION="latest"
ARG NVM_VERSION="latest"

FROM docker.io/krystalcode/f_atuin:${FEDORA_VERSION}-latest AS atuin

FROM docker.io/krystalcode/f_just:${FEDORA_VERSION}-latest AS just

FROM docker.io/krystalcode/f_nvm:${FEDORA_VERSION}-${NVM_VERSION}

# Set the Node.js version to the latest available.
ARG NODE_VERSION="22"
ARG OPENAPI_GENERATOR_VERSION="latest"

    # Install JAVA, required by the OpenAPI generator CLI.
RUN dnf install -y java-latest-openjdk && \
    dnf -y clean all && \

    # Install the right Node.js version and set it as default.
    . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc && \

    # Globally install 'openapi-generator-cli'.
    nvm use ${NODE_VERSION} && \
    npm install @openapitools/openapi-generator-cli@"${OPENAPI_GENERATOR_VERSION}" -g

# Instal `yq`, useful for converting JSON to YAML when needed.
ENV YQ_REPO="mikefarah/yq"
ENV YQ_VERSION="latest"
RUN <<COMMAND
set -eux
if [ "${YQ_VERSION}" = "latest" ];
then
    YQ_VERSION=$(curl --silent "https://api.github.com/repos/${YQ_REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
fi
    curl -L -o /usr/bin/yq https://github.com/${YQ_REPO}/releases/download/${YQ_VERSION}/yq_linux_amd64 && \
    chmod +x /usr/bin/yq
COMMAND
