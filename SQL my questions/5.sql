--List the top 3 highest-rated movies that were released before the year 2000.

SELECT movies.title
FROM movies
JOIN ratings ON movies.id = ratings.movie_id
WHERE movies.year < 2000
ORDER BY ratings.rating DESC
LIMIT 3;