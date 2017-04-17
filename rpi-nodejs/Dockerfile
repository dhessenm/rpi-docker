FROM resin/rpi-raspbian:jessie
MAINTAINER Dirk Hessenmüller 

# Install node.js
# RUN \
#   sed -i 's/^# \(.*-backports\s\)/\1/g' /etc/apt/sources.list && \
#   apt-get update && \
#   apt-get install -y nodejs && \
#   rm -rf /var/lib/apt/lists/*

# RUN \
#   apt-get update && \
#   apt-get install -y curl && \
#   curl http://nodejs.org/dist/latest-v4.x/node-v4.8.2-linux-armv7l.tar.gz && \
#   tar -xf node-v4.8.2-linux-armv7l.tar.gz && \
#   cd node-v4.8.2-linux-armv7l && \
#   cp -R * /usr/local/



ADD node-v4.8.2-linux-armv7l.tar /tmp/

RUN \
  cd /tmp/node-v4.8.2-linux-armv7l && \
  cp -R * /usr/local/ && \
  cd /tmp && \
  rm -rf /tmp/node*

