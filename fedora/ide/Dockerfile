ARG FEDORA_VERSION=38

FROM docker.io/krystalcode/f_fedora:${FEDORA_VERSION}

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
    iputils \
    nmap && \
    dnf -y clean all

    # Configure aliases.
RUN printf '\n\n%s\n%s\n\n%s\n%s\n\n' '# Add silver searcher alias' 'alias ag="ag --color-path 36 --color-match 32 --color-line-number '"'"'1;30'"'"'"' '# Sync eshell aliases' 'alias | sed -E "s/^alias ([^=]+)='"'"'(.*)'"'"'$/alias \1 \2 \$*/g; s/'"'"'\\\'"'""'"'/'"'"'/g;" >~/.emacs.d/eshell/alias'  >> ~/.bashrc

# Add "emacs" configuration file.
ADD ./.emacs /root/

# Add git configuration file.
ADD ./.gitconfig /root/

# Add global .gitignore file.
ADD ./.gitignore /root/

# Add "ssh" configuration file.
ADD ./.sshconfig /root/.ssh/config
RUN chmod 644 ~/.ssh/config
