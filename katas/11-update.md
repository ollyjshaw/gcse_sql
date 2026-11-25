# Kata 11: UPDATE

**Before you start:** run `./setup.sh` so your data matches the examples.

**You'll learn:** changing existing records

## Worked example

Track 7 goes up in price to £0.99.

```sql
UPDATE Track
SET Price = 0.99
WHERE TrackID = 7;
```

Check it:

```sql
SELECT TrackID, Title, Price FROM Track WHERE TrackID = 7;
```

```
┌─────────┬──────────────┬───────┐
│ TrackID │    Title     │ Price │
├─────────┼──────────────┼───────┤
│ 7       │ Hollow Pines │ 0.99  │
└─────────┴──────────────┴───────┘
```

- `SET` says which field changes and its new value. You can change more than one: `SET Price = 0.99, Genre = 'Rock'`
- `WHERE` says which records to change.

**The big danger:** forget the `WHERE` and *every* record changes. `UPDATE Track SET Price = 0.99;` makes every track cost 99p. Try it on your copy, look at the damage with `SELECT * FROM Track;`, then `./setup.sh` to fix it.

## Your turn

Sale! Every track released **before 2020** drops to a price of `0.59`.

Write it in `answers/11.sql`, then run `./check.sh 11`

<details><summary>Hint</summary>

The `WHERE` here picks out several tracks, not just one. "Before 2020" means `< 2020`.
</details>
