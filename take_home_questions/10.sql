--Barbenheimer. In 2023, Christopher Nolan and Greta Gerwig each released a new movie. These movies already exist in the database, but they have no ratings. Write a single query to add a rating to one of these movies. For these movies, you can assume there is only one movie with the same title and year in the database.

SELECT ratings.movie_id
FROM ratings
WHERE movie_id IN (
    SELECT movies.id
    FROM movies
    JOIN directors ON movies.id = directors.movie_id
    JOIN people ON directors.person_id = people.id
    WHERE movies.year = 2023
      AND people.name IN ('Christopher Nolan', 'Greta Gerwig')
);


