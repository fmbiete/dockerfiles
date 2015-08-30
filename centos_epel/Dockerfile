FROM centos:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

# If you need to generate a specific locale do this in your image
# RUN /docker-genlocale.sh locale charmap output-name
# Example: RUN /docker-genlocale.sh es_ES ISO-8859-15 es_ES@euro
COPY docker-genlocale.sh /

# If you want to change the locale override those ENV variables in your image or container
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install EPEL, tar, gosu, logrotate
RUN yum clean all \
&& yum install -y \
epel-release \
tar \
logrotate \
&& yum clean all \
&& gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
&& curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" \
&& curl -o /usr/local/bin/gosu.asc -sSL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64.asc" \
&& gpg --verify /usr/local/bin/gosu.asc \
&& rm /usr/local/bin/gosu.asc \
&& chmod +x /usr/local/bin/gosu
