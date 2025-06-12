ARG FEDORA_VERSION="latest"
ARG NVM_VERSION="latest"

FROM docker.io/krystalcode/f_atuin:${FEDORA_VERSION}-latest AS atuin

FROM docker.io/krystalcode/f_just:${FEDORA_VERSION}-latest AS just

FROM docker.io/krystalcode/f_nvm:${FEDORA_VERSION}-${NVM_VERSION}

# Set the Node.js version to the latest available.
ARG NODE_VERSION="22"
ARG ANGULAR_VERSION="latest"

    # Install the right Node.js version and set it as default.
RUN . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc && \

    # Globally install 'typescript', 'angular-cli' and 'gulp'.
    nvm use ${NODE_VERSION} && \
    npm install -g typescript @angular/cli@${ANGULAR_VERSION} gulp

# Add "atuin".
COPY --from=atuin /usr/bin/atuin /usr/bin/
COPY --from=atuin /root/.bashrc.d/atuin-client.sh /root/.bashrc.d/

# Add "just".
COPY --from=just /usr/bin/just /usr/bin/

EXPOSE 4200
