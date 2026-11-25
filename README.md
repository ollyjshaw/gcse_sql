# Abby's SQL practice database

A small music download shop database for practising GCSE Computer Science SQL. Three tables (`User`, `Track`, `Download`), 15 katas that build up one step at a time, and a checker that tells you whether your answer is right.

It uses **SQLite**, which is already built into every Mac. Nothing to install, no accounts, no passwords. The whole database is one file, `abby.db`.

## Setting up (first time, or on a new Mac)

Open **Terminal** (Cmd+Space, type Terminal, press Enter) and go to this folder, for example:

```
cd ~/projects/gcse_sql
```

(Change the path if the folder is somewhere else. A shortcut: type `cd ` with a space, drag the folder from Finder into the Terminal window, press Enter.)

Then build the database:

```
./setup.sh
```

You should see:

```
Built abby.db
  User:     5 rows
  Track:    10 rows
  Download: 20 rows
```

If you get `permission denied`, run `chmod +x *.sh` once and try again.

## Doing the katas

Start with `katas/00-start-here.md`. Each kata has:

1. A **worked example** to type in and run yourself.
2. A **your turn** task. Write the SQL in `answers/NN.sql` (for example `answers/03.sql`).
3. Check it with `./check.sh 3`. It says `PASSED` or `NOT YET` with a clue about what's wrong.

| Kata | Topic |
|---|---|
| 00 | Start here: the tables, primary and foreign keys |
| 01 | `SELECT * FROM` |
| 02 | Choosing fields |
| 03 | `WHERE` |
| 04 | Comparisons `< > <= >= <>` |
| 05 | `AND` and `OR` |
| 06 | `ORDER BY` |
| 07 | `LIKE` and wildcards |
| 08 | Joining two tables |
| 09 | Joining three tables |
| 10 | `INSERT` |
| 11 | `UPDATE` |
| 12 | `DELETE` and referential integrity |
| 13 | Stretch: `COUNT` and `GROUP BY` |
| 14 | `DROP TABLE` and cleaning up |

`./check.sh all` checks every kata at once. Model answers are in `solutions/`, for when you're properly stuck.

The checker always works on its own fresh copy of the database, so nothing you've done to `abby.db` affects it, and checking never changes `abby.db`.

## Viewing the tables

### In Terminal (built in)

```
./open.sh
```

This opens the database with tidy table output switched on. Then:

| Type this | To |
|---|---|
| `.tables` | list the tables |
| `.schema Track` | see the fields in a table and their types |
| `SELECT * FROM Track;` | see everything in a table |
| `SELECT * FROM Track LIMIT 5;` | just the first 5 rows |
| `.mode column` | switch to plainer output (if the boxes look odd) |
| `.mode box` | back to boxes |
| `.quit` | leave (or press Ctrl+D) |

Commands starting with a dot are SQLite commands: no semicolon needed. Everything else is SQL and needs a `;` at the end. If you see `...>` it's waiting for the `;`.

Press the up arrow to bring back the last thing you typed.

### With a point and click app (optional)

**DB Browser for SQLite** is free and shows tables like a spreadsheet.

1. Download it from [sqlitebrowser.org](https://sqlitebrowser.org/dl/) (or, with Homebrew: `brew install --cask db-browser-for-sqlite`).
2. Open `abby.db` with it.
3. **Browse Data** tab to look at a table. **Execute SQL** tab to run queries.

Changes made in DB Browser aren't saved until you press **Write Changes**. Close it before running `./setup.sh` or `./cleanup.sh`.

## Starting again and cleaning up

| Command | What it does |
|---|---|
| `./setup.sh` | throws away `abby.db` and builds a fresh one with the original data |
| `./cleanup.sh` | deletes `abby.db` completely (your answers stay) |

## What's in the folder

```
README.md        this file
setup.sh         build a fresh abby.db
open.sh          open abby.db to type SQL
check.sh         check your kata answers
cleanup.sh       delete abby.db
settings.sql     display settings used by open.sh
sql/schema.sql   creates the three tables
sql/seed.sql     the sample data
katas/           the lessons
answers/         your answers go here
solutions/       model answers (no peeking until you've tried)
```

`abby.db` is not saved to GitHub (see `.gitignore`). It's always rebuilt from `sql/` by `./setup.sh`.

## Getting it onto another Mac

It lives at https://github.com/ollyjshaw/gcse_sql

```
cd ~/projects
git clone https://github.com/ollyjshaw/gcse_sql.git
cd gcse_sql
./setup.sh
```

The first time you run `git` on a Mac it may offer to install the Command Line Tools: say yes. No git? Download the zip from the GitHub page (green **Code** button, **Download ZIP**), unzip it, then `./setup.sh`.

To save Abby's answers back to GitHub:

```
git add answers
git commit -m "Kata answers"
git push
```

## SQL cheat sheet

```sql
SELECT field1, field2 FROM Table;                      -- show some fields
SELECT * FROM Table WHERE Field = 'text';              -- filter (text in quotes)
SELECT * FROM Table WHERE Field >= 10 AND Other <> 3;  -- numbers, AND/OR
SELECT * FROM Table WHERE Field LIKE 'S%';             -- % any characters, _ one character
SELECT * FROM Table ORDER BY Field DESC;               -- sort (ASC is the default)

SELECT A.Field, B.Field                                -- two tables
FROM A, B
WHERE A.KeyID = B.KeyID;                               -- the join: foreign key = primary key

INSERT INTO Table (F1, F2) VALUES ('x', 5);            -- add a record
UPDATE Table SET F1 = 'y' WHERE ID = 3;                -- change records (don't forget WHERE!)
DELETE FROM Table WHERE ID = 3;                        -- remove records (don't forget WHERE!)
DROP TABLE Table;                                      -- remove the whole table
```
