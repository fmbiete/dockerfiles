Base: centos_epel_php:5.6

Extras:

    - PHP-FPM 5.6 (REMI Version)


Expose:

    - 9000


RUN EXAMPLE:

    docker run --name app_php_fpm -p 9000:9000 -d fbiete/centos_epel_php_fpm:5.6

    docker stop app_php_fpm

    docker start app_php_fpm
