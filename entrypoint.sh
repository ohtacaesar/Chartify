#!/bin/sh

set -e

rake initdb

exec "$@"
