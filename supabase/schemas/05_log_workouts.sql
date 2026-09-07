-- log_workouts
--   Formally a workout is defined as a collection of sets performed by a user
--   Informally "going to the gym" would be a workout
--
-- REFERENCES
--   log_workouts *--1 user the user who performed the workout
--   log_workouts *--? programs the program of the workout. This is optional so a user can "wing it" durring their workout.
--
-- NOTES
--   Users shouldn't be locked into a program by a workout. Users should be allowed to add exercises to their workout as they go through log_sets etc. Programs here is just to pull in a set of default exercises.


CREATE TABLE log_workouts (
    log_workouts_id SERIAL PRIMARY KEY,
    user_id INT,
    programs_id INT REFERENCES programs(programs_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    log_workouts_datetime timestamp without time zone

-- TODO: BRIN index on datetime
);


CREATE INDEX IF NOT EXISTS 
    log_workouts_datetime_idx ON log_workouts
    USING BRIN (log_workouts_datetime);
