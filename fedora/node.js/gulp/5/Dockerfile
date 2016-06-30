FROM krystalcode/f_nvm

# Set the node version to the latest available.
ENV NODE_VERSION 5

    # Install the right Node version and set it as default.
RUN . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc && \

    # Globally install additional node tools by the project.
    nvm use ${NODE_VERSION} && \
    npm install -g gulp
