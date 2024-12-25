ARG FEDORA_VERSION=41

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

RUN curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar && \
    chmod +x phpactor.phar && \
    mv phpactor.phar /usr/local/bin/phpactor

EXPOSE 8890

CMD ["/usr/local/bin/phpactor", "language-server", "--address=0.0.0.0:8890", "-vvv"]
