FROM mboyov/apache2-php74

# Install dependencies.
# ---------------------

RUN apt-get update -y               \
  && apt-get install -y           \
  bash-completion                 \
  build-essential                 \
  bzip2                           \
  ca-certificates                 \
  curl                            \
  git                             \
  gzip                            \
  htop                            \
  imagemagick                     \
  iputils-ping                    \
  libfontconfig1                  \
  libjpeg-dev                     \
  libpng-dev                      \
  libpq-dev                       \
  locales                         \
  mysql-client                    \
  nano                            \
  netcat                          \
  openconnect                     \
  php-xdebug                      \
  software-properties-common      \
  rsync                           \
  sudo                            \
  ssh                             \
  tig                             \
  unzip                           \
  vim                             \
  wget                            \
  xz-utils                        \
  zip                             \
  --no-install-recommends         \
  && apt-get clean                \
  && rm -rf /var/lib/apt/lists/*  \
  && rm -rf /tmp/*                \
  && rm -rf /var/tmp/*

# Configure Composer related environment.
# ---------------------------------------

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_DISABLE_XDEBUG_WARN 1

# Install Composer.
# -----------------
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /taller/app

# Build-time configuration.
# -------------------------
# This is mostly useful to override on CIs.

ARG APP_NAME=drupal
ARG GROUP_ID=1000
ARG USER_ID=1000

# Apache2 configs.
# -------------
COPY ./000-default.conf /etc/apache2/sites-available/
RUN sudo a2dissite site.conf && sudo a2ensite 000-default

### IMPORT FILES TO ENVIRONMENT
COPY ./entrypoint.sh /etc/entrypoint.sh
RUN sudo chmod +x /etc/entrypoint.sh

CMD ["/bin/bash"]
ENTRYPOINT ["/etc/entrypoint.sh"]
