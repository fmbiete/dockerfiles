#!/bin/bash
set -e

if [ $# -ne 3 ]
then
    echo "Usage: $0 <locale> <charmap> <>"
    exit 1
fi

localedef -c -i $1 -f $2 $3
if localedef --list-archive | grep "$3" > /dev/null
then
    echo "OK: Locale generated <$3>"
    exit 0
else
    echo "ERROR: No locale generated"
    echo "Locales available"
    localedef --list-archive
    exit 1
fi