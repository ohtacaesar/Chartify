#!/bin/sh

set -e

source /usr/local/lib/mustache.sh

cat /tmp/default.conf | mustache > /etc/nginx/conf.d/default.conf

exec "$@"
