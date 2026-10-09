-- workouts
--   A collection of exercises to be performed together during an exercise session.
--   For example "leg day" is a workout. This is how splits are defined.
--
-- REFERENCES
--  programs 1--* workouts  
--
-- NOTES:
--   For now we're calling "leg day" a workout but this should change.\
--   
-- TODO:
--   There needs to be a UI way to copy workouts between programs/duplicate workouts...


CREATE TABLE workouts (
    workouts_id SERIAL PRIMARY KEY,
    programs_id INT REFERENCES programs(programs_id), 
    workouts_name varchar (400) NOT NULL,
    workouts_description text NOT NULL
);

ALTER TABLE public.workouts ENABLE ROW LEVEL SECURITY;

REVOKE all ON TABLE public.workouts from anon, authenticated;

GRANT SELECT ON TABLE public.workouts TO authenticated;

-- TODO: these permissions aren't right. 
--       A user should be able to define their own workout.