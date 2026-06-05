FROM php:8.2-apache

# Install System Dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && a2enmod rewrite

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
