FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
                git \
                wget \
                libzip-dev \
                zip \
                unzip \
                curl \
                libssl-dev \
                libxml2-dev \
                libfreetype6-dev \
                libjpeg62-turbo-dev \
                libpng-dev \
                libsodium-dev \
                libmcrypt-dev \
                libmemcached-dev \
                libonig-dev \

    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install pcntl \
    opcache \
    pdo_mysql \
    zip \
    mbstring \
    xml \
    ctype \
    bcmath \
    json \
    tokenizer

#Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    composer self-update --preview

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_11.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs -y
RUN npm install npm@6.9.0 -g


WORKDIR /var/www/app

COPY . /var/www/app

VOLUME /var/www/app
