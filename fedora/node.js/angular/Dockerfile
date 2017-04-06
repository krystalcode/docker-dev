FROM krystalcode/f_nvm

# Set the Node.js version to the latest available within Node.js version 6.
ENV NODE_VERSION 6

    # Install the right Node.js version and set it as default.
RUN . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc && \

    # Globally install 'typescript'.
    nvm use ${NODE_VERSION} && \
    npm install -g typescript && \

    # Globally install 'angular-cli'.
    nvm use ${NODE_VERSION} && \
    npm install -g @angular/cli@1.0.0-rc.0 && \

    # Globally install 'gulp'.
    nvm use ${NODE_VERSION} && \
    npm install -g gulp

EXPOSE 4200
