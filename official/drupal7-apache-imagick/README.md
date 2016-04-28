*WARNING - This is part of a collection of Docker images that are for development use only - DON NOT USE IN PRODUCTION*

This is a php + apache image based on the official php image. It features the following:

- 'mod_rewrite' apache module enabled.
- an 'application' user and corresponding group for optionally owning the application's files.
- php extensions required by Drupal 7.
- 'imagemagick' and the 'imagick' php extension (instead of gd).
- 'drush' for executing Drupal-related tasks.
- 'composer' for php package management.
- 'mycli' as an improved mysql client.
- 'powerline' for an improved shell.
