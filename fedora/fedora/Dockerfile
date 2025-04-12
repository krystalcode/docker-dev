# Not using "latest" because for some reason the "latest" label on the base
# image is left behind.
ARG FEDORA_VERSION=42

FROM docker.io/library/fedora:${FEDORA_VERSION}

    # Upgrade packages.
RUN dnf -y upgrade && \

    # Install various commonly required packages.
    dnf -y install \
    # "powerline" for better cli UX.
    powerline \
    # "which" is required by "powerline" (/usr/share/powerline/bash/powerline.sh).
    which \
    # "findutils" provides the "find" command.
    findutils \
    tar \
    wget \
    # "git" is used in pretty much all of images, so let's install it here so
    # that we don't have to do it on the inheriting images.
    git && \

    # Clean up.
    dnf -y clean all && \

    # Configure DNF for faster downloads.
    printf 'max_parallel_downloads=12\nfastestmirror=True' >> /etc/dnf/dnf.conf

# Allow extending .bashrc with files.
# Unless we copy the file first, it is not found.
COPY .bashrc.extend.sh /tmp/.bashrc.extend.sh
RUN cat /tmp/.bashrc.extend.sh >> ~/.bashrc

# Add .bashrc extensions.
RUN mkdir ~/.bashrc.d
COPY .bashrc.d/powerline.sh /root/.bashrc.d/powerline.sh
COPY .bashrc.d/variables.sh /root/.bashrc.d/variables.sh

# Configure "powerline" theme so that it shows "git" branch info.
COPY powerline.json /root/.config/powerline/config.json
