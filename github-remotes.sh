#!/bin/bash

trap "rm -f ${SUBDIR_FILE}" EXIT
trap "rm -f ${OTHER_FILE}" EXIT

THIS_DIR=$(pwd)
SUBDIR_FILE=$(mktemp)
OTHER_FILE=$(mktemp)

find ~/ -type d -printf "%p\n" > "${SUBDIR_FILE}"

while IFS='' read -r dirname || [[ -n "$dirname" ]]; do
    (cd "$dirname" && git remote -v)
done < "${SUBDIR_FILE}" > "${OTHER_FILE}"

grep fetch $OTHER_FILE |
    sort |
    uniq |
    awk -F "[ \t]+" '{print $2}' > $THIS_DIR/output/remotes.log
