--Count all movie titles released between 2005 and 2015.

SELECT COUNT(*)
FROM movies
WHERE year BETWEEN 2005 AND 2015;
