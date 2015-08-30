FROM docker.io/fbiete/centos_epel_php_fpm:5.6
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN mkdir /var/www/davical /usr/local/share/awl \
&& groupadd -g 1000 davical \
&& adduser davical --gid 1000 -u 1000 --home /home/davical --shell /bin/bash \
&& curl -LsS https://gitlab.com/davical-project/awl/repository/archive.tar.gz | tar xz -C /usr/local/share/awl --strip-components=1 \
&& echo "include_path=.:/usr/share/pear:/usr/share/php:/usr/local/share/awl/inc:/var/www/davical/inc" >> /etc/php.ini \
&& curl -LsS https://gitlab.com/davical-project/davical/repository/archive.tar.gz | tar xz -C /var/www/davical --strip-components=1 \
&& chown -R davical:davical /var/log/php-fpm /var/run/php-fpm

WORKDIR /var/www/davical

USER davical
