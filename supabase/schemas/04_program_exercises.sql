-- program_exercises
--   The exercises that the program contains.
--   For example "leg day" might have "squats", "calf raises", "hamstring curls"...
--
-- REFERENCES:
--   program_exercises *--1 exercises the exercises in the program
--   program_exercises *--1 programs the programs that we're defining exercises for
--   program_exercises *--1 int_kpis the expected int kpis for the program exercise.
--
-- NOTE:
--   This is just the expected exercises and int_kpis for a program.
--   A user could record anything they want in log_int_kpis


CREATE TABLE program_exercises_int_kpis (
    program_exercises_id SERIAL PRIMARY KEY,
    programs_id INT REFERENCES programs(programs_id),
    exercises_id INT REFERENCES exercises(exercises_id),
    int_kpis_id INT REFERENCES int_kpis(int_kpis_id)
);
