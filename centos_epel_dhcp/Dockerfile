FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN mkdir /mnt/dhcp

VOLUME /mnt/dhcp

EXPOSE 67

CMD [ "/usr/sbin/dnsmasq", "-k", "-p 0", "--dhcp-optsfile", "/mnt/dhcp/options", "--dhcp-hostsfile", "/mnt/dhcp/hosts" ]