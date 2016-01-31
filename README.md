# docker-dev
*WARNING - This is a collection of Docker images that are for development use only - DON NOT USE IN PRODUCTION*

A collection of Docker images and environments. Its purpose is to facilitate easily setting up development environments.

## Images
Two types of images are currently available:

- official: based on the official image of the OS or software they provide (usually debian).
- fedora: based on the official fedora image, with some additional useful tools included.

All images are available in DockerHub as well. The DockerHub ID prefix is always 'krystalcode'. The image's name is composed of two parts, separated by an underscore:

- OS type, e.g. 'o' for official-based images and 'f' for fedora-based images.
- Service name, which is the folder's name with hyphens converted to underscores.

For example, the official-based elasticsearch image is located in the 'official/elasticsearch' folder, and its corresponding DockerHub image is 'krystalcode/o_elasticsearch'.

### Official-based Images

Currently available images based on the official repositories:

- Drupal 7 (with php 5.6, apache). DockerHub: krystalcode/o_drupal7_apache.
- ElasticSearch (with Marvel agent). DockerHub: krystalcode/o_elasticsearch.
- Kibana (with Marvel and Sense plugins). DockerHub: krystalcode/o_kibana.

### Fedora-based Images

Currently available images based on the official fedora image:

- Fedora (with powerline and other utilities). DockerHub: krystalcode/f_fedora.
- Haskell Stack (with git and emacs). DockerHub: krystalcode/f_haskell_stack.
- IDE (Emacs-based development environment). DockerHub: krystalcode/f_ide - this image will be renamed to 'f_emacs' soon.
- Kibana Dev (Kibana plugin development). DockerHub: krystalcode/f_kibana_dev.
- Node Version Manager (for use as a base image). DockerHub: krystalcode/f_nvm.
- Redis Commander (redis web ui). DockerHub: krystalcode/f_redis_commander.
- Sails JS. DockerHub: krystalcode/f_sails.

## Environments
Example environments are provided as docker-compose configuration files and can be found in the 'compose' folder. When using an environment, make sure you adapt it to your projects requirements first.

Currently available environments:

- Redis (with web ui).
