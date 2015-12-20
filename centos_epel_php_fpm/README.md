Base: centos_epel_php:7.0

Extras:

    - PHP-FPM 7.0 (REMI Version)


Expose:

    - 9000


RUN EXAMPLE:

    docker run --name app_php_fpm -p 9000:9000 -d fbiete/centos_epel_php_fpm:7.0

    docker stop app_php_fpm

    docker start app_php_fpm
