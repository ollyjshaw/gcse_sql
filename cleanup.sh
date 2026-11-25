#!/bin/bash
# Deletes the database file. Your answers/ and everything else stay put.
# To get the database back, run ./setup.sh

cd "$(dirname "$0")"

if [ -e abby.db ] || [ -e abby.db-journal ] || [ -e abby.db-wal ] || [ -e abby.db-shm ]; then
    rm -f abby.db abby.db-journal abby.db-wal abby.db-shm
    echo "Deleted abby.db. Run ./setup.sh to build a fresh one."
else
    echo "Nothing to clean up: abby.db doesn't exist."
fi
