FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV HAPROXY_MAJOR 1.5
ENV HAPROXY_VERSION 1.5.11
ENV HAPROXY_MD5 5500a79d0d2b238d4a1e9749bd0c2cb2

RUN yum install -y \
gcc \
make \
openssl-devel \
&& curl -SL "http://www.haproxy.org/download/${HAPROXY_MAJOR}/src/haproxy-${HAPROXY_VERSION}.tar.gz" -o haproxy.tar.gz \
&& echo "${HAPROXY_MD5} haproxy.tar.gz" | md5sum -c \
&& mkdir /usr/local/src/haproxy \
&& tar xzf haproxy.tar.gz -C /usr/local/src/haproxy --strip-components=1 \
&& rm -f haproxy.tar.gz \
&& make -C /usr/local/src/haproxy -j"$(nproc)" \
TARGET=linux2628 \
USE_PCRE=1 PCREDIR= \
USE_OPENSSL=1 \
USE_ZLIB=1 \
all install-bin \
&& mkdir /usr/local/etc/haproxy \
&& cp -R /usr/local/src/haproxy/examples/errorfiles /usr/local/etc/haproxy/errors \
&& rm -rf /usr/local/src/haproxy \
&& yum -y history undo `yum history list | head -n 4 | tail -n 1 | awk '{print $1}'` \
&& yum clean all

EXPOSE [ 80 443 ]

CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]