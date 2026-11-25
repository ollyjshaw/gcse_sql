SELECT Track.Title, Download.DownloadDate
FROM Download, Track
WHERE Download.TrackID = Track.TrackID
  AND Download.UserID = 3
ORDER BY Download.DownloadDate ASC, Track.Title ASC;
