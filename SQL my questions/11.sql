--List the top 3 directors who directed the most highly-rated movies (rating ≥ 9.0).

SELECT people.name, COUNT(movies.id) AS movies_count
FROM people
JOIN directors ON people.id = directors.person_id
JOIN movies ON directors.movie_id = movies.id
JOIN ratings ON movies.id = ratings.movie_id
WHERE ratings.rating >= 9.0
GROUP BY people.name
ORDER BY movies_count DESC
LIMIT 3;
