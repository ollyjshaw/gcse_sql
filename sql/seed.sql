-- Sample data. All people, artists and tracks are made up.

PRAGMA foreign_keys = ON;

INSERT INTO User (UserID, FirstName, Surname, Email, Town, YearOfBirth, DateJoined) VALUES
 (1, 'Maya',   'Patel',   'maya.p@example.com',      'Durham',     2009, '2024-01-14'),
 (2, 'Jack',   'Robson',  'jack.robson@example.com', 'Leeds',      2008, '2023-11-02'),
 (3, 'Sophie', 'Clarke',  'sophie.c@example.com',    'York',       2010, '2024-03-22'),
 (4, 'Harry',  'Bennett', 'harry.b@example.com',     'Durham',     2009, '2024-06-05'),
 (5, 'Noah',   'Kaur',    'noah.k@example.com',      'Sunderland', 2006, '2023-07-21');

INSERT INTO Track (TrackID, Title, Artist, Genre, LengthSeconds, ReleaseYear, Price) VALUES
 (1,  'Neon Rain',         'The Velvet Static', 'Indie',      214, 2021, 0.99),
 (2,  'Midnight Signal',   'The Velvet Static', 'Indie',      241, 2023, 1.29),
 (3,  'Paper Planets',     'Luna Skye',         'Pop',        172, 2022, 0.99),
 (4,  'Golden Hour Drive', 'Luna Skye',         'Pop',        205, 2024, 1.29),
 (5,  'Starlight Avenue',  'Luna Skye',         'Pop',        187, 2025, 1.29),
 (6,  'Circuit Breaker',   'DJ Quantum',        'Electronic', 287, 2023, 0.99),
 (7,  'Hollow Pines',      'Fern and Fable',    'Folk',       263, 2019, 0.79),
 (8,  'Lighthouse Keeper', 'Fern and Fable',    'Folk',       248, 2024, 1.29),
 (9,  'Concrete Crown',    'MC Northside',      'Hip Hop',    176, 2022, 0.99),
 (10, 'Static Heart',      'Iron Lanterns',     'Rock',       274, 2018, 0.79);

INSERT INTO Download (DownloadID, UserID, TrackID, DownloadDate) VALUES
 (1,  1, 3, '2024-01-15'),
 (2,  1, 4, '2024-05-02'),
 (3,  1, 5, '2025-03-10'),
 (4,  1, 1, '2024-07-21'),
 (5,  2, 9, '2023-11-03'),
 (6,  2, 1, '2023-12-24'),
 (7,  2, 6, '2024-02-11'),
 (8,  2, 7, '2023-10-05'),
 (9,  3, 5, '2025-02-28'),
 (10, 3, 1, '2024-09-02'),
 (11, 3, 8, '2024-09-15'),
 (12, 3, 2, '2024-09-02'),
 (13, 4, 6, '2024-06-06'),
 (14, 4, 9, '2024-10-31'),
 (15, 4, 3, '2025-04-19'),
 (16, 4, 4, '2024-06-06'),
 (17, 1, 8, '2025-06-20'),
 (18, 2, 5, '2025-08-15'),
 (19, 3, 3, '2025-04-02'),
 (20, 4, 2, '2025-01-10');
