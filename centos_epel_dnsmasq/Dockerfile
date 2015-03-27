FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

EXPOSE 53/udp 67/udp

RUN yum clean all \
&& yum install -y \
dnsmasq \
&& yum clean all

COPY 00_docker.conf /etc/dnsmasq.d/00_docker.conf

CMD [ "/usr/sbin/dnsmasq", "-k" ]