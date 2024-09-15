--Find all actors who have never starred in a movie with a rating below 7.0.

SELECT people.name, ratings.rating
FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
JOIN ratings ON movies.id = ratings.movie_id
GROUP BY people.name
HAVING MIN(ratings.rating) >= 7.0;