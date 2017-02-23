FROM kibana:5

    # Install OS packages required.
    # Required by Reporting plugin: bzip2
RUN apt-get update && \
    apt-get -y install bzip2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    # Install X-Pack.
    gosu kibana /usr/share/kibana/bin/kibana-plugin install x-pack
