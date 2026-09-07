-- programs
--   A collection of exercises to be performed during a workout.
--
-- REFERENCES
--   Note programs doesn't have any referecnes because it's a base table.   
--
-- NOTES:
--   I don't really like "programs" for this
--   It would really be better if a program was a collection of what I'm calling programs here.
--   ie. A program has a "leg day" then an "arm day"...
--   For now we're calling "leg day" a program but this should change.


CREATE TABLE programs (
    programs_id SERIAL PRIMARY KEY,
    programs_name varchar (400) NOT NULL,
    programs_description text NOT NULL
);