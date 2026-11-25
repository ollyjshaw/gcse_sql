# Kata 04: Comparisons

**You'll learn:** `<  >  <=  >=  <>`

## Worked example

Show the title and release year of tracks released in 2024 or later.

```sql
SELECT Title, ReleaseYear
FROM Track
WHERE ReleaseYear >= 2024;
```

```
┌───────────────────┬─────────────┐
│       Title       │ ReleaseYear │
├───────────────────┼─────────────┤
│ Golden Hour Drive │ 2024        │
│ Starlight Avenue  │ 2025        │
│ Lighthouse Keeper │ 2024        │
└───────────────────┴─────────────┘
```

| Operator | Means |
|---|---|
| `=` | equal to |
| `<>` | not equal to (`!=` also works in SQLite) |
| `<` | less than |
| `>` | greater than |
| `<=` | less than or equal to |
| `>=` | greater than or equal to |

Watch the edges: `> 2024` would leave out the 2024 tracks. `>= 2024` keeps them.

## Your turn

Show the `Title` and `LengthSeconds` of every track that is shorter than 3 minutes (180 seconds). A track of exactly 180 seconds would not count.

Write it in `answers/04.sql`, then run `./check.sh 4`

<details><summary>Hint</summary>

"Shorter than" means `<`. Don't put quotes round numbers.
</details>
