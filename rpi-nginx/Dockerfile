FROM resin/rpi-raspbian:stretch

RUN apt-get update && apt-get install -y nginx
# RUN sed -i "/ipv6only/ s/^/#/" /etc/nginx/sites-available/default
# RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN rm /etc/nginx/sites-enabled/default && \
    mkdir -p /var/www/anfang.hopto.org

ADD anfang.hopto.org.conf /etc/nginx/conf.d/anfang.hopto.org.conf
ADD index.html /var/www/anfang.hopto.org/index.html
# ADD letsencrypt.tar.gz /


# ADD start.sh /start.sh

EXPOSE 80 443
# CMD /start.sh

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

