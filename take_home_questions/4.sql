--Count all the times that Martin Scorsese directed.

SELECT COUNT(*) AS num_movies
FROM directors
JOIN people ON directors.person_id = people.id
WHERE people.name = 'Martin Scorsese';
