ARG PHP_VERSION="latest"

FROM docker.io/library/php:${PHP_VERSION}

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar && \
    chmod +x phpactor.phar && \
    mv phpactor.phar /usr/local/bin/phpactor

EXPOSE 8890

CMD ["/usr/local/bin/phpactor", "language-server", "--address=0.0.0.0:8890", "-vvv"]
