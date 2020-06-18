FROM php:7.4-fpm
RUN apt-get update \
  && apt-get -y install git \
  && apt-get -y install libzip-dev \
  && apt-get -y install libonig-dev \
  && apt-get -y install vim \
  && apt-get -y install zip \
  && apt-get -y install unzip \
  && docker-php-ext-install pdo_mysql mysqli mbstring

#Composer install
COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1

ENV COMPOSER_HOME /composer

ENV PATH $PATH:/composer/vendor/bin

WORKDIR /var/www

COPY install_Laravel.sh install_Laravel.sh
