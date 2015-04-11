FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

VOLUME [ "/etc/logrotate.docker", "/etc/rsyslog.d", "/var/log" ]

EXPOSE 514 514/udp

CMD [ "/usr/sbin/rsyslogd", "-n" ]

RUN yum clean all \
&& yum install -y \
rsyslog \
logrotate \
&& yum clean all \
&& rm -f /etc/logrotate.d/*

COPY config/logrotate.conf /etc/logrotate.conf
COPY config/00_enable_server.conf /etc/logrotate.d/enable_server.conf