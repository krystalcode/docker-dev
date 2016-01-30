FROM krystalcode/f_nvm

# Install "git", required by "npm" and "bower" for installing some dependencies.
RUN dnf -y install git && dnf clean all

ENV NODE_VERSION 5.0.0

# Install the right Node version and set it as default.
RUN . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc

# Install "sails".
RUN . ${HOME}/.nvm/nvm.sh && \
    nvm use ${NODE_VERSION} && \
    npm install -g sails

WORKDIR /src

EXPOSE 1337

# Run the application.
CMD . ${HOME}/.nvm/nvm.sh && \
    nvm use ${NODE_VERSION} && \
    sails lift
