FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum clean all \
&& yum install -y \
dnsmasq \
&& yum clean all

EXPOSE 67

CMD [ "/usr/sbin/dnsmasq", "-k" ]