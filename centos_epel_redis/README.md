Base: centos_epel:7

Extra:

    - Redis


Based on redis official (https://registry.hub.docker.com/_/redis/)

    mkdir -p ~/app/docker/redis/data

    chcon -Rt svirt_sandbox_file_t ~/app/docker/redis/data

    docker run --name app_redis -v ~/app/docker/redis/data:/data -p 6379:6379 -d fbiete/centos_epel_redis:2.8

    docker stop app_redis

    docker start app_redis