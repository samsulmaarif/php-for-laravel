FROM php:7.1

# lakukan update 
RUN apt-get update -yqq

# Install library yang diperlukan
RUN apt-get install git curl nodejs libcurl4-gnutls-dev libicu-dev libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev -y

# mongodb extension
RUN apt-get install -yqq autoconf pkg-config libssl-dev
RUN pecl install mongodb-1.2.2
RUN docker-php-ext-install bcmath
RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

# install modul php
RUN docker-php-ext-install mbstring pdo_mysql curl json intl gd xml zip bz2 opcache 
