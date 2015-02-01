FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN groupadd -r redis && useradd -r -g redis redis

ENV REDIS_VERSION 2.8.19
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-2.8.19.tar.gz
ENV REDIS_DOWNLOAD_SHA1 3e362f4770ac2fdbdce58a5aa951c1967e0facc8

RUN yum install -y \
gcc \
make \
tar \
&& yum clean all \
&& mkdir -p /usr/src/redis \
&& curl -sSL "$REDIS_DOWNLOAD_URL" -o redis.tar.gz \
&& echo "$REDIS_DOWNLOAD_SHA1 *redis.tar.gz" | sha1sum -c - \
&& tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
&& rm redis.tar.gz \
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