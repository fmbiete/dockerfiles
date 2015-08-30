FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV HAPROXY_MAJOR 1.5
ENV HAPROXY_VERSION 1.5.14

RUN yum clean all\
&& yum install -y \
gcc \
make \
openssl-devel \
&& mkdir /usr/local/src/haproxy \
&& curl -sSL "http://www.haproxy.org/download/${HAPROXY_MAJOR}/src/haproxy-${HAPROXY_VERSION}.tar.gz" | tar xz -C /usr/local/src/haproxy --strip-components=1 \
&& make -C /usr/local/src/haproxy -j"$(nproc)" \
TARGET=linux2628 \
USE_PCRE=1 PCREDIR= \
USE_OPENSSL=1 \
USE_ZLIB=1 \
all install-bin \
&& mkdir /usr/local/etc/haproxy \
&& cp -R /usr/local/src/haproxy/examples/errorfiles /usr/local/etc/haproxy/errors \
&& rm -rf /usr/local/src/haproxy \
&& yum -y history undo last \
&& yum clean all

EXPOSE 80 443

CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
