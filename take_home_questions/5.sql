--List star names and the number of movies they have appeared in (acted). List only the stars that have appeared in at least 300 movies.

SELECT people.name, COUNT(stars.movie_id) AS movie_count
FROM stars
JOIN people ON stars.person_id = people.id
GROUP BY people.name
HAVING movie_count >= 300
ORDER BY movie_count DESC;
