# Kata 01: SELECT everything

**You'll learn:** `SELECT * FROM`

## Worked example

Show every field of every record in the `User` table.

```sql
SELECT * FROM User;
```

- `SELECT` means "show me".
- `*` means "every field (column)".
- `FROM User` says which table.
- The `;` marks the end of the statement. Forget it and SQLite waits for more (you'll see `...>`). Just type `;` and press Enter.

Result:

```
┌────────┬───────────┬─────────┬─────────────────────────┬────────────┬─────────────┬────────────┐
│ UserID │ FirstName │ Surname │          Email          │    Town    │ YearOfBirth │ DateJoined │
├────────┼───────────┼─────────┼─────────────────────────┼────────────┼─────────────┼────────────┤
│ 1      │ Maya      │ Patel   │ maya.p@example.com      │ Durham     │ 2009        │ 2024-01-14 │
│ 2      │ Jack      │ Robson  │ jack.robson@example.com │ Leeds      │ 2008        │ 2023-11-02 │
│ 3      │ Sophie    │ Clarke  │ sophie.c@example.com    │ York       │ 2010        │ 2024-03-22 │
│ 4      │ Harry     │ Bennett │ harry.b@example.com     │ Durham     │ 2009        │ 2024-06-05 │
│ 5      │ Noah      │ Kaur    │ noah.k@example.com      │ Sunderland │ 2006        │ 2023-07-21 │
└────────┴───────────┴─────────┴─────────────────────────┴────────────┴─────────────┴────────────┘
```

SQL keywords like `SELECT` don't have to be in capitals, but everyone writes them that way so they stand out. Exam answers do too.

## Your turn

Show every field of every record in the `Track` table.

Write it in `answers/01.sql`, then run `./check.sh 1`

<details><summary>Hint</summary>

Same as the example, different table name.
</details>
