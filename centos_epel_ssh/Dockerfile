FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum install -y \
openssh-server \
&& yum clean all \
&& /usr/sbin/sshd-keygen

EXPOSE 22

CMD /usr/sbin/sshd -D