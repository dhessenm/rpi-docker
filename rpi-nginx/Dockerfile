FROM resin/rpi-raspbian:stretch

RUN apt-get update && apt-get install -y nginx php-mysql php-fpm libjpeg-dev libpng-dev php-mysql  pwgen vim supervisor && \
   rm -rf /var/lib/apt/lists/*

# RUN sed -i "/ipv6only/ s/^/#/" /etc/nginx/sites-available/default
# RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN rm /etc/nginx/sites-enabled/default && \
    mkdir -p /var/www/anfang.hopto.org && \
    mkdir /run/php 
#     sed -i 's/^listen = .*/listen = 9000/g' /etc/php/7.0/fpm/pool.d/www.conf 

ADD supervisord-nginx.conf /etc/supervisor/conf.d/supervisord-nginx.conf
ADD supervisord-fpm.conf /etc/supervisor/conf.d/supervisord-fpm.conf

ADD anfang.hopto.org.conf /etc/nginx/conf.d/anfang.hopto.org.conf
ADD index.html /var/www/anfang.hopto.org/index.html
# ADD letsencrypt.tar.gz /

ENV WORDPRESS_VERSION 4.8.1
RUN set -ex; \
    curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz"; \
    tar -xzf wordpress.tar.gz -C /var/www/anfang.hopto.org; \
    rm wordpress.tar.gz; \
    mv /var/www/anfang.hopto.org/wordpress /var/www/anfang.hopto.org/blog; \
    chown -R www-data:www-data /var/www/anfang.hopto.org

# ADD start.sh /start.sh

EXPOSE 80 443
# CMD /start.sh

# STOPSIGNAL SIGTERM

# ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
ENTRYPOINT ["/usr/bin/supervisord", "-n"]

# CMD ["nginx", "-g", "daemon off;"]

