Base: centos_epel:7

Extras:

    - MariaDB 10


Based on mariadb official (https://registry.hub.docker.com/_/mariadb/)

    mkdir -p ~/app/docker/mysql/lib

    chcon -Rt svirt_sandbox_file_t ~/app/docker/mysql/lib

    docker run --name app_mariadb -e MYSQL_ROOT_PASSWORD=root_password -e MYSQL_USER=user_name -e MYSQL_USER_TEST=user_name_test
        -e MYSQL_PASSWORD=user_password -e MYSQL_PASSWORD_TEST=user_password_test -e MYSQL_DATABASE=database -e MYSQL_DATABASE_TEST=database_test
        -v ~/app/docker/mysql/lib:/var/lib/mysql -p 3306:3306 -d fbiete/centos_epel_mariadb:10

    docker stop app_mariadb

    docker start app_mariadb