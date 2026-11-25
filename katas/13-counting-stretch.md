# Kata 13 (stretch): COUNT and GROUP BY

**You'll learn:** totals. Most GCSE specs don't require this, but it's how real databases answer questions like "what's popular?"

**Before you start:** run `./setup.sh` so your data matches the examples.

## Worked example

How many downloads are there altogether?

```sql
SELECT COUNT(*) FROM Download;
```

```
┌──────────┐
│ COUNT(*) │
├──────────┤
│ 20       │
└──────────┘
```

How many downloads has each user made?

```sql
SELECT UserID, COUNT(*) AS Downloads
FROM Download
GROUP BY UserID;
```

```
┌────────┬───────────┐
│ UserID │ Downloads │
├────────┼───────────┤
│ 1      │ 5         │
│ 2      │ 5         │
│ 3      │ 5         │
│ 4      │ 5         │
└────────┴───────────┘
```

- `COUNT(*)` counts rows.
- `GROUP BY UserID` makes one group per user, and counts each group separately.
- `AS Downloads` gives the column a nicer name. You can use that name in `ORDER BY`.
- Others to try: `SUM(Price)`, `AVG(LengthSeconds)`, `MAX(ReleaseYear)`, `MIN(Price)`.

## Your turn

Which genre is most popular? Show each `Genre` and how many times tracks in that genre have been downloaded. Most downloads first. If two genres tie, put them in alphabetical order.

Write it in `answers/13.sql`, then run `./check.sh 13`

<details><summary>Hint</summary>

Genre lives in `Track` and downloads live in `Download`, so join them (kata 08), then `GROUP BY Track.Genre`, then `ORDER BY` the count `DESC` and the genre `ASC`.
</details>
