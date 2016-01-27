FROM krystalcode/f_nvm

# Install "git", required by "npm" for installing some dependencies.
RUN dnf -y install git && dnf clean all

ENV NODE_VERSION 0.12.9

RUN . $HOME/.nvm/nvm.sh && \
    nvm install $NODE_VERSION

# @Issue(
#   "Include the Kibana source code and install its node dependencies"
#   type="improvement"
#   priority="normal"
# )
#
# @Issue(
#   "Install the Sense plugin"
#   type="task"
#   priority="normal"
# )

EXPOSE 5601

# @Issue(
#   "Set default node version so that we don't have to do 'nvm use'"
#   type="task"
#   priority="normal"
# )
CMD ["nvm use 0.12.9 && npm start"]
