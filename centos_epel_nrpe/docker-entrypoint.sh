#!/bin/bash
set -e

/usr/sbin/nrpe -c /etc/nagios/nrpe.cfg -d

exec "$@"
