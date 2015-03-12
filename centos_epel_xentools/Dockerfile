FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV XENTOOLS_1 xe-guest-utilities-6.2.0-1137.x86_64.rpm
ENV XENTOOLS_2 xe-guest-utilities-xenstore-6.2.0-1137.x86_64.rpm

COPY xe-guest-utilities-6.2.0-1137.x86_64.rpm /
COPY xe-guest-utilities-xenstore-6.2.0-1137.x86_64.rpm /

RUN yum install -y \
net-tools \
/$XENTOOLS_1 \
/$XENTOOLS_2 \
&& yum clean all \
&& rm -f /$XENTOOLS_1 /$XENTOOLS_2

CMD [ "/bin/bash", "/usr/sbin/xe-daemon", "-p", "/var/run/xe-daemon.pid" ]