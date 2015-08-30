FROM fbiete/centos_epel_java:1.8
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV CONFLUENCE_VERSION 5.8.10
ENV MYSQL_CONNECTOR_VERSION 5.1.35

ENV DOWNLOAD_URL https://downloads.atlassian.com/software/confluence/downloads/atlassian-confluence-
ENV DOWNLOAD_URL_MYSQL_CONNECTOR http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-

# https://confluence.atlassian.com/display/CONFLUENCE/Confluence+home+directory
ENV CONFLUENCE_HOME /var/atlassian/application-data/confluence

# Install Atlassian Confluence to the following location
ENV CONFLUENCE_INSTALL_DIR /opt/atlassian/confluence

# Use the default unprivileged account. This could be considered bad practice
# on systems where multiple processes end up being executed by 'daemon' but
# here we only ever run one process anyway.
ENV RUN_USER daemon
ENV RUN_GROUP daemon


# Install git, download and extract Confluence and create the required directory layout.
# Try to limit the number of RUN instructions to minimise the number of layers that will need to be created.
RUN mkdir -p $CONFLUENCE_INSTALL_DIR \
&& curl -sSL ${DOWNLOAD_URL}${CONFLUENCE_VERSION}.tar.gz | tar -xz --strip=1 -C "$CONFLUENCE_INSTALL_DIR" \
&& curl -sSL ${DOWNLOAD_URL_MYSQL_CONNECTOR}${MYSQL_CONNECTOR_VERSION}.tar.gz | tar xz --strip=1 -C "$CONFLUENCE_INSTALL_DIR/lib" --wildcards --no-anchored '*-bin.jar' \
&& mkdir -p ${CONFLUENCE_INSTALL_DIR}/conf/Catalina \
&& chmod -R 700 ${CONFLUENCE_INSTALL_DIR}/conf/Catalina ${CONFLUENCE_INSTALL_DIR}/logs ${CONFLUENCE_INSTALL_DIR}/temp ${CONFLUENCE_INSTALL_DIR}/work \
&& chown -R root:root ${CONFLUENCE_INSTALL_DIR} \
&& chown -R ${RUN_USER}:${RUN_GROUP} ${CONFLUENCE_INSTALL_DIR}/logs ${CONFLUENCE_INSTALL_DIR}/temp ${CONFLUENCE_INSTALL_DIR}/work ${CONFLUENCE_INSTALL_DIR}/conf

USER ${RUN_USER}:${RUN_GROUP}

VOLUME ["${CONFLUENCE_HOME}"]

# HTTP Port
EXPOSE 8090

WORKDIR $CONFLUENCE_INSTALL_DIR

# Run in foreground
CMD ["./bin/start-confluence.sh", "-fg"]
