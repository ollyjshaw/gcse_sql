# Kata 00: Start here

## How every kata works

1. Run `./setup.sh` so your database is back to the starting data. Some katas change or delete data, and the examples assume you're starting fresh.
2. Read the kata (this folder).
3. Try the **worked example** yourself. Open the database with `./open.sh` and type it in. Don't copy and paste: typing it is how it sticks.
4. Do the **your turn** task. Write your SQL in the matching file in `answers/` (kata 03 goes in `answers/03.sql`).
5. Check it: `./check.sh 3`
6. If it says `NOT YET`, read what it tells you, fix it, check again.
7. Stuck? There's a hint at the bottom of each kata. The model answers are in `solutions/`, but try properly first.

You can't break anything. If the database gets in a mess, run `./setup.sh` and it's brand new again. The checker always uses its own fresh copy, so it doesn't matter what you've done to yours.

## The database

It's a music download shop with three tables.

```
 User                    Download                 Track
 ----------              ------------             -----------
 UserID  (PK) <-------- UserID  (FK)              TrackID (PK)
 FirstName               TrackID (FK) ----------> Title
 Surname                 DownloadID (PK)          Artist
 Email                   DownloadDate             Genre
 Town                                             LengthSeconds
 YearOfBirth                                      ReleaseYear
 DateJoined                                       Price
```

- **PK = primary key.** A field that is different for every record, so each record can be picked out. `UserID` 4 is always Harry Bennett and nobody else.
- **FK = foreign key.** A field that holds the primary key of a record in *another* table. That's how tables link up. A row in `Download` says "user number 4 downloaded track number 6".

Dates are stored as `YYYY-MM-DD`, so `2024-01-15` means 15/01/2024. They're stored that way round so that sorting them puts them in date order.

## Try it now

```
./open.sh
```

Then type these one at a time (the ones starting with a dot are SQLite commands, not SQL, and don't need a semicolon):

```
.tables
.schema Download
SELECT * FROM Download;
.quit
```

There's no answer to check for this one. Move on to kata 01.
