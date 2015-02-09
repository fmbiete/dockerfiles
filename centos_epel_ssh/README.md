Base: centos_epel:7

Extra:

    - OpenSSH Server


RUN EXAMPLE:

    docker run --name app_ssh -p 8022:22 -d fbiete/centos_epel_ssh:7

    docker stop app_ssh

    docker start app_ssh


Change root password

    openssl passwd -1 changeme

    docker exec -t -i app_ssh bash

    Paste the new password in /etc/shadow


Access SSH

    docker inspect app_ssh | grep IPAddress

    ssh root@IPAddress