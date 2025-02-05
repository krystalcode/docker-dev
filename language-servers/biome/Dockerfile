FROM krystalcode/f_nvm

# Set the Node.js version to the latest available.
ENV NODE_VERSION="22"

    # Install `socat`, need by the entrypoint.
RUN dnf -y install socat && \
    dnf -y clean all && \
    # Install the right Node.js version and set it as default.
    . ${HOME}/.nvm/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    printf '\n%s\n%s%s\n\n' '# Use default node version.' "nvm use " ${NODE_VERSION}  >> ~/.bashrc && \
    # Install BiomeJS.
    npm install -g --save-dev --save-exact @biomejs/biome

COPY ./entrypoint.sh /root

ENTRYPOINT ["/root/entrypoint.sh"]

EXPOSE 8894
