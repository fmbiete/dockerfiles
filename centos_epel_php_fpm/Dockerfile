FROM fbiete/centos_epel_php:5.6
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum install -y --enablerepo=remi-php56 --enablerepo=remi \
php-fpm \
&& yum clean all \
&& sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php-fpm.d/www.conf \
&& sed -i '/^listen/c \
listen = 0.0.0.0:9000' /etc/php-fpm.d/www.conf

WORKDIR /var/www

VOLUME ["/var/www"]

EXPOSE 9000

ENTRYPOINT ["php-fpm","-F"]