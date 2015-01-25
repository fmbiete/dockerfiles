FROM fbiete/centos_epel_java:1.7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

RUN mkdir -p "$CATALINA_HOME"

WORKDIR $CATALINA_HOME

ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.57
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

RUN yum install -y \
tar \
&& yum clean all \
&& curl -SL "$TOMCAT_TGZ_URL" | tar --strip-components=1 -xz \
&& rm bin/*.bat

EXPOSE 8080

CMD ["catalina.sh", "run"]