--Find the names of all directors who directed a movie rated 8.5 or higher.

SELECT DISTINCT people.name
FROM people
JOIN directors ON people.id = directors.person_id
JOIN ratings ON directors.movie_id = ratings.movie_id
WHERE ratings.rating >= 8.5;