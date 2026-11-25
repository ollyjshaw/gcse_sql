# Kata 14: Clean up

**Before you start:** run `./setup.sh` so your data matches the examples.

**You'll learn:** `DROP TABLE`, and how to get rid of the whole thing

## Worked example

Make a throwaway table, look at it, then get rid of it.

```sql
CREATE TABLE Playlist (
    PlaylistID INTEGER PRIMARY KEY,
    Name TEXT
);
```

```
.tables
```

```
Download  Playlist  Track     User
```

```sql
DROP TABLE Playlist;
```

`DELETE FROM Playlist;` would empty the table but leave it there. `DROP TABLE Playlist;` removes the table completely, structure and all.

## Your turn

Drop all three tables: `Download`, `User` and `Track`.

**Order matters.** Try `DROP TABLE User;` first in `./open.sh` and see what happens. (Think about kata 12: which table has foreign keys pointing at the others?)

Write it in `answers/14.sql`, then run `./check.sh 14`

<details><summary>Hint</summary>

The table holding the foreign keys has to go first, or the other two can't be dropped while records still point at them.
</details>

## Clean up for real

The tables live in one file, `abby.db`. To delete it completely:

```
./cleanup.sh
```

Everything else (the katas, your answers) stays. To start all over again:

```
./setup.sh
```

To see how you did on every kata at once:

```
./check.sh all
```
