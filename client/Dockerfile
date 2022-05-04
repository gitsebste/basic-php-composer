FROM nginx:1.15
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl
RUN usermod -u 1000 www-data
## Node installation
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash
RUN apt-get install -y nodejs
RUN npm install --global yarn
RUN yarn set version 1.22.18

ADD nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /usr/share/nginx/html
