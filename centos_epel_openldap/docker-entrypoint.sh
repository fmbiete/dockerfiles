#!/bin/bash
set -e

chown -R ldap:ldap /etc/openldap/slapd.d
chown -R ldap:ldap /var/lib/ldap

exec "$@"
