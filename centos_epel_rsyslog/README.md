Base: centos_epel

Extra:

    - RSyslog

Instructions:

    docker run -d --name app_rsyslog -v config:/etc/rsyslog.d -v docker_logs:/var/log fbiete/centos_epel_rsyslog:7


- Link this container to other container.

- Add a new config file filtering by tag in the config folder and restart app_rsyslog.

- Add a new logrotate file

- Execute logrotate when desired

    docker exec app_rsyslog /usr/sbin/logrotate /etc/logrotate.conf

