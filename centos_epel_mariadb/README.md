Base: centos_epel:7

Extras:

    - MariaDB 10


Based on mariadb official (https://registry.hub.docker.com/_/mariadb/)

    mkdir -p ~/app/docker/mysql/lib

    chcon -Rt svirt_sandbox_file_t ~/app/docker/mysql/lib

    docker run --name app_mariadb -e MYSQL_ROOT_PASSWORD=password -v ~/app/docker/mysql/lib:/var/lib/mysql -p 3306:3306 -d fbiete/centos_epel_mariadb:10

    docker stop app_mariadb

    docker start app_mariadb


docker run --name some-app --link some-mariadb:mysql -d application-that-uses-mysql