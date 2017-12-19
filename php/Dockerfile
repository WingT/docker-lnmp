FROM ubuntu:latest

COPY sources.list /etc/apt/sources.list

RUN set -x\
&&apt-get update\
&&apt-get -y --no-install-recommends install php-fpm php-mysql php-mbstring\
&&rm -rf /var/lib/apt/lists/*\
&&mkdir -p /var/www/html

COPY www.conf /etc/php/7.0/fpm/pool.d/www.conf

RUN /usr/lib/php/php7.0-fpm-checkconf

ENTRYPOINT ["php-fpm7.0","--nodaemonize","--fpm-config","/etc/php/7.0/fpm/php-fpm.conf"]

EXPOSE 9000
