FROM fbiete/centos_epel_java:1.8
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV JIRA_VERSION 6.4.11
ENV MYSQL_CONNECTOR_VERSION 5.1.35

ENV DOWNLOAD_URL https://downloads.atlassian.com/software/jira/downloads/atlassian-jira-
ENV DOWNLOAD_URL_MYSQL_CONNECTOR http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-

# https://confluence.atlassian.com/display/JIRA/Jira+home+directory
ENV JIRA_HOME /var/atlassian/application-data/jira

# Install Atlassian Jira to the following location
ENV JIRA_INSTALL_DIR /opt/atlassian/jira

# Use the default unprivileged account. This could be considered bad practice
# on systems where multiple processes end up being executed by 'daemon' but
# here we only ever run one process anyway.
ENV RUN_USER daemon
ENV RUN_GROUP daemon


# Install git, download and extract Jira and create the required directory layout.
# Try to limit the number of RUN instructions to minimise the number of layers that will need to be created.
RUN mkdir -p $JIRA_INSTALL_DIR \
&& curl -L --silent ${DOWNLOAD_URL}${JIRA_VERSION}.tar.gz | tar -xz --strip=1 -C "$JIRA_INSTALL_DIR" \
&& curl -L --silent ${DOWNLOAD_URL_MYSQL_CONNECTOR}${MYSQL_CONNECTOR_VERSION}.tar.gz | tar xz --strip=1 -C "$JIRA_INSTALL_DIR/lib" --wildcards --no-anchored '*-bin.jar' \
&& mkdir -p ${JIRA_INSTALL_DIR}/conf/Catalina \
&& chmod -R 700 ${JIRA_INSTALL_DIR}/conf/Catalina ${JIRA_INSTALL_DIR}/logs ${JIRA_INSTALL_DIR}/temp ${JIRA_INSTALL_DIR}/work \
&& chown -R root:root ${JIRA_INSTALL_DIR} \
&& chown -R ${RUN_USER}:${RUN_GROUP} ${JIRA_INSTALL_DIR}/logs ${JIRA_INSTALL_DIR}/temp ${JIRA_INSTALL_DIR}/work ${JIRA_INSTALL_DIR}/conf

USER ${RUN_USER}:${RUN_GROUP}

VOLUME ["${JIRA_HOME}"]

# HTTP Port
EXPOSE 8080

WORKDIR $JIRA_INSTALL_DIR

# Run in foreground
CMD ["./bin/start-jira.sh", "-fg"]
