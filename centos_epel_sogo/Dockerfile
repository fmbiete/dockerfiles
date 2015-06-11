FROM fbiete/centos_epel:6
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

COPY sogo.repo /etc/yum.repos.d/

RUN yum clean all \
&& yum install -y http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm \
&& yum install -y --enablerepo=rpmforge-extras \
sogo \
sope49-gdl1-mysql \
sope49-gdl1-postgresql \
&& yum clean all