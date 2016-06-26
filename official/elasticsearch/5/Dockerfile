FROM elasticsearch:5

# Install Marvel agent.
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install x-pack

# Custom ElasticSearch configuration.
COPY ./elasticsearch.yml /usr/share/elasticsearch/config/
