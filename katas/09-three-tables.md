# Kata 09: Three tables

**You'll learn:** joining all three tables

## Worked example

Who downloaded the track "Neon Rain", and when?

The track name is in `Track`, the people are in `User`, and `Download` sits in the middle linking them. So you need all three, and **two** join conditions (one for each link).

```sql
SELECT User.FirstName, User.Surname, Download.DownloadDate
FROM User, Download, Track
WHERE User.UserID = Download.UserID
  AND Download.TrackID = Track.TrackID
  AND Track.Title = 'Neon Rain';
```

```
┌───────────┬─────────┬──────────────┐
│ FirstName │ Surname │ DownloadDate │
├───────────┼─────────┼──────────────┤
│ Maya      │ Patel   │ 2024-07-21   │
│ Jack      │ Robson  │ 2023-12-24   │
│ Sophie    │ Clarke  │ 2024-09-02   │
└───────────┴─────────┴──────────────┘
```

Rule of thumb: **tables minus one = number of join conditions.** Two tables need one, three tables need two.

## Your turn

Show the `Title` and `Artist` of every track that **Maya Patel** downloaded, in title order A to Z.

Use her name in your query, not her UserID. (Pretend you don't know her ID.)

Write it in `answers/09.sql`, then run `./check.sh 9`

<details><summary>Hint</summary>

Copy the worked example. Change what you SELECT, and swap the last condition for two conditions on `User.FirstName` and `User.Surname`. Then add the `ORDER BY`.
</details>
