# FROM ubuntu
FROM resin/rpi-raspbian:jessie

MAINTAINER Dirk Hessenmüller 

ENV ZEPPELIN_VERSION 0.7.1
ENV ZEPPELIN_URL http://apache.mirror.iphh.net/zeppelin/zeppelin-$ZEPPELIN_VERSION/zeppelin-$ZEPPELIN_VERSION-bin-all.tgz
ENV ZEPPELIN_DIR /opt/zeppelin

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get install -y default-jdk curl

RUN mkdir -p $ZEPPELIN_DIR

# Download compressed Zeppelin to tmp dir, and extract contents to Zeppelin dir
WORKDIR /tmp
 

RUN curl $ZEPPELIN_URL | tar xfz -
RUN cp -r zeppelin-$ZEPPELIN_VERSION-bin-all/* $ZEPPELIN_DIR
WORKDIR $ZEPPELIN_DIR

# Create a Zeppelin user
RUN useradd --home $ZEPPELIN_DIR --shell /bin/bash zeppelin
RUN chown zeppelin:zeppelin -R $ZEPPELIN_DIR

COPY scripts/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8080

