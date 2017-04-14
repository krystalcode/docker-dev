FROM php:5.6-apache

# Update.
RUN apt-get update

# Install packages required.
# Required by php extensions: libpng-dev libcurl4-gnutls-dev
# Required by Drupal/Drush for communicating with the database: mysql-client
# Required for installing 'mycli': python-pip python-dev
# Required for text editing: vim
# Required for better shell experience: powerline fonts-powerline
RUN apt-get -y install libpng-dev libcurl4-gnutls-dev mysql-client python-pip python-dev vim powerline fonts-powerline

# Clean up.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install php extensions required by Drupal.
RUN docker-php-ext-install mysql pdo_mysql mbstring gd curl

# Upgrade 'pip' and 'pymysql', and install 'mycli'.
RUN pip install --upgrade pip && pip install -U pymysql && pip install mycli

# Install Drush.
RUN curl -o /usr/local/bin/drush http://files.drush.org/drush.phar && \
    chmod +x /usr/local/bin/drush && \
    drush -y init

# Install 'composer'.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Export the TERM environment variable.
# Configure bash shell to use "powerline" by default.
RUN printf '\n%s\n%s\n\n\n%s\n%s\n%s\n%s\n%s\n\n' '# Export TERM environment variable' 'export TERM=xterm' '# Use powerline' 'powerline-daemon -q' 'POWERLINE_BASH_CONTINUATION=1' 'POWERLINE_BASH_SELECT=1' '. /usr/share/powerline/bindings/bash/powerline.sh'  >> ~/.bashrc
