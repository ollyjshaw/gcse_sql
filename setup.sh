#!/bin/bash
# Builds a fresh copy of the database (abby.db) from the files in sql/.
# Safe to run as often as you like: it throws away the old abby.db and starts again.

set -e
cd "$(dirname "$0")"

if ! command -v sqlite3 >/dev/null 2>&1; then
    echo "sqlite3 not found. It comes with macOS, so try: xcode-select --install"
    exit 1
fi

rm -f abby.db abby.db-journal abby.db-wal abby.db-shm
sqlite3 abby.db < sql/schema.sql
sqlite3 abby.db < sql/seed.sql

echo "Built abby.db"
sqlite3 abby.db "SELECT '  User:     ' || COUNT(*) || ' rows' FROM User;
                 SELECT '  Track:    ' || COUNT(*) || ' rows' FROM Track;
                 SELECT '  Download: ' || COUNT(*) || ' rows' FROM Download;"
echo "Open it with: ./open.sh"
