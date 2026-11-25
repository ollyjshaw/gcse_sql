-- Music download shop: the tables
-- Three tables: User, Track and Download.
-- A Download links one User to one Track (it holds a UserID and a TrackID).

PRAGMA foreign_keys = ON;

CREATE TABLE User (
    UserID       INTEGER PRIMARY KEY,   -- primary key: unique number for each user
    FirstName    TEXT    NOT NULL,
    Surname      TEXT    NOT NULL,
    Email        TEXT    NOT NULL UNIQUE,
    Town         TEXT,
    YearOfBirth  INTEGER,
    DateJoined   TEXT                   -- stored as YYYY-MM-DD so dates sort correctly
);

CREATE TABLE Track (
    TrackID        INTEGER PRIMARY KEY, -- primary key: unique number for each track
    Title          TEXT    NOT NULL,
    Artist         TEXT    NOT NULL,
    Genre          TEXT,
    LengthSeconds  INTEGER,
    ReleaseYear    INTEGER,
    Price          REAL                 -- in pounds, e.g. 0.99
);

CREATE TABLE Download (
    DownloadID    INTEGER PRIMARY KEY,
    UserID        INTEGER NOT NULL REFERENCES User(UserID),   -- foreign key
    TrackID       INTEGER NOT NULL REFERENCES Track(TrackID), -- foreign key
    DownloadDate  TEXT    NOT NULL      -- YYYY-MM-DD
);
