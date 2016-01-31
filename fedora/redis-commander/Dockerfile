FROM krystalcode/f_nvm

ENV NODE_VERSION 5.0.0

# Install the right Node version and set it as default.
RUN . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc

# Install "redis-commander".
RUN . ${HOME}/.nvm/nvm.sh && \
    nvm use ${NODE_VERSION} && \
    npm install -g redis-commander

EXPOSE 8081

# Run the application.
CMD . ${HOME}/.nvm/nvm.sh && \
    nvm use ${NODE_VERSION} && \
    redis-commander --redis-host ${REDIS_HOST}
