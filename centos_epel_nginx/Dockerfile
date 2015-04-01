FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

# Copy mainline repo
COPY nginx.repo /etc/yum.repos.d/

# Install nginx
# forward request and error logs to docker log collector
RUN yum clean all \
&& yum install -y nginx \
&& yum clean all \
&& ln -sf /dev/stdout /var/log/nginx/access.log \
&& ln -sf /dev/stderr /var/log/nginx/error.log