# Kata 02: Choosing fields

**Before you start:** run `./setup.sh` so your data matches the examples.

**You'll learn:** picking which fields to show

## Worked example

Show just the first name, surname and town of every user.

```sql
SELECT FirstName, Surname, Town FROM User;
```

List the field names, separated by commas, instead of `*`. They come out in the order you list them.

```
┌───────────┬─────────┬────────────┐
│ FirstName │ Surname │    Town    │
├───────────┼─────────┼────────────┤
│ Maya      │ Patel   │ Durham     │
│ Jack      │ Robson  │ Leeds      │
│ Sophie    │ Clarke  │ York       │
│ Harry     │ Bennett │ Durham     │
│ Noah      │ Kaur    │ Sunderland │
└───────────┴─────────┴────────────┘
```

No comma after the last field name. `SELECT FirstName, Surname, FROM User` is an error.

## Your turn

Show the `Title` and `Artist` of every track (in that order).

Write it in `answers/02.sql`, then run `./check.sh 2`

<details><summary>Hint</summary>

`SELECT field1, field2 FROM table;`
</details>
