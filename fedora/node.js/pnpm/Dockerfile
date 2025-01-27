FROM krystalcode/f_nvm

# Set the Node.js version to the latest available.
ENV NODE_VERSION="22"
ENV PNPM_VERSION="latest"

    # Install the right Node.js version and set it as default.
RUN . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc && \
    # Install PNPM.
    corepack enable pnpm && \
    corepack use pnpm@${PNPM_VERSION}
