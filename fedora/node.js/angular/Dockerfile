FROM krystalcode/f_nvm

# Set the Node.js version to the latest available within Node.js version 16.
ENV NODE_VERSION 14

    # Install the right Node.js version and set it as default.
RUN . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc && \

    # Globally install 'typescript', 'angular-cli' and 'gulp'.
    nvm use ${NODE_VERSION} && \
    npm install -g typescript @angular/cli gulp

EXPOSE 4200
