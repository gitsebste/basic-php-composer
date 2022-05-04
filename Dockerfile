FROM nginx:1.15-alpine

RUN apk add nginx-mod-http-headers-more
COPY ./nginx.conf /etc/nginx/nginx.conf
#RUN usermod -u 1000 www-data
RUN adduser -u 1000 -D -S -G www-data www-data
COPY ./conf.d /etc/nginx/conf.d/
WORKDIR /var/www
