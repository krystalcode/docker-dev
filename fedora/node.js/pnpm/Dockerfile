FROM krystalcode/f_nvm

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
