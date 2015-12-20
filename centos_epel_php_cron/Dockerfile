FROM fbiete/centos_epel_php:7.0
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum install -y \
cronie \
&& yum clean all

WORKDIR /etc/cron.d

VOLUME [ "/etc/cron.d" ]

CMD ["cron", "-n"]
