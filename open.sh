#!/bin/bash
# Opens the database so you can type SQL. Type .quit (or press Ctrl+D) to leave.

cd "$(dirname "$0")"
[ -f abby.db ] || ./setup.sh

echo "Type SQL ending with a semicolon ;   Useful: .tables   .schema User   .quit"
sqlite3 -init settings.sql abby.db
