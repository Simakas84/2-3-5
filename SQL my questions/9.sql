--List the titles of all movies in which both Tom Hanks and Meryl Streep starred in the same movie.

SELECT movies.title
FROM movies
JOIN stars ON movies.id = stars.movie_id
JOIN people ON stars.person_id = people.id
WHERE people.name = 'Tom Hanks'
  AND movies.id IN (
    SELECT movies.id
    FROM movies
    JOIN stars ON movies.id = stars.movie_id
    JOIN people ON stars.person_id = people.id
    WHERE people.name = 'Meryl Streep'
);