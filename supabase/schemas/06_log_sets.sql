-- log_sets
--   Sets are exercises performed by a user during a workout.
--   log_sets records the exercises but log_int_kpis records the actual measurements for the exercise.
--
--
-- REFERENCES:
--   log_sets 1--* exercise to record which exercise was performed during the set
--   log_sets *--1 log_workouts to record which workout this set was performed during

CREATE TABLE log_sets (
    log_sets_id SERIAL PRIMARY KEY,
    exercises_id INT REFERENCES exercises(exercises_id) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    log_workouts_id INT REFERENCES log_workouts(log_workouts_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    log_sets_datetime timestamp without time zone
);


CREATE INDEX IF NOT EXISTS 
    log_sets_datetime_idx ON log_sets
    USING BRIN (log_sets_datetime);

ALTER TABLE public.log_sets ENABLE ROW LEVEL SECURITY;

-- HELPFUL RLS LINK:
-- https://dev.to/asheeshh/mastering-supabase-rls-row-level-security-as-a-beginner-5175
CREATE POLICY "User create sets"
ON 
