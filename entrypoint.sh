#!/bin/sh

rake initdb

set -e

exec "$@"
