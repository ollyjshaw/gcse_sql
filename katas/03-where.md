# Kata 03: WHERE

**You'll learn:** picking which records (rows) to show

## Worked example

Show the first name and surname of users who live in Durham.

```sql
SELECT FirstName, Surname
FROM User
WHERE Town = 'Durham';
```

```
┌───────────┬─────────┐
│ FirstName │ Surname │
├───────────┼─────────┤
│ Maya      │ Patel   │
│ Harry     │ Bennett │
└───────────┴─────────┘
```

- `WHERE` is a condition. Only records where it's true are shown.
- Text goes in quotes: `'Durham'`. Numbers don't: `WHERE ReleaseYear = 2025`.
- You can split a statement over several lines. SQLite only cares about the `;` at the end.
- The `WHERE` field doesn't have to be one you're showing. We filtered on `Town` but didn't display it.

## Your turn

Show the `Title` and `Price` of every track by the artist `Luna Skye`.

Write it in `answers/03.sql`, then run `./check.sh 3`

<details><summary>Hint</summary>

The field you need in the WHERE is `Artist`. Spelling and spaces inside the quotes must match exactly.
</details>
