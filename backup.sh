#!/bin/sh
set -eu

sudo -u postgres pg_dump --compress=0 --exclude-table=cert --exclude-table=log_entry ct-watch > db.dump
tarsnap -c -v --keyfile ~/.tarsnap.ctwatch.write.key -f database.$(date -u +"%Y%m%dT%H%M%SZ") db.dump
