Base: centos_epel_dnsmasq:7

Extra:

    - DHCP

Notes:

    Create 2 folder with the options and the hosts assignments. They must be named "options" and "hosts"

    docker run -d --name app_dhcp -v ~/app/dhcp:/mnt/dhcp -p 67:udp:67/udp fbiete/centos_epel_dhcp