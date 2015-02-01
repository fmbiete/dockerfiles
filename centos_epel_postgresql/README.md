Base: centos_epel:7

Extra:

    - PostgreSQL


Based on postgresql official (https://registry.hub.docker.com/_/postgres/)

    mkdir -p ~/app/docker/postgresql/data

    chcon -Rt svirt_sandbox_file_t ~/app/docker/postgresql/data

    docker run --name app_potgresql -e POSTGRES_PASSWORD=user_password -e $POSTGRES_USER=user_name
        -v ~/app/docker/postgresql/data:/var/lib/postgresql/data -p 5432:5432 -d fbiete/centos_epel_postgresql:9.4

    docker stop app_postgresql

    docker start app_postgresql