SELECT CASE
        WHEN title LIKE 'A%' THEN 'A'
        WHEN title LIKE 'B%' THEN 'B'
        WHEN title LIKE 'C%' THEN 'C'
        WHEN title LIKE 'D%' THEN 'D'
        WHEN title LIKE 'E%' THEN 'E'
        WHEN title LIKE 'F%' THEN 'F'
        WHEN title LIKE 'G%' THEN 'G'
        WHEN title LIKE 'H%' THEN 'H'
        WHEN title LIKE 'I%' THEN 'I'
        WHEN title LIKE 'J%' THEN 'J'
        WHEN title LIKE 'K%' THEN 'K'
        WHEN title LIKE 'L%' THEN 'L'
        WHEN title LIKE 'M%' THEN 'M'
        WHEN title LIKE 'N%' THEN 'N'
        WHEN title LIKE 'O%' THEN 'O'
        WHEN title LIKE 'P%' THEN 'P'
        WHEN title LIKE 'Q%' THEN 'Q'
        WHEN title LIKE 'R%' THEN 'R'
        WHEN title LIKE 'S%' THEN 'S'
        WHEN title LIKE 'T%' THEN 'T'
        WHEN title LIKE 'U%' THEN 'U'
        WHEN title LIKE 'V%' THEN 'V'
        WHEN title LIKE 'W%' THEN 'W'
        WHEN title LIKE 'X%' THEN 'X'
        WHEN title LIKE 'Y%' THEN 'Y'
        WHEN title LIKE 'Z%' THEN 'Z'
    END AS starting_letter,
    AVG(rating) AS average_rating
FROM movies
JOIN ratings ON movies.id = ratings.movie_id
WHERE title LIKE 'A%' OR title LIKE 'B%' OR title LIKE 'C%' OR title LIKE 'D%' OR
    title LIKE 'E%' OR title LIKE 'F%' OR title LIKE 'G%' OR title LIKE 'H%' OR
    title LIKE 'I%' OR title LIKE 'J%' OR title LIKE 'K%' OR title LIKE 'L%' OR
    title LIKE 'M%' OR title LIKE 'N%' OR title LIKE 'O%' OR title LIKE 'P%' OR
    title LIKE 'Q%' OR title LIKE 'R%' OR title LIKE 'S%' OR title LIKE 'T%' OR
    title LIKE 'U%' OR title LIKE 'V%' OR title LIKE 'W%' OR title LIKE 'X%' OR
    title LIKE 'Y%' OR title LIKE 'Z%'
GROUP BY starting_letter
ORDER BY average_rating DESC;
