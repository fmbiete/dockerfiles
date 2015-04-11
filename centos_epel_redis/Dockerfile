FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV REDIS_VERSION 3.0.0

VOLUME ["/data"]

WORKDIR /data

RUN groupadd -r redis \
&& useradd -r -g redis redis \
&& yum clean all \
&& yum install -y \
gcc \
make \
&& mkdir -p /usr/local/src/redis \
&& curl -sSL http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz | tar xz -C /usr/local/src/redis --strip-components=1 \
&& make -j"$(nproc)" -C /usr/local/src/redis \
&& make -C /usr/local/src/redis install \
&& rm -rf /usr/local/src/redis \
&& yum -y history undo last \
&& yum clean all \
&& chown redis:redis /data

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 6379

CMD [ "redis-server" ]