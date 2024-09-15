--Find the titles of all movies co-directed by both Christopher Nolan and Quentin Tarantino.

SELECT movies.title
FROM movies
JOIN directors ON movies.id = directors.movie_id
JOIN people ON directors.person_id = people.id
WHERE people.name IN ('Christopher Nolan', 'Quentin Tarantino')
GROUP BY movies.id, movies.title
HAVING COUNT(DISTINCT people.name) = 2;

