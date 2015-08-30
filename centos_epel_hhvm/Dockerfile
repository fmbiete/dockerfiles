FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV HHVM_BRANCH HHVM-3.9
ENV HHVM_VERSION HHVM-3.9.1

RUN yum clean all \
&& yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
&& yum clean all \
&& yum install --enablerepo=remi -y \
ImageMagick-last-devel \
&& yum install -y \
make \
cpp \
gcc-c++ \
cmake \
git \
psmisc \
bison \
ocaml \
gperf \
{sqlite,tbb,bzip2,openldap,readline,elfutils-libelf,gmp,lz4,pcre,freetype,fastlz,openssl,ncurses,xz,cyrus-sasl,glibc,inotify-tools}-devel \
{binutils,boost,jemalloc,unixODBC,expat,mariadb,uw-imap,glog,oniguruma,gd,giflib}-devel \
lib{xslt,event,yaml,vpx,png,tiff,zip,icu,mcrypt,memcached,cap,dwarf,jpeg-turbo,tool-ltdl,edit,curl,xml2,xslt,c-client,pam}-devel \
&& cd /usr/local/src \
&& git clone https://github.com/facebook/hhvm -b $HHVM_BRANCH hhvm --recursive \
&& cd hhvm \
&& git checkout tags/$HHVM_VERSION \
&& cmake . -DMYSQL_UNIX_SOCK_ADDR=/var/run/mysqld/mysqld.sock \
&& make -j"$(nproc)" \
&& ./hphp/hhvm/hhvm --version \
&& make install \
&& cd /usr/local/src \
&& rm -rf hhvm \
&& yum remove -y \
*-devel \
make \
cpp \
gcc-c++ \
cmake \
git \
psmisc \
glibc-headers \
bison \
gperf \
&& yum clean all \
&& mkdir /var/run/hhvm /var/log/hhvm /etc/hhvm

EXPOSE 9000

COPY server.ini /etc/hhvm/server.ini
COPY docker-run.sh /docker-run.sh

CMD [ "/docker-run.sh" ]
