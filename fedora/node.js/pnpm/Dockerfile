FROM krystalcode/f_nvm

# Set the Node.js version to the latest available within Node.js version 16.
ENV NODE_VERSION 18

    # Install the right Node.js version and set it as default.
RUN . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc && \
    # Install PNPM.
    wget -qO- https://get.pnpm.io/install.sh | sh -
