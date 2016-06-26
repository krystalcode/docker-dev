FROM kibana:2

# Install Marvel plugin.
RUN gosu kibana /opt/kibana/bin/kibana plugin --install elasticsearch/marvel/latest

# Install Sense plugin.
RUN gosu kibana /opt/kibana/bin/kibana plugin --install elastic/sense
