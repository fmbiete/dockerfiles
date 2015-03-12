Base: centos_epel:7

Extra:

    - XenServer Guest Tools


Must be run as SPC inside a XenServer Guest

    docker run -d --privileged --net=host fbiete/centos_epel_xentools:6.2.0.1137