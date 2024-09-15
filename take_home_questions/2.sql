--List the names of the 10 oldest people and how many years have passed since they were born in the current year. Do not include people who do not have a birth year.

SELECT name, (2024 - birth) AS age
FROM people
WHERE birth IS NOT NULL AND birth >= 1800
ORDER BY age DESC
LIMIT 10;



