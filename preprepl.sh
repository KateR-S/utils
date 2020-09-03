#!/bin/bash

exec 2> /dev/null

STOPVAL=$(ps -ef | grep -e 'postgres' | grep -v 'pts' | head -n 1 | awk '{ print $10}')
ANS=$(pg_ctl stop -D $STOPVAL)

rm -rf /tmp/kafka-log* ; rm -rf /tmp/schema-registry*