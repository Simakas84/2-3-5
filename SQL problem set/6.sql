SELECT AVG(ratings.rating) AS AVG_RATING
FROM movies
JOIN ratings ON movies.id = ratings.movie_id
WHERE movies.year = 2012;
