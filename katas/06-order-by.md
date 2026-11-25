# Kata 06: ORDER BY

**Before you start:** run `./setup.sh` so your data matches the examples.

**You'll learn:** sorting results

## Worked example

Show every track's title and release year, newest first. Where two tracks came out in the same year, put them in alphabetical order.

```sql
SELECT Title, ReleaseYear
FROM Track
ORDER BY ReleaseYear DESC, Title ASC;
```

```
┌───────────────────┬─────────────┐
│       Title       │ ReleaseYear │
├───────────────────┼─────────────┤
│ Starlight Avenue  │ 2025        │
│ Golden Hour Drive │ 2024        │
│ Lighthouse Keeper │ 2024        │
│ Circuit Breaker   │ 2023        │
│ Midnight Signal   │ 2023        │
│ Concrete Crown    │ 2022        │
│ Paper Planets     │ 2022        │
│ Neon Rain         │ 2021        │
│ Hollow Pines      │ 2019        │
│ Static Heart      │ 2018        │
└───────────────────┴─────────────┘
```

- `ASC` = ascending: A to Z, smallest first. This is the default if you leave it off.
- `DESC` = descending: Z to A, biggest first.
- The second field (`Title`) only decides the order when the first one is a tie.
- `ORDER BY` goes after `WHERE` if you have both:

```sql
SELECT Title FROM Track WHERE Genre = 'Pop' ORDER BY Title ASC;
```

## Your turn

Show the `FirstName` and `Surname` of every user, sorted by surname from A to Z.

Write it in `answers/06.sql`, then run `./check.sh 6`

<details><summary>Hint</summary>

Order of the parts: `SELECT ... FROM ... ORDER BY ...;`
</details>
