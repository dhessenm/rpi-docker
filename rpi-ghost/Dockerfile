FROM dhessenm/armhf-nodejs
MAINTAINER Dirk Hessenmüller

ENV NPM_CONFIG_LOGLEVEL warn

USER root
WORKDIR /root/

RUN apt-get update && apt-get install -y mysql-client

RUN npm install -g ghost-cli 
RUN useradd -g www-data -s /bin/bash -c "ghost user" -d /home/ghost -m ghost 
RUN mkdir -p /var/www/ghost && chown -R ghost /var/www/ghost && chgrp -R www-data /var/www/ghost

# RUN addgroup www-data
# RUN adduser --ingroup www-data --shell /bin/bash ghost
# RUN chown ghost:www-data .

USER ghost
WORKDIR /var/www/ghost

# first run ghost config mysql ...
# RUN ghost install --url=https://anfang.hopto.org/ghost --db=mysql --dbhost=db --dbuser=root --dbpass=12345678 --dbname=ghost --no-prompt --no-start

RUN ghost install local --no-start --url=https://anfang.hopto.org/blog --db=mysql --dbhost=192.168.1.21 --dbuser=root --dbpass=12345678 --dbname=ghost --no-prompt 

ADD create_db_user.sql /home/ghost/create_db_user.sql
ADD ghost.sql /home/ghost/ghost.sql
ADD run.sh /home/ghost/run.sh
ADD config.development.json /var/www/ghost/config.development.json

USER root
WORKDIR /root/
RUN chown ghost /home/ghost/* && \ 
    chmod 744 /home/ghost/*.sh && \ 
    chown ghost /var/www/ghost/config.development.json

EXPOSE 2368
EXPOSE 2369

# ENV NODE_ENV production
# RUN sed -ie s/127.0.0.1/0.0.0.0/g config.development.json

CMD ["ghost", "run", "--development", "--ip", "0.0.0.0"]

