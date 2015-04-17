Base: centos_epel:7

Extra:

    - Docker Registry


Based on registry official (https://registry.hub.docker.com/_/registry/) v2.0 (https://github.com/docker/distribution)

    docker run --name app_registry -p 5000:5000 -d fbiete/centos_epel_registry:0.9

    docker stop app_registry

    docker start app_registry


Remember to copy a config.yml in /go/src/github.com/docker/distribution/cmd/registry/config.yml