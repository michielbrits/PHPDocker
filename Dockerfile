FROM php:8.1-fpm

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libmcrypt-dev \
    libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

# Install and enable the MySQL extensions (mysqli and pdo_mysql)
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-enable mysqli pdo pdo_mysql

# Set working directory
WORKDIR /var/www/html
