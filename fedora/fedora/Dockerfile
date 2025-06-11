# Consider installing `eza` - https://github.com/eza-community/eza.

ARG FEDORA_VERSION=latest

FROM docker.io/library/fedora:${FEDORA_VERSION}

ENV BLE_SH_MAKE_DIR="/tmp/ble.sh"

    # Upgrade packages.
RUN dnf -y upgrade && \
    # Install various commonly required packages.
    dnf -y install \
    # Install the default locale.
    glibc-langpack-en \
    # "bat" a better "cat".
    bat \
    # "which" is required by the "oh-my-posh" bash extension
    # (~/.bashrc.d/oh-my-posh.sh); good to have it anyway.
    which \
    # "findutils" provides the "find" command.
    findutils \
    tar \
    wget \
    # "git" is used in pretty much all of images, so let's install it here so
    # that we don't have to do it on the inheriting images.
    git \
    # "gawk" and "procps-ng" are required by "ble.sh".
    gawk \
    procps-ng \
    # "make" is required to build "ble.sh", but good to have as a common build
    # and install tool.
    make && \

    # Clean up.
    dnf -y clean all && \

    # Configure DNF for faster downloads.
    printf 'max_parallel_downloads=12\nfastestmirror=True' >> /etc/dnf/dnf.conf

# Allow extending .bashrc with files.
# Unless we copy the file first, it is not found.
COPY .bashrc.extend.sh /tmp/.bashrc.extend.sh
RUN cat /tmp/.bashrc.extend.sh >> ~/.bashrc && \
    rm /tmp/.bashrc.extend.sh && \
    mkdir ~/.bashrc.d

# Add .bashrc extensions.
COPY .bashrc.d/aliases.sh /root/.bashrc.d/aliases.sh
COPY .bashrc.d/variables.sh /root/.bashrc.d/variables.sh
COPY .bashrc.d/oh-my-posh.sh /root/.bashrc.d/oh-my-posh.sh

# Install and configure "oh-my-posh".
# We don't make the version available as an argument; we always install the
# latest version like other utilities.
ENV OH_MY_POSH_REPO="JanDeDobbeleer/oh-my-posh"
ENV OH_MY_POSH_VERSION="latest"
RUN <<COMMAND
set -eux
if [ "${OH_MY_POSH_VERSION}" = "latest" ];
then
    OH_MY_POSH_VERSION=$(curl --silent "https://api.github.com/repos/${OH_MY_POSH_REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
fi
    curl -L -o /usr/bin/oh-my-posh https://github.com/${OH_MY_POSH_REPO}/releases/download/${OH_MY_POSH_VERSION}/posh-linux-amd64 && \
    chmod +x /usr/bin/oh-my-posh
COMMAND

COPY oh-my-posh.runnah.minimal.omp.json /root/.config/oh-my-posh/themes/runnah.minimal.omp.json
COPY .bashrc.d/oh-my-posh.sh /root/.bashrc.d/

# Install and configure `ble.sh`.
RUN mkdir ${BLE_SH_MAKE_DIR} && \
    cd ${BLE_SH_MAKE_DIR} && \
    git clone --recursive --depth=1 -b master https://github.com/akinomyoga/ble.sh.git && \
    cd ${BLE_SH_MAKE_DIR}/ble.sh && \
    make && \
    make install clean && \
    rm -rf ${BLE_SH_MAKE_DIR} && \
    sed -i '1s/^/[[ $- == *i* ]] \&\& source ~\/.local\/share\/blesh\/ble\.sh --noattach\n\n/' ~/.bashrc && \
    echo '[[ ! ${BLE_VERSION-} ]] || ble-attach' >> ~/.bashrc
