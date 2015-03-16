Base: centos_epel

Extra:

    - SYSTEMD

Notes:

    Some services cannot run as foreground, we need a real systemd to be able to run init as foreground process