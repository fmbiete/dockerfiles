FROM fbiete/centos_epel_java:1.7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.73
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz


RUN mkdir $CATALINA_HOME \
&& cd $CATALINA_HOME \
&& curl -sSL "$TOMCAT_TGZ_URL" | tar -xz --strip-components=1 \
&& rm -f bin/*.bat

WORKDIR $CATALINA_HOME

EXPOSE 8080

CMD ["catalina.sh", "run"]
