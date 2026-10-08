-- log_workouts
--   Formally a workout is defined as a collection of sets performed by a user
--   Informally "going to the gym" would be a workout
--
-- REFERENCES
--   log_workouts *--1 user the user who performed the workout
--   log_workouts *--? workouts the workout of the workout. This is optional so a user can "wing it" durring their workout.
--
-- NOTES
--   Users shouldn't be locked into a workout by a workout. Users should be allowed to add exercises to their workout as they go through log_sets etc. Programs here is just to pull in a set of default exercises.


CREATE TABLE log_workouts (
    log_workouts_id SERIAL PRIMARY KEY,
    user_id uuid,
    workouts_id INT REFERENCES workouts(workouts_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    log_workouts_datetime timestamp without time zone
);


CREATE INDEX IF NOT EXISTS 
    log_workouts_datetime_idx ON log_workouts
    USING BRIN (log_workouts_datetime);

CREATE INDEX IF NOT EXISTS
    log_workouts_user_id_idx ON log_workouts
    USING BTREE (user_id);

ALTER TABLE public.log_workouts ENABLE ROW LEVEL SECURITY;

REVOKE all ON TABLE public.log_workouts from anon, authenticated;

GRANT SELECT, INSERT ON TABLE public.log_workouts TO authenticated;

-- Allow user to select their workouts
CREATE POLICY "user_workouts_rls select"
ON log_workouts 
FOR SELECT
TO authenticated
USING ((SELECT auth.uid()) = user_id);

-- Allow user to INSERT their workouts
create policy "user_workouts_rls insert"
on log_workouts
for insert
to authenticated
with check ( (select auth.uid()) = user_id );
