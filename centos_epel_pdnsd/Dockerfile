FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV PDNSD_RPM http://members.home.nl/p.a.rombouts/pdnsd/releases/pdnsd-1.2.9a-par_sl6.x86_64.rpm

EXPOSE 53 53/udp

RUN yum install -y \
$PDNSD_RPM \
&& yum clean all

CMD [ "/sbin/pdnsd" ]