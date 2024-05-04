FROM krystalcode/f_fedora

RUN dnf -y install python3-pip && \
    dnf clean all && \
    pip install "langserve[server]"

WORKDIR /src
