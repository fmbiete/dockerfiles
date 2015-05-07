**Base:** centos_epel_systemd

**Extra:**

    - NDJBDNS (axfrdns)


**Notes:**

    docker run -d --name app_axfrdns -v /mnt/dns:/mnt/dns -e "CONFILE=/mnt/dns/axfrdns.conf" -e "LOGFILE=/mnt/dns/logs/axfrdns.log" -p 53:53 fbiete/centos_epel_ndjbdns_axfrdns
