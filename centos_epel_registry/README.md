Base: centos_epel:7

Extra:

    - Docker Registry


Based on registry official (https://registry.hub.docker.com/_/registry/) and OpenShift (https://registry.hub.docker.com/u/openshift/docker-registry/)

    mkdir -p ~/app/docker/registry/data

    chcon -Rt svirt_sandbox_file_t ~/app/docker/registry

    docker run --name app_registry -v ~/app/docker/registry:/docker-registry -p 5000:5000 -d fbiete/centos_epel_registry:0.9

    docker stop app_registry

    docker start app_registry


Remember to put a config.yml in ~/app/docker/registry

    common: &common
        standalone: true
        loglevel: info
        search_backend: sqlalchemy
        sqlalchemy_index_database: sqlite:////docker-registry/search-docker-registry.db

    prod:
        <<: *common
        loglevel: warn
        storage: local
        storage_path: /docker-registry/data
        smtp_host: smtp.example.com
        from_addr: docker@example.com
        to_addr: alerts@example.com

    dev:
        <<: *common
        loglevel: debug
        storage: local
        storage_path: /docker-registry/data-dev

    test:
        <<: *common
        storage: local
        storage_path: /docker-registry/data-tmp