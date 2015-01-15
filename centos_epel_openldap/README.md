Base: centos_epel:7

Extras:

    - OpenLDAP Server


RUN EXAMPLE:

    mkdir -p ~/app/docker/openldap/lib

    mkdir -p ~/app/docker/openldap/slapd.d

    chcon -Rt svirt_sandbox_file_t ~/app/docker/openldap

    docker run --name app_openldap -v ~/app/docker/openldap/slapd.d:/etc/openldap/slapd.d -v ~/app/docker/openldap/lib:/var/lib/ldap -p 389:389 -d fbiete/centos_epel_openldap:2

    docker stop app_openldap

    docker start app_openldap