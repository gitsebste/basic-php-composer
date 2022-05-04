FROM php:8.1-fpm

WORKDIR /var/www

RUN usermod -u 1000 www-data

RUN apt-get update
RUN apt-get install -y cron
RUN apt-get install -y supervisor
RUN apt-get install -y nano
RUN apt-get install -y wget
RUN apt-get install -y zip
RUN apt-get install -y libxrender1
RUN apt-get install -y libxext6
RUN apt-get install -y libfontconfig
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libicu-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libpq-dev
RUN apt-get install -y libzip-dev
RUN apt-get install -y procps
RUN apt-get install -y libxslt-dev
RUN apt-get install -y gnupg2
RUN apt-get install -y npm
RUN apt-get install -y git
RUN apt-get install -y unzip

# php extensions
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install intl
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip
RUN docker-php-ext-install sysvsem
RUN pecl install -o -f redis
RUN docker-php-ext-enable redis
RUN docker-php-ext-install opcache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN  apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY php.ini /usr/local/etc/php/conf.d/docker-php-custom.ini
COPY zz-custom.conf /usr/local/etc/php-fpm.d/
COPY app-cron /etc/cron.d/app-cron
RUN /usr/bin/crontab -u root /etc/cron.d/app-cron

RUN mkdir -p var/cache var/logs var/sessions && chown -R www-data var

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]

ENTRYPOINT ["docker-entrypoint"]
