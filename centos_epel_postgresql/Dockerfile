FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV PG_VERSION 9.4
ENV PG_VERSION_RPM 94-9.4-1

RUN yum install -y \
http://yum.postgresql.org/$PG_VERSION/redhat/rhel-7-x86_64/pgdg-centos$PG_VERSION_RPM.noarch.rpm \
&& yum install -y \
postgresql94-server \
postgresql94-contrib \
&& yum clean all

RUN mkdir -p /var/run/postgresql \
&& chown -R postgres /var/run/postgresql


ENV PGDATA /var/lib/postgresql/data
ENV PG_HOME /usr/pgsql-$PG_VERSION
ENV PATH $PG_HOME/bin:$PATH

VOLUME ["/var/lib/postgresql/data"]

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432

CMD ["postgres"]