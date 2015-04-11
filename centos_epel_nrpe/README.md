Base: centos_epel_systemd

Extra:

    - NRPE
    - Nagios-Plugins all (~80MB installed)

Notes:

    nrpe.cfg: (allowed_hosts)

        - Add any IP needed
        - 172.17.0.0/16 references the docker internal network, change if needed