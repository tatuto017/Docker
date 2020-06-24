FROM php:7.4-fpm

RUN apt-get update \
  && apt-get -y install git \
  && apt-get -y install libzip-dev \
  && apt-get -y install libonig-dev \
  && apt-get -y install vim \
  && apt-get -y install zip \
  && apt-get -y install unzip \
  && apt-get -y install npm \
  && apt-get -y install locales \
  && locale-gen ja-JP.UTF-8 \
  && localedef -f UTF-8 -i ja_JP ja_JP \
  && docker-php-ext-install pdo_mysql mysqli mbstring

ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:jp \
    LC_ALL=ja_JP.UTF-8

#Composer install
COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1

ENV COMPOSER_HOME /composer

ENV PATH $PATH:/composer/vendor/bin

WORKDIR /var/www

COPY install_Laravel.sh install_Laravel.sh
