FROM php:5.6-apache

    # Install OS packages required.
    # Required by php extensions: libcurl4-gnutls-dev imagemagick libmagickwand-dev
    # Required by Drupal/Drush for communicating with the database: mysql-client
    # Required for installing 'mycli': python-pip python-dev
    # Required for text editing: vim
    # Required for better shell experience: powerline fonts-powerline
RUN apt-get update && \
    apt-get -y install libpng-dev libcurl4-gnutls-dev mysql-client python-pip python-dev vim powerline fonts-powerline && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

    # Install php extensions required by Drupal.
    docker-php-ext-install mysql pdo_mysql mbstring curl && \
    printf "\n" | pecl install imagick && \

    # Enable 'mod_rewrite' apache module.
    a2enmod rewrite && \

    # Install Drush.
    curl -o /usr/local/bin/drush http://files.drush.org/drush.phar && \
    chmod +x /usr/local/bin/drush && \
    drush -y init && \

    # Install 'composer'.
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \

    # Create a user that should own the application files.
    groupadd -r application && useradd -r -g application application && \

    # Upgrade 'pip' and 'pymysql', and install 'mycli'.
    pip install --upgrade pip && pip install -U pymysql && pip install mycli && \

    # Export the TERM environment variable.
    # Configure bash shell to use "powerline" by default.
    printf '\n%s\n%s\n\n\n%s\n%s\n%s\n%s\n%s\n\n' '# Export TERM environment variable' 'export TERM=xterm' '# Use powerline' 'powerline-daemon -q' 'POWERLINE_BASH_CONTINUATION=1' 'POWERLINE_BASH_SELECT=1' '. /usr/share/powerline/bindings/bash/powerline.sh'  >> ~/.bashrc

# Add 'imagick' pecl extension to php configuration.
ADD ./php-pecl-imagick.ini /usr/local/etc/php/conf.d/pecl-imagick.ini
