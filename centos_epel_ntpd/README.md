Base: centos_epel:7

Extra:

    - NTP Server


RUN EXAMPLE:

    docker run --name app_ntp -p 123:123/udp -d fbiete/centos_epel_ntpd:7

    docker stop app_ssh

    docker start app_ssh