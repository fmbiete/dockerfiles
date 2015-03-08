FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

EXPOSE 53/udp

RUN yum install -y \
ndjbdns \
&& yum clean all

CMD [ "/sbin/tinydns" ]