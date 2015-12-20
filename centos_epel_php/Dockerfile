FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum install -y \
http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
&& yum install -y --enablerepo=remi-php70 --enablerepo=remi \
php-cli \
php-gd \
php-mysql \
php-ldap \
php-pgsql \
php-mcrypt \
php-xml \
php-xmlrpc \
php-imap \
php-soap \
php-process \
php-curl \
php-mbstring \
&& yum clean all

