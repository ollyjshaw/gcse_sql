# Kata 12: DELETE

**Before you start:** run `./setup.sh` so your data matches the examples.

**You'll learn:** removing records, and why foreign keys matter

## Worked example

Track 10 ("Static Heart") is withdrawn from the shop. Nobody ever downloaded it.

```sql
DELETE FROM Track
WHERE TrackID = 10;
```

```sql
SELECT COUNT(*) FROM Track;
```

```
┌──────────┐
│ COUNT(*) │
├──────────┤
│ 9        │
└──────────┘
```

Same big danger as UPDATE: `DELETE FROM Track;` with no `WHERE` empties the whole table.

## Now try deleting Maya

```sql
DELETE FROM User WHERE UserID = 1;
```

You get an error: **FOREIGN KEY constraint failed.**

Maya has downloads. Those rows in `Download` have `UserID = 1`. If she disappeared, they'd point at a user who doesn't exist. The database refuses, to keep the data consistent. This is called **referential integrity**, and it's a good phrase to use in an exam answer.

To remove Maya properly, you'd delete her downloads first, then her:

```sql
DELETE FROM Download WHERE UserID = 1;
DELETE FROM User WHERE UserID = 1;
```

Run `./setup.sh` afterwards to get her back.

## Your turn

Noah Kaur has closed his account. Delete him from the `User` table, using his name (not his ID).

He has no downloads, so it will work without touching `Download`.

Write it in `answers/12.sql`, then run `./check.sh 12`

<details><summary>Hint</summary>

Two conditions joined with `AND`, one on `FirstName` and one on `Surname`.
</details>
