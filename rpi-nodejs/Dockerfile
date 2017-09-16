FROM resin/rpi-raspbian:jessie
MAINTAINER Dirk Hessenmüller 

ARG NODEVERSION=v6.11.3

# Install node.js
# RUN \
#   sed -i 's/^# \(.*-backports\s\)/\1/g' /etc/apt/sources.list && \
#   apt-get update && \
#   apt-get install -y nodejs && \
#   rm -rf /var/lib/apt/lists/*

RUN \
  apt-get update && \
  apt-get install -y curl

RUN \
  curl -sSLO https://nodejs.org/dist/$NODEVERSION/node-$NODEVERSION-linux-armv7l.tar.gz  && \
  tar -xf node-$NODEVERSION-linux-armv7l.tar.gz && \
  cd node-$NODEVERSION-linux-armv7l && \
  cp -R * /usr/local/

