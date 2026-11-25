#!/bin/bash
# Checks your answer to a kata.
#   ./check.sh 3      checks answers/03.sql
#   ./check.sh all    checks every kata
#
# To test the checker itself (every kata should pass):
#   ANSWERS_DIR=solutions ./check.sh all
#
# How it works: it builds two brand new copies of the database, runs your
# answer on one and the model solution on the other, then compares both the
# results and what the tables look like afterwards. Your real abby.db is
# never touched, so you can't break anything by checking.

cd "$(dirname "$0")"

build_db() {
    rm -f "$1"
    sqlite3 "$1" < sql/schema.sql
    sqlite3 "$1" < sql/seed.sql
}

# Run a .sql file against a db. Prints the query results, then a snapshot of every table.
run_sql() {
    local db="$1" file="$2"
    sqlite3 -batch -bail -noheader -list -cmd "PRAGMA foreign_keys = ON;" "$db" < "$file" 2>"$db.err"
    echo "=== TABLES AFTER ==="
    for t in $(sqlite3 "$db" "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;"); do
        echo "--- $t"
        sqlite3 -noheader -list "$db" "SELECT * FROM \"$t\" ORDER BY 1;"
    done
}

check_one() {
    local n answer solution tmp
    n=$(printf "%02d" "$((10#$1))")
    answer="${ANSWERS_DIR:-answers}/$n.sql"
    solution="solutions/$n.sql"

    if [ ! -f "$solution" ]; then
        echo "Kata $n: there's no kata with that number."
        return 1
    fi
    if [ ! -f "$answer" ] || ! grep -v '^[[:space:]]*--' "$answer" | grep -q '[^[:space:]]'; then
        echo "Kata $n: no answer yet. Write your SQL in $answer"
        return 1
    fi

    tmp=$(mktemp -d)
    build_db "$tmp/yours.db"
    build_db "$tmp/model.db"
    run_sql "$tmp/yours.db" "$answer"   > "$tmp/yours.out"
    run_sql "$tmp/model.db" "$solution" > "$tmp/model.out"

    if [ -s "$tmp/yours.db.err" ]; then
        echo "Kata $n: NOT YET. SQLite gave an error:"
        sed 's/^/    /' "$tmp/yours.db.err"
        rm -rf "$tmp"
        return 1
    fi

    # If the model answer doesn't sort the results, the order doesn't matter,
    # so sort both before comparing.
    if ! grep -qi 'ORDER BY' "$solution"; then
        sed '/=== TABLES AFTER ===/,$d' "$tmp/yours.out" | sort > "$tmp/yours.q"
        sed '/=== TABLES AFTER ===/,$d' "$tmp/model.out" | sort > "$tmp/model.q"
    else
        sed '/=== TABLES AFTER ===/,$d' "$tmp/yours.out" > "$tmp/yours.q"
        sed '/=== TABLES AFTER ===/,$d' "$tmp/model.out" > "$tmp/model.q"
    fi
    sed -n '/=== TABLES AFTER ===/,$p' "$tmp/yours.out" > "$tmp/yours.t"
    sed -n '/=== TABLES AFTER ===/,$p' "$tmp/model.out" > "$tmp/model.t"

    if ! cmp -s "$tmp/yours.q" "$tmp/model.q"; then
        echo "Kata $n: NOT YET. Your results don't match."
        echo "  Your results ($(wc -l < "$tmp/yours.q" | tr -d ' ') rows):"
        head -15 "$tmp/yours.q" | sed 's/^/    /'
        echo "  Expected ($(wc -l < "$tmp/model.q" | tr -d ' ') rows):"
        head -15 "$tmp/model.q" | sed 's/^/    /'
        echo "  Check: right columns? right order of columns? right rows? sorted the right way?"
        rm -rf "$tmp"
        return 1
    fi
    if ! cmp -s "$tmp/yours.t" "$tmp/model.t"; then
        echo "Kata $n: NOT YET. Your query ran, but the tables ended up different. Differences:"
        diff "$tmp/yours.t" "$tmp/model.t" | grep '^[<>]' | head -15 | sed 's/^</    yours:   /; s/^>/    expected:/'
        rm -rf "$tmp"
        return 1
    fi

    echo "Kata $n: PASSED"
    rm -rf "$tmp"
    return 0
}

if [ -z "$1" ]; then
    echo "Usage: ./check.sh 3     (or ./check.sh all)"
    exit 1
fi

if [ "$1" = "all" ]; then
    passed=0; total=0
    for f in solutions/*.sql; do
        num=$(basename "$f" .sql)
        total=$((total + 1))
        if check_one "$num"; then passed=$((passed + 1)); fi
    done
    echo
    echo "$passed out of $total katas passed."
else
    check_one "$1"
fi
