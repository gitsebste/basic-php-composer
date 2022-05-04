#!/usr/bin/env bash
EXECUTION_LOCATION=$(pwd)
cd $( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
docker build -t netinteractive/ey-tax-server-php-fpm:latest php
# docker push netinteractive/ey-tax-server-php-fpm:latest

docker build -t netinteractive/ey-tax-api-server-nginx:latest nginx
# docker push netinteractive/ey-tax-api-server-nginx:latest

docker build -t netinteractive/ey-tax-client-server-nginx:latest client
# docker push netinteractive/ey-tax-client-server-nginx:latest

cd $EXECUTION_LOCATION
