-- workout_exercises
--   The exercises that the workout contains.
--   For example "leg day" might have "squats", "calf raises", "hamstring curls"...
--
-- REFERENCES:
--   workout_exercises *--1 exercises the exercises in the workout
--   workout_exercises *--1 workouts the workouts that we're defining exercises for
--   workout_exercises *--1 int_kpis the expected int kpis for the workout exercise.
--
-- NOTE:
--   This is just the expected exercises and int_kpis for a workout.
--   A user could record anything they want in log_int_kpis

-- TODO: workout 1--* exercise 1--* int_kpi so that a workout can define custom kpis for a workout
CREATE TABLE workout_exercises_int_kpis (
    workout_exercises_id SERIAL PRIMARY KEY,
    workouts_id INT REFERENCES workouts(workouts_id),
    exercises_id INT REFERENCES exercises(exercises_id),
    int_kpis_id INT REFERENCES int_kpis(int_kpis_id)
);
