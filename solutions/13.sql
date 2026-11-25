SELECT Track.Genre, COUNT(*) AS Downloads
FROM Download, Track
WHERE Download.TrackID = Track.TrackID
GROUP BY Track.Genre
ORDER BY Downloads DESC, Track.Genre ASC;
