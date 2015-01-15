#!/bin/bash
set -e

if [ -z "$SLAPCAT_FILE" ]
then
    rm -rf /var/lib/ldap/*
    slapadd -l $SLAPCAT_FILE
    rm -f $SLAPCAT_FILE
fi

chown -R ldap:ldap /etc/openldap/slapd.d
chown -R ldap:ldap /var/lib/ldap

exec "$@"
