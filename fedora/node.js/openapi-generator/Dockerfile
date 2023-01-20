FROM docker.io/krystalcode/f_nvm

# Set the Node.js version to the latest version available.
ENV NODE_VERSION 19

    # Install JAVA, required by the OpenAPI generator CLI.
RUN dnf install -y java-latest-openjdk && \
    dnf -y clean all && \

    # Install the right Node.js version and set it as default.
    . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc && \

    # Globally install 'gulp'.
    nvm use ${NODE_VERSION} && \
    npm install @openapitools/openapi-generator-cli -g
