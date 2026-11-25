# Kata 08: Two tables at once

**Before you start:** run `./setup.sh` so your data matches the examples.

**You'll learn:** joining tables using a foreign key

## Why

The `Download` table on its own is just numbers:

```
DownloadID | UserID | TrackID | DownloadDate
1          | 1      | 3       | 2024-01-15
```

To see the track's *title* you need to look it up in `Track`. SQL can do the lookup for you.

## Worked example

Show the download ID and track title for every download by user 1.

```sql
SELECT Download.DownloadID, Track.Title
FROM Download, Track
WHERE Download.TrackID = Track.TrackID
  AND Download.UserID = 1;
```

```
┌────────────┬───────────────────┐
│ DownloadID │       Title       │
├────────────┼───────────────────┤
│ 1          │ Paper Planets     │
│ 2          │ Golden Hour Drive │
│ 3          │ Starlight Avenue  │
│ 4          │ Neon Rain         │
│ 17         │ Lighthouse Keeper │
└────────────┴───────────────────┘
```

Line by line:

- `FROM Download, Track`: use both tables.
- `WHERE Download.TrackID = Track.TrackID`: **this is the join.** Only match up a download with the track it's actually for (foreign key = primary key). Leave this out and SQLite pairs every download with every track: 20 x 10 = 200 rows of nonsense. Try it and see.
- `Table.Field` (like `Track.Title`) says which table a field comes from. You must do this when both tables have a field with that name (`TrackID` is in both). It's good practice to always do it.
- `AND Download.UserID = 1`: the normal filter, added on with `AND`.

### You might also see this

Same thing, written with `JOIN`. Either is fine. The `WHERE` version above is the style most GCSE exam papers use.

```sql
SELECT Download.DownloadID, Track.Title
FROM Download
JOIN Track ON Download.TrackID = Track.TrackID
WHERE Download.UserID = 1;
```

## Your turn

Show the `Title` and `DownloadDate` of every track downloaded by user 3.
Sort by download date, oldest first. If two have the same date, put those in title order A to Z.

Write it in `answers/08.sql`, then run `./check.sh 8`

<details><summary>Hint</summary>

Start from the worked example. Change the fields, change the user, then add an `ORDER BY` with two fields (look back at kata 06).
</details>
