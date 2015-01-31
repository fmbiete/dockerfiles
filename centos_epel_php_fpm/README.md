Base: centos_epel_php:5.6

Extras:

    - PHP-FPM 5.6 (REMI Version)


Volumes:

    - /var/www

Expose:

    - 9000


RUN EXAMPLE:

    mkdir -p ~/app/docker/www

    chcon -Rt svirt_sandbox_file_t ~/app/docker/www

    docker run --name app_php_fpm -v ~/app/docker/www:/var/www -p 9000:9000 -d fbiete/centos_epel_php_fpm:5.6

    docker stop app_php_fpm

    docker start app_php_fpm