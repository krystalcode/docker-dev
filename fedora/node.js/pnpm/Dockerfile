ARG FEDORA_VERSION="latest"
ARG NVM_VERSION="latest"

FROM docker.io/krystalcode/f_atuin:${FEDORA_VERSION}-latest AS atuin

FROM docker.io/krystalcode/f_just:${FEDORA_VERSION}-latest AS just

FROM krystalcode/f_nvm:${FEDORA_VERSION}-${NVM_VERSION}

# Set the Node.js version to the latest available.
ARG NODE_VERSION="22"
ARG PNPM_VERSION="latest"

    # Install the right Node.js version and set it as default.
RUN . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc && \
    # Make sure we run the latest version of `corepack`. Otherwise, an error may
    # be raised when installing packages: "Cannot find matching keyid".
    npm update -g corepack && \
    # Install PNPM.
    corepack enable pnpm && \
    corepack use pnpm@${PNPM_VERSION}

# Add "atuin".
COPY --from=atuin /usr/bin/atuin /usr/bin/
COPY --from=atuin /root/.bashrc.d/atuin-client.sh /root/.bashrc.d/

# Add "just".
COPY --from=just /usr/bin/just /usr/bin/
