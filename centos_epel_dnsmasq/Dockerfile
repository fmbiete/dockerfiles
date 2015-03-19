FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum clean all \
&& yum install -y \
dnsmasq \
&& yum clean all \
&& echo "user=root" > /etc/dnsmasq.d/00_docker.conf

EXPOSE 53/udp 67/udp

CMD [ "/usr/sbin/dnsmasq", "-k" ]