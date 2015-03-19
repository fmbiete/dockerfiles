FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum clean all \
&& yum install -y \
ntp \
&& yum clean all

EXPOSE 123/udp

CMD ["/usr/sbin/ntpd", "-n", "-b", "-g"]