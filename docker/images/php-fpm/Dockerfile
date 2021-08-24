FROM php:7.4-fpm-alpine

RUN apk update \
    && apk add zlib-dev postgresql-dev git icu-dev libxml2-dev libzip-dev unzip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql \
    && docker-php-ext-install zip xml \
    # Xdebug
    && apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-2.8.0 \
    && docker-php-ext-enable xdebug \
    # Set timezone
    && apk add tzdata \
    && ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime \
    && "date"

# Composer
COPY --from=composer:2.0.12 /usr/bin/composer /usr/local/bin/composer
