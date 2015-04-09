FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN groupadd -r redis && useradd -r -g redis redis

ENV REDIS_VERSION 2.8.19


RUN yum install -y \
gcc \
make \
tar \
&& yum clean all \
&& mkdir -p /usr/src/redis \
&& curl -sSL http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz | tar xz -C /usr/src/redis --strip-components=1 \
&& make -C /usr/src/redis \
&& make -C /usr/src/redis install \
&& rm -r /usr/src/redis

RUN mkdir /data \
&& chown redis:redis /data


VOLUME ["/data"]

WORKDIR /data

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 6379

CMD [ "redis-server" ]