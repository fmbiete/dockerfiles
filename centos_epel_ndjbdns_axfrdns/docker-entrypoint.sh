#!/bin/bash
set -e

rm -f /etc/xinetd.d/axfrdns
cp /tmp/axfrdns /etc/xinetd.d/axfrdns
sed -i "s@LOGFILE@$LOGFILE@g" /etc/xinetd.d/axfrdns
sed -i "s@CONFIGFILE@$CONFILE@g" /etc/xinetd.d/axfrdns

/usr/sbin/xinetd -stayalive -pidfile /var/run/xinetd.pid

exec "$@"
