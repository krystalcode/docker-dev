FROM krystalcode/f_fedora

RUN dnf -y install python3-pip && \
    dnf clean all && \
    pip install langchain

WORKDIR /src
