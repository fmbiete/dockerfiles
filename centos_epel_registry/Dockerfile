FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV DOCKER_REGISTRY_VERSION 0.9.1
ENV DOCKER_REGISTRY_CONFIG /docker-registry/config.yml
ENV SETTINGS_FLAVOR local
ENV SWIG_FEATURES -cpperraswarn -includeall -I/usr/include/openssl

EXPOSE 5000

VOLUME [ "/docker-registry" ]

CMD [ "docker-registry" ]

RUN mkdir -p /usr/local/lib/python2.7/site-packages

COPY sitecustomize.py /usr/local/lib/python2.7/site-packages/sitecustomize.py


RUN yum clean all \
&& yum install -y \
swig \
python-pip \
python-devel \
python-boto \
python-redis \
python-blinker \
python-flask \
c-ares \
libev \
python-greenlet \
unzip \
xz-devel \
gcc \
openssl-devel \
&& cd /usr/local/src \
&& curl -sSL https://github.com/docker/docker-registry/archive/${DOCKER_REGISTRY_VERSION}.zip -o docker-registry.zip \
&& unzip docker-registry.zip \
&& rm -f docker-registry.zip \
&& cp docker-registry-${DOCKER_REGISTRY_VERSION}/config/boto.cfg /etc/boto.cfg \
&& mv docker-registry-${DOCKER_REGISTRY_VERSION} /docker-registry-install \
&& pip install /docker-registry-install/depends/docker-registry-core \
&& pip install file:///docker-registry-install/#egg=docker-registry[bugsnag,newrelic,cors] \
&& rm -rf /docker-registry-install \
&& yum remove -y \
python-devel \
unzip \
gcc \
cpp \
glibc-devel \
glibc-headers \
kernel-headers \
libmpc \
mpfr \
openssl-devel \
keyutils-libs-devel \
krb5-devel       \
libcom_err-devel \
libselinux-devel \
libsepol-devel \
libverto-devel \
pcre-devel \
zlib-devel \
&& yum clean all \
&& rm -rf /tmp/pip*
