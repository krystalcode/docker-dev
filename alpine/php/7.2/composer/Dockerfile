FROM php:7.2-cli-alpine

    # Install 'composer'.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    # Install git, commonly required for downloading composer packages.
    apk upgrade --update && \
    apk add --no-cache git
