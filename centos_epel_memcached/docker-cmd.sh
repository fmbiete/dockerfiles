#!/bin/bash
set -e

/usr/bin/memcached -p $MEMCACHED_PORT -m $MEMCACHED_CACHESIZE -c $MEMCACHED_MAXCONN $MEMCACHED_OPTIONS