FROM resin/rpi-raspbian:stretch
MAINTAINER Dirk Hessenmueller  <dirk.hessenmueller@anfang.hopto.org>

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install supervisor git apache2 libapache2-mod-php php-mysql pwgen  php-mcrypt vim python-certbot-apache && \
  echo "ServerName localhost" >> /etc/apache2/apache2.conf

ADD start-apache2.sh /start-apache2.sh
ADD run.sh /run.sh
ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD phpinfo.php /var/www/html/phpinfo.php
RUN chmod 755 /*.sh

# config to enable .htaccess
# ADD apache_default /etc/apache2/sites-available/000-default.conf
# RUN a2enmod rewrite

# Configure /app folder with sample app
# RUN git clone https://github.com/fermayo/hello-world-lamp.git /app
# RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

#Enviornment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M

# Add volumes for MySQL 
# VOLUME  ["/etc/mysql", "/var/lib/mysql" ]

EXPOSE 80 443
CMD ["/run.sh"]
