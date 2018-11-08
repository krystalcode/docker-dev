FROM krystalcode/f_fedora

# Install OS packages.
# ruby, ruby-devel, gcc, make, redhat-rpm-config: required for installing ruby gems.
RUN dnf -y install emacs the_silver_searcher w3m git patch patchutils php-cli ruby ruby-devel gcc make redhat-rpm-config nmap && \
    dnf clean all

# Install "compass".
RUN gem install compass bootstrap-sass

# Add "emacs" configuration file.
ADD ./.emacs /root/

# Add git configuration file.
ADD ./.gitconfig /root/

# Add global .gitignore file.
ADD ./.gitignore /root/

# Add "ssh" configuration file.
ADD ./.sshconfig /root/.ssh/config
RUN chmod 644 ~/.ssh/config

# Configure aliases.
RUN printf '\n\n%s\n%s\n%s\n%s\n\n' '# Add silver searcher alias' 'alias ag="ag --color-path 36 --color-match 32 --color-line-number \'1;30\'"' '# Sync eshell aliases' 'alias | sed -E "s/^alias ([^=]+)=\'(.*)\'$/alias \1 \2 \$*/g; s/\'\\\'\'/\'/g;" >~/.emacs.d/eshell/alias'  >> ~/.bashrc
