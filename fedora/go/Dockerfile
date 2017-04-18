FROM krystalcode/f_fedora

ENV GO_VERSION 1.8.1

    # Install the requested version of Go.
RUN cd /usr/local && \
    curl https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz | tar -xz && \
    # Update environment variables for defining the Go workspace directory, and
    # for including to the PATH the Go executable and any builds we make in the
    # workspace.
    printf '\n%s\n%s\n\n' '# Register the Go root path.' "export PATH=$PATH:/usr/local/go/bin:/go/bin" >> ~/.bashrc && \
    printf '\n%s\n%s\n\n' '# Register the Go workspace source path.' "export GOPATH=/go" >> ~/.bashrc && \
    # Install Git, commonly required for fetching Go packages.
    dnf -y install git && \
    dnf clean all

WORKDIR /go
