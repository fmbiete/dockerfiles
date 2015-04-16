**Base:** centos_epel_nginx:1.7

**Extra:**

    - Docker Registry Frontend


**Notes:**

Based on https://registry.hub.docker.com/u/konradkleine/docker-registry-frontend/


**Usage:**

Run fbiete/centos_epel_registry as app_registry

    docker run --name app_registry_frontend -p 80:80 --link app_registry:docker-registry -d fbiete/centos_epel_registry_frontend:lastest

    docker stop app_registry_frontend

    docker start app_registry_frontend

If you need SSL:

    mkdir -p ~/app/docker/ssl

    chcon -Rt svirt_sandbox_file_t ~/app/docker/ssl

    docker run --name app_registry_frontend -p 80:80 -p 443:443 --link app_registry:docker-registry -v ~app/docker/ssl:/etc/ssl/nginx -d fbiete/centos_epel_registry_frontend:lastest