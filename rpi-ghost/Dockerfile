FROM dhessenm/rpi-nodejs
MAINTAINER Dirk Hessenmüller

ENV NODE_ENV production

USER root
WORKDIR /var/www/

RUN mkdir -p ghost
RUN apt-get update && apt-get -qy install wget curl unzip python build-essential && \
    wget https://ghost.org/zip/ghost-latest.zip && \
    unzip ghost-*.zip -d ghost && \
    rm -rf /var/lib/apt/lists/*

RUN useradd ghost -m -G www-data -s /bin/bash && \
    chown ghost:www-data . && \
    chown ghost:www-data ghost && \
    chown ghost:www-data -R ghost/* 

RUN npm install -g pm2

USER ghost
WORKDIR /var/www/ghost
RUN /bin/bash -c "time (npm install sqlite3 --build-from-source)"
RUN npm install
# RUN sed -e s/127.0.0.1/0.0.0.0/g ./config.example.js > ./config.js
ADD config.js /var/www/ghost/

EXPOSE 2368
EXPOSE 2369

CMD ["pm2", "start", "index.js", "--name", "blog", "--no-daemon"]

