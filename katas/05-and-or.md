# Kata 05: AND and OR

**You'll learn:** combining conditions

## Worked example

Show Pop tracks that cost £1.29.

```sql
SELECT Title, Genre, Price
FROM Track
WHERE Genre = 'Pop' AND Price = 1.29;
```

```
┌───────────────────┬───────┬───────┐
│       Title       │ Genre │ Price │
├───────────────────┼───────┼───────┤
│ Golden Hour Drive │ Pop   │ 1.29  │
│ Starlight Avenue  │ Pop   │ 1.29  │
└───────────────────┴───────┴───────┘
```

- `AND`: both conditions must be true. Fewer results.
- `OR`: at least one must be true. More results.

A classic mistake: `WHERE Town = 'Leeds' OR 'York'` doesn't work. Each side needs the full condition: `WHERE Town = 'Leeds' OR Town = 'York'`.

When you mix them, use brackets so it's obvious what goes together:

```sql
WHERE Genre = 'Pop' AND (ReleaseYear = 2024 OR ReleaseYear = 2025)
```

## Your turn

Show the `FirstName`, `Surname` and `Town` of every user who lives in Leeds or York.

Write it in `answers/05.sql`, then run `./check.sh 5`

<details><summary>Hint</summary>

Read the "classic mistake" bit again.
</details>
