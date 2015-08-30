FROM fbiete/centos_epel_java:1.8
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

ENV STASH_VERSION 3.11.2
ENV MYSQL_CONNECTOR_VERSION 5.1.35

ENV DOWNLOAD_URL https://downloads.atlassian.com/software/stash/downloads/atlassian-stash-
ENV DOWNLOAD_URL_MYSQL_CONNECTOR http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-

# https://confluence.atlassian.com/display/STASH/Stash+home+directory
ENV STASH_HOME /var/atlassian/application-data/stash

# Install Atlassian Stash to the following location
ENV STASH_INSTALL_DIR /opt/atlassian/stash

# Use the default unprivileged account. This could be considered bad practice
# on systems where multiple processes end up being executed by 'daemon' but
# here we only ever run one process anyway.
ENV RUN_USER daemon
ENV RUN_GROUP daemon


# Install git, download and extract Stash and create the required directory layout.
# Try to limit the number of RUN instructions to minimise the number of layers that will need to be created.
RUN yum clean all \
&& yum install -y \
git \
&& yum clean all \
&& mkdir -p $STASH_INSTALL_DIR \
&& curl -L --silent ${DOWNLOAD_URL}${STASH_VERSION}.tar.gz | tar -xz --strip=1 -C "$STASH_INSTALL_DIR" \
&& curl -L --silent ${DOWNLOAD_URL_MYSQL_CONNECTOR}${MYSQL_CONNECTOR_VERSION}.tar.gz | tar xz --strip=1 -C "$STASH_INSTALL_DIR/lib" --wildcards --no-anchored '*-bin.jar' \
&& mkdir -p ${STASH_INSTALL_DIR}/conf/Catalina \
&& chmod -R 700 ${STASH_INSTALL_DIR}/conf/Catalina ${STASH_INSTALL_DIR}/logs ${STASH_INSTALL_DIR}/temp ${STASH_INSTALL_DIR}/work \
&& chown -R root:root ${STASH_INSTALL_DIR} \
&& chown -R ${RUN_USER}:${RUN_GROUP} ${STASH_INSTALL_DIR}/logs ${STASH_INSTALL_DIR}/temp ${STASH_INSTALL_DIR}/work ${STASH_INSTALL_DIR}/conf

USER ${RUN_USER}:${RUN_GROUP}

VOLUME ["${STASH_HOME}"]

# HTTP Port
EXPOSE 7990

# SSH Port
EXPOSE 7999

WORKDIR $STASH_INSTALL_DIR

# Run in foreground
CMD ["./bin/start-stash.sh", "-fg"]
