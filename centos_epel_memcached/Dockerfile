FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

# INSTALL memcached
RUN yum clean all \
&& yum install -y \
memcached \
&& yum clean all

# Run script
COPY docker-cmd.sh /docker-cmd.sh

# Non-root user from this point
USER memcached


# Environment default options, change anything in the run command
ENV MEMCACHED_PORT 11211
ENV MEMCACHED_MAXCONN 1024
ENV MEMCACHED_CACHESIZE 64
ENV MEMCACHED_OPTIONS -u 0

EXPOSE 11211

CMD [ "/docker-cmd.sh" ]