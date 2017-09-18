FROM resin/rpi-raspbian:stretch

MAINTAINER Dirk Hessenmueller  <dirk.hessenmueller@anfang.hopto.org>


RUN apt-get update && \
    apt-get install -y php-mysql php-fpm php-gd libjpeg-dev libpng-dev php-mysql  pwgen vim  supervisor && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^listen = .*/listen = 9000/g' /etc/php/7.0/fpm/pool.d/www.conf && \
    mkdir /run/php

ADD supervisord-fpm.conf /etc/supervisor/conf.d/supervisord-fpm.conf

EXPOSE 9000

# CMD php-fpm7.0 --force-stderr --nodaemonize --fpm-config /etc/php/7.0/fpm/php-fpm.conf
# CMD php-fpm7.0  --nodaemonize --fpm-config /etc/php/7.0/fpm/php-fpm.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n"]


