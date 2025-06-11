ARG FEDORA_VERSION="latest"

FROM docker.io/krystalcode/f_atuin:${FEDORA_VERSION}-latest AS atuin

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

# Add .bashrc extensions.
COPY .bashrc.d/ide.aliases.sh /root/.bashrc.d/

# Add "emacs" configuration file.
ADD ./.emacs /root/

# Add git configuration file.
ADD ./.gitconfig /root/

# Add global .gitignore file.
ADD ./.gitignore /root/

# Add "ssh" configuration file.
ADD ./.sshconfig /root/.ssh/config
RUN chmod 644 ~/.ssh/config

# Add "atuin".
COPY --from=atuin /usr/bin//atuin /usr/bin/
COPY --from=atuin /root/.bashrc.d/atuin-client.sh /root/.bashrc.d/
