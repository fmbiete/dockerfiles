FROM fbiete/centos_epel_systemd:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV container docker

RUN yum -y install perl-Params-Validate perl-Nagios-Plugin nrpe nagios-plugins nagios-plugins-all; \
yum clean all;

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 5666

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/init"]