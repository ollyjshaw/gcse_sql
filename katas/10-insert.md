# Kata 10: INSERT

**Before you start:** run `./setup.sh` so your data matches the examples.

**You'll learn:** adding a new record

From here on, the katas **change** the data. If you make a mess of your own copy, `./setup.sh` puts it back.

## Worked example

A new user joins.

```sql
INSERT INTO User (UserID, FirstName, Surname, Email, Town, YearOfBirth, DateJoined)
VALUES (6, 'Zara', 'Ahmed', 'zara.a@example.com', 'Hexham', 2009, '2026-11-25');
```

Nothing is shown when it works. Check it's there:

```sql
SELECT * FROM User WHERE UserID = 6;
```

```
┌────────┬───────────┬─────────┬────────────────────┬────────┬─────────────┬────────────┐
│ UserID │ FirstName │ Surname │       Email        │  Town  │ YearOfBirth │ DateJoined │
├────────┼───────────┼─────────┼────────────────────┼────────┼─────────────┼────────────┤
│ 6      │ Zara      │ Ahmed   │ zara.a@example.com │ Hexham │ 2009        │ 2026-11-25 │
└────────┴───────────┴─────────┴────────────────────┴────────┴─────────────┴────────────┘
```

- The first brackets list the fields. The `VALUES` brackets give the values **in the same order**.
- Text in quotes, numbers without.
- Try running the same INSERT again. You'll get an error, because there's already a user 6 and a primary key must be unique. That's the database protecting itself.

## Your turn

Add this track:

| TrackID | Title | Artist | Genre | LengthSeconds | ReleaseYear | Price |
|---|---|---|---|---|---|---|
| 11 | Northern Lights | Sunny Daze | Pop | 194 | 2026 | 1.29 |

Write it in `answers/10.sql`, then run `./check.sh 10`

<details><summary>Hint</summary>

`INSERT INTO Track (field, field, ...) VALUES (value, value, ...);`
</details>
