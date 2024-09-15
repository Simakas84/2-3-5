--Find the names of all actors who starred in a movie directed by Quentin Tarantino.

SELECT DISTINCT people.name AS Name
FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
JOIN directors ON movies.id = directors.movie_id
JOIN people AS directors ON directors.person_id = directors.id
WHERE directors.name = 'Quentin Tarantino';