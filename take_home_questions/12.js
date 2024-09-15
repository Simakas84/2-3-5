const sqlite3 = require('sqlite3').verbose();

const [title, year] = process.argv.slice(2);

if (!title || !year) {
  console.error('Please provide both a movie title and year.');
  process.exit(1);
}

const db = new sqlite3.Database('./movies.db', (err) => {
  if (err) {
    console.error('Error connecting to the database:', err.message);
  }
});


const addMovie = () => {
  db.serialize(() => {
    db.run('BEGIN TRANSACTION');

    db.get(
      'SELECT id FROM movies WHERE title = ? AND year = ?',
      [title, year],
      (err, row) => {
        if (err) {
          console.error('Error checking for existing movie:', err.message);
          db.run('ROLLBACK');
          db.close();
          return;
        }

        if (row) {
          console.error('A movie with the same title and year already exists.');
          db.run('ROLLBACK');
          db.close();
        } else {
          db.run(
            'INSERT INTO movies (title, year) VALUES (?, ?)',
            [title, year],
            function (err) {
              if (err) {
                console.error('Error inserting movie:', err.message);
                db.run('ROLLBACK');
                db.close();
                return;
              }

              const movieId = this.lastID;

              db.run(
                'INSERT INTO ratings (movie_id, rating, votes) VALUES (?, NULL, 0)',
                [movieId],
                (err) => {
                  if (err) {
                    console.error('Error inserting rating:', err.message);
                    db.run('ROLLBACK');
                    db.close();
                    return;
                  }

                  db.run('COMMIT', (err) => {
                    if (err) {
                      console.error('Error committing transaction:', err.message);
                      db.run('ROLLBACK');
                      db.close();
                      return;
                    }

                    console.log(`New movie added with ID: ${movieId}`);
                    db.close();
                  });
                }
              );
            }
          );
        }
      }
    );
  });
};

addMovie();
