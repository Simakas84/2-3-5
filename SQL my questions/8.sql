--Find the movies that received the highest number of votes, regardless of rating.

SELECT movies.title, ratings.votes
FROM movies
JOIN ratings ON movies.id = ratings.movie_id
ORDER BY ratings.votes DESC
LIMIT 1;