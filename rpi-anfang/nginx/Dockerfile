FROM resin/rpi-raspbian:stretch

RUN apt-get update && apt-get install -y nginx vim supervisor certbot && \
   rm -rf /var/lib/apt/lists/*

RUN rm /etc/nginx/sites-enabled/default && \
    mkdir -p /var/www/anfang.hopto.org 

ADD supervisord-nginx.conf /etc/supervisor/conf.d/supervisord-nginx.conf
ADD anfang.hopto.org.conf /etc/nginx/conf.d/anfang.hopto.org.conf

# RUN chown -R www-data:www-data /var/www/anfang.hopto.org

EXPOSE 80 443

# STOPSIGNAL SIGTERM

# ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
ENTRYPOINT ["/usr/bin/supervisord", "-n"]

# CMD ["nginx", "-g", "daemon off;"]

