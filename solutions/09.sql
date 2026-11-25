SELECT Track.Title, Track.Artist
FROM User, Download, Track
WHERE User.UserID = Download.UserID
  AND Download.TrackID = Track.TrackID
  AND User.FirstName = 'Maya'
  AND User.Surname = 'Patel'
ORDER BY Track.Title ASC;
