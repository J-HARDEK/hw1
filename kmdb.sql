-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!
-- - Note rubric explanation for appropriate use of external resources.

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint #1: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
--   Hint #2: Do NOT name one of your models/tables “cast” or “casts”; this 
--   is a reserved word in sqlite and will break your database! Instead, 
--   think of a better word to describe this concept; i.e. the relationship 
--   between an actor and the movie in which they play a part.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.
-- 5. Using external resources for help with the assignment (including colleagues, AI, internet search, etc):
-- - Engineers look to colleagues and the internet all the time when building software.
--   You are welcome to do the same. However, the solution you submit must utilize
--   the skills and strategies covered in class. Alternate solutions which do not demonstrate
--   an understanding of the approaches used in class will receive significant deductions.
--   Any concern should be raised with faculty prior to assignment due date.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS studios;
-- Create new tables, according to your domain model
-- TODO!
--          Combined below so I could see all the work at once.
-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!
--_____STUDIOS TABLE____
CREATE TABLE studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  studio_name TEXT,
  movies_id INTEGER
);
INSERT INTO studios (
    studio_name,
    movies_id
) VALUES (
    "Warner Bros", 1),
    ("Warner Bros", 2),
    ("Warner Bros", 3),
--Test for if other studio in list
    ("Kellogg Studio",4
);
--______MOVIES TABLE_______
CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year_released INTEGER,
  mpaa_rating TEXT,
  studios_id INTEGER
  team_id INTEGER
);
INSERT INTO movies (
    title,
    year_released,
    mpaa_rating,
    studios_id
) VALUES (
    "Batman Begins", 2005, "PG-13", 1), 
    ("The Dark Knight", 2008, "PG-13", 1), 
    ("The Dark Knight Rises", 2013, "PG-13", 1
);
--______'CAST' aka TEAM TABLE_______
CREATE TABLE team (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_name TEXT,
  actor_real_name TEXT,
  movies_id INTEGER
);
INSERT INTO team (
    character_name,
    actor_real_name,
    movies_id
) 
VALUES (
--Batman Begins
    "Bruce Wayne", "Christian Bale",1),
    ("Alfred", "Michael Caine",1),
    ("Ra's Al Ghul", "Liam Neeson",1),
    ("Rachel Dawes", "Katie Holmes",1),
    ("Commissioner Gordon", "Gary Oldman",1),
--The Dark Knight
    ("Bruce Wayne", "Christian Bale",2),
    ("Joker", "Heath Ledger",2),
    ("Harvey Dent", "Aaron Eckhart",2),
    ("Alfred", "Michael Caine",2),
    ("Rachel Dawes", "Maggie Gyllenhaal",2),
    ("Commissioner Gordon", "Gary Oldman",2),
--The Dark Knight Rises
    ("Bruce Wayne", "Christian Bale",3),
    ("Commissioner Gordon", "Gary Oldman",3),
    ("Bane", "Tom Hardy",3),
    ("John Blake", "Joseph Gordon-Levitt",3),
    ("Selina Kyle", "Anne Hathaway",3),
    ("Alfred", "Michael Caine",3),
    ("Ra's Al Ghul", "Liam Neeson",3); 

-- The SQL statement for the movies output
--TODO!
.print "Movies"
.print "========"
SELECT movies.title, movies.year_released, movies.mpaa_rating, studios.studio_name
FROM movies
INNER JOIN studios ON movies.id = studios.movies_id
WHERE studio_name = "Warner Bros";
.print ""

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
-- The SQL statement for the cast output
-- TODO!
SELECT movies.title, team.actor_real_name, team.character_name
FROM movies
INNER JOIN team ON movies.id = team.movies_id
WHERE title = "Batman Begins"
LIMIT 5;
SELECT movies.title, team.actor_real_name, team.character_name
FROM movies
INNER JOIN team ON movies.id = team.movies_id
WHERE title = "The Dark Knight"
LIMIT 5;
SELECT movies.title, team.actor_real_name, team.character_name
FROM movies
INNER JOIN team ON movies.id = team.movies_id
WHERE title = "The Dark Knight Rises"
LIMIT 5;
-- I realize for the above, I could have also just put only 5 characters and cast in each data set to make it
--look more like the assignment, but wanted to try to challenge myself to do top 5 from each. I was unable
--to write that in a single SELECT statement however.