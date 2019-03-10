FROM php:7.2-apache

    # Install OS packages required.
    # Required by php extensions: libcurl4-gnutls-dev imagemagick
    #   libmagickwand-dev libjpeg-dev libpng-dev libfreetype6-dev
    # Required by composer for installing certain packages: git unzip
    # Required by Drupal/Drush for communicating with the database: mysql-client
    # Required for text editing: vim
    # Required for better shell experience: powerline fonts-powerline
RUN apt-get update && \
    apt-get -y install \
    libcurl4-gnutls-dev \
    imagemagick \
    libmagickwand-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    git \
    unzip \
    mysql-client \
    vim \
    powerline \
    fonts-powerline && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    # Install php extensions required by Drupal.
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install mysqli pdo_mysql mbstring gd curl opcache bcmath && \
    # Install the PhpRedis extension required by the 'redis' module, used for
    # improved cache performance.
    printf "\n" | pecl install redis && \
    docker-php-ext-enable redis && \
    # Install the Imagick extension used by the 'imagick' module as the image
    # toolkit.
    printf "\n" | pecl install imagick && \
    docker-php-ext-enable imagick && \
    # Install the JSMin extension used by the 'advagg' module for faster js
    # minification.
    printf "\n" | pecl install jsmin && \
    docker-php-ext-enable jsmin && \
    # Install the `xdebug` extension used for development/debugging purposes.
    printf "\n" | pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    # Install the `brotli` extension used by the `advagg` module for CSS/JS
    # compression.
    git clone --recursive --depth=1 https://github.com/kjdev/php-ext-brotli.git && \
    cd php-ext-brotli && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    printf '%s\n' 'extension=brotli.so'  >> /usr/local/etc/php/conf.d/brotli.ini && \
    rm -rf php-ext-brotli && \
    # Clean up.
    rm /tmp/pear -rf && \
    # Enable 'mod_expires' and 'mod_headers' apache modules required by the
    # 'advagg' module for properly setting headers.
    # Enable 'mod_rewrite' apache module for URL rewriting.
    a2enmod expires headers rewrite && \
    # Install Drush.
    curl -o /usr/local/bin/drush http://files.drush.org/drush.phar && \
    chmod +x /usr/local/bin/drush && \
    drush -y init && \
    # Install 'composer'.
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    # Create a user that should own the application files.
    groupadd -r application && useradd -r -g application application && \
    # Export the TERM environment variable.
    # Configure bash shell to use "powerline" by default.
    printf '\n%s\n%s\n\n\n%s\n%s\n%s\n%s\n%s\n\n' '# Export TERM environment variable' 'export TERM=xterm' '# Use powerline' 'powerline-daemon -q' 'POWERLINE_BASH_CONTINUATION=1' 'POWERLINE_BASH_SELECT=1' '. /usr/share/powerline/bindings/bash/powerline.sh'  >> ~/.bashrc
