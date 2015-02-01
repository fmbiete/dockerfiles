FROM centos:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum install -y \
epel-release \
&& yum clean all

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8


# Add gosu util
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4

RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" \
&& curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64.asc" \
&& gpg --verify /usr/local/bin/gosu.asc \
&& rm /usr/local/bin/gosu.asc \
&& chmod +x /usr/local/bin/gosu
