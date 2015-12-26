FROM elasticsearch

# Install Marvel agent.
RUN /usr/share/elasticsearch/bin/plugin install license && \
    /usr/share/elasticsearch/bin/plugin install marvel-agent

# Custom ElasticSearch configuration.
COPY ./elasticsearch.yml /usr/share/elasticsearch/config/
