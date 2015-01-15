FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum install -y \
openldap-servers \
openldap-clients \
&& yum clean all \
&& rm -rf /etc/openldap/slapd.d/* \
&& rm -rf /var/lib/ldap/*

VOLUME ["/etc/openldap/slapd.d", "/var/lib/ldap"]

EXPOSE 389

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["slapd", "-h", "ldap:/// ldapi:///", \
"-u", "ldap", "-g", "ldap", \
"-F", "/etc/openldap/slapd.d", "-d", "1"]