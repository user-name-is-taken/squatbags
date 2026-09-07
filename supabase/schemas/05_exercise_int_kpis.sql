-- exercise_int_kpis
--   The default int kpis that should be recorded when performing an exercise.
--   For example "shoulder press" should record "reps" and "weight"
--
-- REFERENCES
--   exercise_int_kpis *--1 exercise the exercises that we're defining kpis for 
--   exercise_int_kpis *--1 int_kpis the default kpis that the exercises generally have


CREATE TABLE exercises_int_kpis (
    exercises_int_kpis_id SERIAL PRIMARY KEY,
    exercise_id INT REFERENCES exercises(exercise_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    int_kpis_id INT REFERENCES int_kpis(int_kpis_id) -- default int kpis
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);