FROM fbiete/centos_epel_nginx:1.8
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

VOLUME ["/etc/ssl/nginx/"]

RUN yum clean all \
&& yum install -y \
unzip \
npm \
nodejs \
git \
&& mkdir -p /var/www/docker-registry-frontend \
&& curl -sSL https://github.com/kwk/docker-registry-frontend/archive/master.zip -o docker-registry-frontend.zip \
&& unzip docker-registry-frontend \
&& rm -f docker-registry-frontend.zip \
&& cd /docker-registry-frontend-master \
&& npm install \
&& node_modules/bower/bin/bower install --allow-root --config.interactive=false \
&& node_modules/grunt-cli/bin/grunt build --allow-root --config.interactive=false \
&& cp -r dist/* /var/www/docker-registry-frontend \
&& cd / \
&& rm -rf /docker-registry-frontend-master \
&& yum -y history undo last \
&& yum clean all

COPY nginx.conf /etc/nginx/nginx.conf
