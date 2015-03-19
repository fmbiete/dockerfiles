FROM fbiete/centos_epel_dnsmasq:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN mkdir /mnt/dhcp \
&& echo "dhcp-host=00:00:00:00:00:00,127.0.0.2" > /etc/dnsmasq.d/01_docker_dhcp.conf

VOLUME /mnt/dhcp

EXPOSE 67/udp

CMD [ "/usr/sbin/dnsmasq", "-k", "-p", "0", "--dhcp-optsfile", "/mnt/dhcp/options", "--dhcp-hostsfile", "/mnt/dhcp/hosts" ]