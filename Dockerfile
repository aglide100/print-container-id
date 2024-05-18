FROM ubuntu:20.04

RUN apt-get update && apt-get install -y nginx && apt-get install -y php-fpm && rm -rf /var/lib/apt/lists/*

COPY nginx /etc/nginx

COPY /html/index.php /var/www/html

WORKDIR /etc/nginx

RUN sed -i 's/listen.owner = www-data/listen.owner = root/g' /etc/php/7.4/fpm/pool.d/www.conf
RUN sed -i 's/listen.group = www-data/listen.group = root/g' /etc/php/7.4/fpm/pool.d/www.conf

CMD service php7.4-fpm start && nginx -g "daemon off;"

EXPOSE 80/tcp
