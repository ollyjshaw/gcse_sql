# Kata 07: LIKE and wildcards

**You'll learn:** searching for part of some text

## Worked example

Show tracks whose title starts with S.

```sql
SELECT Title
FROM Track
WHERE Title LIKE 'S%';
```

```
┌──────────────────┐
│      Title       │
├──────────────────┤
│ Starlight Avenue │
│ Static Heart     │
└──────────────────┘
```

- `%` means "any number of characters (including none)".
- `_` means "exactly one character".

| Pattern | Matches |
|---|---|
| `'S%'` | starts with S |
| `'%y'` | ends with y |
| `'%rain%'` | has "rain" anywhere in it |
| `'_e%'` | second letter is e |

In SQLite, `LIKE` ignores capitals, so `'s%'` and `'S%'` do the same thing. Some other databases don't, so in exams match the capitals properly.

## Your turn

Show the `Title` and `Artist` of every track with the word `light` anywhere in its title.

Write it in `answers/07.sql`, then run `./check.sh 7`

<details><summary>Hint</summary>

You need a `%` on both sides.
</details>
