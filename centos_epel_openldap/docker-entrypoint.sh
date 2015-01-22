#!/bin/bash
set -e

if [ "$SLAPCAT_FILE" ]
then
    if [ ! -f /.openldap_loaded ]
    then
        rm -rf /var/lib/ldap/*
        slapadd -l $SLAPCAT_FILE -q
        touch /.openldap_loaded
        chown -R ldap:ldap /etc/openldap/slapd.d
        chown -R ldap:ldap /var/lib/ldap
    fi
fi

exec "$@"
