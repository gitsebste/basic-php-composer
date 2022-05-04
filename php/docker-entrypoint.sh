#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- php-fpm "$@"
fi

if [ "$1" = 'php-fpm' ] || [ "$1" = 'bin/console' ]; then
    if [ "$APP_ENV" != 'prod' ]; then
        composer install --dev
    fi
    php bin/console assets:install
    php bin/console cache:clear
    php bin/console cache:warmup
    chown -R www-data:www-data var/cache
    mkdir -p public/upload
    chown -R www-data:www-data public/upload
fi

#alias rdb="php bin/console d:d:d --force --if-exists && php bin/console d:d:c --if-not-exists && php bin/console do:mi:mi -n && php bin/console h:f:l -n"

docker-php-entrypoint "$@"
