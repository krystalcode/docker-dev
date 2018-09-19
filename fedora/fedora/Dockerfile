FROM fedora

# Upgrade packages.
RUN dnf -y upgrade

# Install "powerline" and other tools.
# "which" is required by "powerline" (/usr/share/powerline/bash/powerline.sh).
# "findutils" provides the "find" command.
# "git" is used in pretty much all of images, so let's install it here so that
# we don't have to do it on the inheriting images.
RUN dnf -y install powerline which findutils tar wget git

# Clean up.
RUN dnf -y clean all

# Configure "powerline" theme so that it shows "git" branch info.
ADD powerline.json /root/.config/powerline/config.json

# Export the TERM environment variable.
# Configure bash shell to use "powerline" by default.
RUN printf '\n%s\n%s\n%s\n%s\n\n\n%s\n%s\n%s\n%s\n%s\n\n' '# Export TERM environment variable' 'export TERM=xterm' '# Export LANG environment variable' 'export LANG=en_US.UTF-8' '# Use powerline' 'powerline-daemon -q' 'POWERLINE_BASH_CONTINUATION=1' 'POWERLINE_BASH_SELECT=1' '. /usr/share/powerline/bash/powerline.sh'  >> ~/.bashrc
