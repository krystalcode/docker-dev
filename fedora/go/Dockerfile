FROM krystalcode/f_fedora

ENV GO_VERSION 1.8.1

RUN cd /usr/local && \
    curl https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz | tar -xz && \
    printf '\n%s\n%s\n\n' '# Register the Go root path.' "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc && \
    printf '\n%s\n%s\n\n' '# Register the Go source path.' "export GOPATH=/src" >> ~/.bashrc && \
    dnf -y install git && \
    dnf clean all

WORKDIR /src
