FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum clean all \
&& yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
&& yum install --enablerepo=remi -y \
ImageMagick-last-devel \
&& yum install -y \
make \
cpp \
gcc-c++ \
cmake \
git \
psmisc \
mariadb-server \
{binutils,boost,jemalloc}-devel \
{sqlite,tbb,bzip2,openldap,readline,elfutils-libelf,gmp,lz4,pcre,freetype,fastlz}-devel \
lib{xslt,event,yaml,vpx,png,zip,icu,mcrypt,memcached,cap,dwarf,jpeg-turbo}-devel \
{unixODBC,expat,mariadb}-devel \
lib{edit,curl,xml2,xslt}-devel \
glog-devel \
oniguruma-devel \
ocaml \
&& yum clean all

ENV HHVM_VERSION HHVM-3.6

RUN cd /usr/local/src \
&& git clone https://github.com/facebook/hhvm -b $HHVM_VERSION hhvm --recursive \
&& cd hhvm \
&& cmake . \
&& make -j"$(nproc)" \
&& ./hphp/hhvm/hhvm --version \
&& make install \
&& cd /usr/local/src \
&& rm -rf hhvm \
&& yum remove mariadb-server \
&& yum clean all

EXPOSE 9000

CMD [ "/usr/local/bin/hhvm", "--config", "/etc/hhvm/server.hdf", "-vServer.Type=fastcgi", "-vServer.Port=9000" ]