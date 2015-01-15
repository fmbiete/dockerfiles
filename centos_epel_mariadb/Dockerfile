FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

COPY MariaDB.repo /etc/yum.repos.d/MariaDB.repo

RUN yum install -y \
MariaDB-server \
MariaDB-client \
hostname \
&& yum clean all

COPY docker-entrypoint.sh /

RUN rm -rf /var/lib/mysql

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld_safe"]