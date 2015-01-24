FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum install -y \
http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
&& yum install -y --enablerepo=remi-php56 --enablerepo=remi \
php-cli \
php-fpm \
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
&& yum clean all \
&& sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php-fpm.d/www.conf \
&& sed -i '/^listen/c \
listen = 0.0.0.0:9000' /etc/php-fpm.d/www.conf

WORKDIR /var/www

VOLUME ["/var/www"]

EXPOSE 9000

ENTRYPOINT ["php-fpm","-F"]

