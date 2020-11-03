FROM php:7.0

# lakukan update
RUN apt-get update -yqq

# Install library yang diperlukan
RUN apt-get install git curl nodejs libcurl4-gnutls-dev libicu-dev \
    libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev \
    libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev \
    libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev \
    libsnmp-dev libpcre3-dev libtidy-dev zip unzip gnupg libc-client-dev \
    libkrb5-dev libonig-dev -yqq

# mongodb extension
RUN apt-get install -yqq autoconf pkg-config libssl-dev libzip-dev
RUN pecl install mongodb-1.5.1
RUN docker-php-ext-install bcmath
RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

# install modul php
RUN docker-php-ext-configure gd --with-jpeg=/usr/include
RUN docker-php-ext-install mbstring pdo_mysql curl json intl gd xml zip bz2 opcache ldap exif

#install ekstensi imap
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install imap

# install ekstensi sybase
RUN apt upgrade -y && apt install -y freetds-bin freetds-common unixodbc unixodbc-dev freetds-dev
RUN ln -s /usr/lib/x86_64-linux-gnu/libsybdb.so.5.1.0 /usr/lib/ && ln -s /usr/lib/x86_64-linux-gnu/libsybdb.a /usr/lib/
RUN docker-php-ext-install pdo_dblib

# install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

# cleanup
RUN rm -rf /var/cache/apt/archives/* && rm -rf /tmp/*
