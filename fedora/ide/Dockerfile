FROM docker.io/krystalcode/f_fedora:35

ENV RUBYGEMS_UPDATE_SUBPATH share/gems/gems/rubygems-update-3.3.20

    # Install OS packages.
    # ruby, ruby-devel, gcc, make, redhat-rpm-config, libffi-devel: required for
    #   installing ruby gems.
    # glibc-locale-source glibc-langpack-en: required for resolving issues with
    #   the locale not set when running `compass compile`; otherwise some
    #   special characters are not accepted.
RUN dnf -y install \
    emacs \
    the_silver_searcher \
    rsync \
    w3m \
    patch \
    patchutils \
    php-cli \
    ruby \
    ruby-devel \
    gcc \
    gcc-c++ \
    glibc-locale-source \
    glibc-langpack-en \
    make \
    redhat-rpm-config \
    libffi-devel \
    iputils \
    nmap && \
    dnf -y clean all

    # Set the locale.
RUN localedef  --verbose --force -i en_US -f UTF-8 en_US.UTF-8; exit 0

    # Install "compass".
RUN mkdir -p /usr/local/${RUBYGEMS_UPDATE_SUBPATH} && \
    ln -sf /usr/local/${RUBYGEMS_UPDATE_SUBPATH} /usr/${RUBYGEMS_UPDATE_SUBPATH} && \
    gem update --system && \
    gem install compass bootstrap-sass && \

    # Configure aliases.
    printf '\n\n%s\n%s\n\n%s\n%s\n\n' '# Add silver searcher alias' 'alias ag="ag --color-path 36 --color-match 32 --color-line-number '"'"'1;30'"'"'"' '# Sync eshell aliases' 'alias | sed -E "s/^alias ([^=]+)='"'"'(.*)'"'"'$/alias \1 \2 \$*/g; s/'"'"'\\\'"'""'"'/'"'"'/g;" >~/.emacs.d/eshell/alias'  >> ~/.bashrc

# Add "emacs" configuration file.
ADD ./.emacs /root/

# Add git configuration file.
ADD ./.gitconfig /root/

# Add global .gitignore file.
ADD ./.gitignore /root/

# Add "ssh" configuration file.
ADD ./.sshconfig /root/.ssh/config
RUN chmod 644 ~/.ssh/config
