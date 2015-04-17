FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV GOLANG_VERSION 1.4.2

COPY go-wrapper /usr/local/bin/

RUN yum clean all \
&& yum install -y \
gcc \
make \
&& curl -sSL https://golang.org/dl/go$GOLANG_VERSION.src.tar.gz | tar -v -C /usr/local/src -xz \
&& cd /usr/local/src/go/src \
&& ./make.bash --no-clean -j"$(nproc)" \
&& mkdir -p /go/src /go/bin \
&& chmod -R 777 /go \
&& yum -y history undo last \
&& yum clean all

ENV PATH /usr/local/src/go/bin:/go/bin:$PATH
ENV GOPATH /go

WORKDIR /go
