require('dotenv').config({ path: './favorite_director.env' });

console.log('Current Directory:', __dirname);
console.log('Environment Variables:', process.env);

const sqlite3 = require('sqlite3').verbose();

const favoriteDirector = process.env.FAVORITE_DIRECTOR;

if (!favoriteDirector) {
  console.error('FAVORITE_DIRECTOR is not defined in the favorite_director.env file');
  process.exit(1);
}

const db = new sqlite3.Database('C:/Users/Admin/TuringCollege/SQL problem set/database/movies.db', (err) => {
  if (err) {
    console.error('Error opening database:', err.message);
  }
});

const query = `
  SELECT movies.title, ratings.rating
  FROM movies
  JOIN directors ON movies.id = directors.movie_id
  JOIN people ON directors.person_id = people.id
  JOIN ratings ON movies.id = ratings.movie_id
  WHERE people.name = ?
  ORDER BY ratings.rating DESC;
`;


db.all(query, [favoriteDirector], (err, rows) => {
  if (err) {
    console.error('Error executing query:', err.message);
    db.close();
    return;
  }

  if (rows.length === 0) {
    console.log(`No movies found for director: ${favoriteDirector}`);
  } else {
    console.log(`Movies directed by ${favoriteDirector}:`);
    rows.forEach((row) => {
      console.log(`${row.title} - Rating: ${row.rating}`);
    });
  }

  db.close();
});
