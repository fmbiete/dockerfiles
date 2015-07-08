FROM fbiete/centos_epel_golang:1.4
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

EXPOSE 5000

ENV DOCKER_REGISTRY_VERSION 2.0

ENV DISTRIBUTION_DIR /go/src/github.com/docker/distribution
ENV GOPATH $DISTRIBUTION_DIR/Godeps/_workspace:$GOPATH

WORKDIR $DISTRIBUTION_DIR

RUN yum clean all \
&& yum install -y \
make \
&& yum clean all \
&& mkdir -p $DISTRIBUTION_DIR \
&& curl -LS https://github.com/docker/distribution/archive/v2.0.0.tar.gz | tar xz --strip-components=1 \
&& cd $DISTRIBUTION_DIR \
&& make PREFIX=/go clean binaries


CMD ["registry", "cmd/registry/config.yml"]
