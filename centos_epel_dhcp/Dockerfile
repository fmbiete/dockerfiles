FROM fbiete/centos_epel_dnsmasq:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

VOLUME /mnt/dhcp

EXPOSE 67/udp

COPY 01_docker_dhcp.conf /etc/dnsmasq.d/01_docker_dhcp.conf

CMD [ "/usr/sbin/dnsmasq", "-k", "-p", "0", "--dhcp-optsfile", "/mnt/dhcp/options", "--dhcp-hostsfile", "/mnt/dhcp/hosts" ]