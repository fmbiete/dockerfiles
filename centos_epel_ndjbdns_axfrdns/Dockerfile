FROM fbiete/centos_epel_systemd:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV container docker

RUN yum clean all \
&& yum -y install \
ndjbdns \
xinetd \
&& yum clean all

COPY axfrdns /tmp/axfrdns

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 53

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/init"]
