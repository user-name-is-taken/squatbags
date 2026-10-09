-- exercises
--   exercises that a user could perform
--   For example "shoulder press" or "running"
--
-- REFERENCES:
--   This is a base table and has no references

CREATE TABLE exercises (
    exercises_id SERIAL PRIMARY KEY,
    exercise_name varchar (400) NOT NULL,
    exercise_description text NOT NULL
);
