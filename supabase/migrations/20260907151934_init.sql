SET local check_function_bodies = off;

DROP EVENT TRIGGER "ensure_rls";

DROP FUNCTION "public"."rls_auto_enable"();

CREATE SEQUENCE "public"."exercises_exercises_id_seq" AS integer INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1 NO CYCLE;

CREATE SEQUENCE "public"."exercises_int_kpis_exercises_int_kpis_id_seq" AS integer INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1 NO CYCLE;

CREATE SEQUENCE "public"."int_kpis_int_kpis_id_seq" AS integer INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1 NO CYCLE;

CREATE SEQUENCE "public"."log_int_kpis_log_int_kpis_id_seq" AS integer INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1 NO CYCLE;

CREATE SEQUENCE "public"."log_sets_log_sets_id_seq" AS integer INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1 NO CYCLE;

CREATE SEQUENCE "public"."log_workouts_log_workouts_id_seq" AS integer INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1 NO CYCLE;

CREATE SEQUENCE "public"."program_exercises_int_kpis_program_exercises_id_seq" AS integer INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1 NO CYCLE;

CREATE SEQUENCE "public"."programs_programs_id_seq" AS integer INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1 NO CYCLE;

CREATE TABLE "public"."exercises_int_kpis" (
  "exercises_int_kpis_id" integer NOT NULL DEFAULT nextval('public.exercises_int_kpis_exercises_int_kpis_id_seq'::regclass),
  "exercises_id"          integer,
  "int_kpis_id"           integer,
  CONSTRAINT "exercises_int_kpis_pkey" PRIMARY KEY (exercises_int_kpis_id)
);

CREATE TABLE "public"."exercises" (
  "exercises_id"         integer                NOT NULL DEFAULT nextval('public.exercises_exercises_id_seq'::regclass),
  "exercise_name"        character varying(400) NOT NULL,
  "exercise_description" text                   NOT NULL,
  CONSTRAINT "exercises_pkey" PRIMARY KEY (exercises_id)
);

CREATE TABLE "public"."int_kpis" (
  "int_kpis_id"          integer                NOT NULL DEFAULT nextval('public.int_kpis_int_kpis_id_seq'::regclass),
  "exercise_name"        character varying(400) NOT NULL,
  "exercise_description" text                   NOT NULL,
  CONSTRAINT "int_kpis_pkey" PRIMARY KEY (int_kpis_id)
);

CREATE TABLE "public"."log_int_kpis" (
  "log_int_kpis_id"       integer                     NOT NULL DEFAULT nextval('public.log_int_kpis_log_int_kpis_id_seq'::regclass),
  "int_kpis_id"           integer,
  "log_sets_id"           integer,
  "kpi_recording"         integer                     NOT NULL,
  "log_int_kpis_datetime" timestamp without time zone,
  CONSTRAINT "log_int_kpis_pkey" PRIMARY KEY (log_int_kpis_id)
);

CREATE TABLE "public"."log_sets" (
  "log_sets_id"       integer                     NOT NULL DEFAULT nextval('public.log_sets_log_sets_id_seq'::regclass),
  "exercises_id"      integer,
  "log_workouts_id"   integer,
  "log_sets_datetime" timestamp without time zone,
  CONSTRAINT "log_sets_pkey" PRIMARY KEY (log_sets_id)
);

CREATE TABLE "public"."log_workouts" (
  "log_workouts_id"       integer                     NOT NULL DEFAULT nextval('public.log_workouts_log_workouts_id_seq'::regclass),
  "user_id"               integer,
  "programs_id"           integer,
  "log_workouts_datetime" timestamp without time zone,
  CONSTRAINT "log_workouts_pkey" PRIMARY KEY (log_workouts_id)
);

CREATE TABLE "public"."program_exercises_int_kpis" (
  "program_exercises_id" integer NOT NULL DEFAULT nextval('public.program_exercises_int_kpis_program_exercises_id_seq'::regclass),
  "programs_id"          integer,
  "exercises_id"         integer,
  "int_kpis_id"          integer,
  CONSTRAINT "program_exercises_int_kpis_pkey" PRIMARY KEY (program_exercises_id)
);

CREATE TABLE "public"."programs" (
  "programs_id"          integer                NOT NULL DEFAULT nextval('public.programs_programs_id_seq'::regclass),
  "programs_name"        character varying(400) NOT NULL,
  "programs_description" text                   NOT NULL,
  CONSTRAINT "programs_pkey" PRIMARY KEY (programs_id)
);

ALTER SEQUENCE "public"."exercises_exercises_id_seq" OWNED BY "public"."exercises"."exercises_id";

ALTER SEQUENCE "public"."exercises_int_kpis_exercises_int_kpis_id_seq" OWNED BY "public"."exercises_int_kpis"."exercises_int_kpis_id";

ALTER SEQUENCE "public"."int_kpis_int_kpis_id_seq" OWNED BY "public"."int_kpis"."int_kpis_id";

ALTER SEQUENCE "public"."log_int_kpis_log_int_kpis_id_seq" OWNED BY "public"."log_int_kpis"."log_int_kpis_id";

ALTER SEQUENCE "public"."log_sets_log_sets_id_seq" OWNED BY "public"."log_sets"."log_sets_id";

ALTER SEQUENCE "public"."log_workouts_log_workouts_id_seq" OWNED BY "public"."log_workouts"."log_workouts_id";

ALTER SEQUENCE "public"."program_exercises_int_kpis_program_exercises_id_seq" OWNED BY "public"."program_exercises_int_kpis"."program_exercises_id";

ALTER SEQUENCE "public"."programs_programs_id_seq" OWNED BY "public"."programs"."programs_id";

ALTER TABLE "public"."exercises_int_kpis"
  ADD CONSTRAINT "exercises_int_kpis_exercises_id_fkey" FOREIGN KEY (exercises_id) REFERENCES public.exercises(exercises_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "public"."exercises_int_kpis"
  ADD CONSTRAINT "exercises_int_kpis_int_kpis_id_fkey" FOREIGN KEY (int_kpis_id) REFERENCES public.int_kpis(int_kpis_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "public"."log_int_kpis"
  ADD CONSTRAINT "log_int_kpis_int_kpis_id_fkey" FOREIGN KEY (int_kpis_id) REFERENCES public.int_kpis(int_kpis_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "public"."log_sets"
  ADD CONSTRAINT "log_sets_exercises_id_fkey" FOREIGN KEY (exercises_id) REFERENCES public.exercises(exercises_id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE "public"."log_int_kpis"
  ADD CONSTRAINT "log_int_kpis_log_sets_id_fkey" FOREIGN KEY (log_sets_id) REFERENCES public.log_sets(log_sets_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "public"."log_sets"
  ADD CONSTRAINT "log_sets_log_workouts_id_fkey" FOREIGN KEY (log_workouts_id) REFERENCES public.log_workouts(log_workouts_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "public"."program_exercises_int_kpis"
  ADD CONSTRAINT "program_exercises_int_kpis_exercises_id_fkey" FOREIGN KEY (exercises_id) REFERENCES public.exercises(exercises_id);

ALTER TABLE "public"."program_exercises_int_kpis"
  ADD CONSTRAINT "program_exercises_int_kpis_int_kpis_id_fkey" FOREIGN KEY (int_kpis_id) REFERENCES public.int_kpis(int_kpis_id);

ALTER TABLE "public"."log_workouts"
  ADD CONSTRAINT "log_workouts_programs_id_fkey" FOREIGN KEY (programs_id) REFERENCES public.programs(programs_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "public"."program_exercises_int_kpis"
  ADD CONSTRAINT "program_exercises_int_kpis_programs_id_fkey" FOREIGN KEY (programs_id) REFERENCES public.programs(programs_id);

CREATE INDEX log_int_kpis_datetime_idx ON public.log_int_kpis USING brin (log_int_kpis_datetime);

CREATE INDEX log_sets_datetime_idx ON public.log_sets USING brin (log_sets_datetime);

CREATE INDEX log_workouts_datetime_idx ON public.log_workouts USING brin (log_workouts_datetime);

GRANT SELECT, UPDATE, USAGE ON SEQUENCE "public"."exercises_exercises_id_seq" TO "anon", "authenticated", "postgres", "service_role";

GRANT SELECT, UPDATE, USAGE ON SEQUENCE "public"."exercises_int_kpis_exercises_int_kpis_id_seq" TO "anon", "authenticated", "postgres", "service_role";

GRANT SELECT, UPDATE, USAGE ON SEQUENCE "public"."int_kpis_int_kpis_id_seq" TO "anon", "authenticated", "postgres", "service_role";

GRANT SELECT, UPDATE, USAGE ON SEQUENCE "public"."log_int_kpis_log_int_kpis_id_seq" TO "anon", "authenticated", "postgres", "service_role";

GRANT SELECT, UPDATE, USAGE ON SEQUENCE "public"."log_sets_log_sets_id_seq" TO "anon", "authenticated", "postgres", "service_role";

GRANT SELECT, UPDATE, USAGE ON SEQUENCE "public"."log_workouts_log_workouts_id_seq" TO "anon", "authenticated", "postgres", "service_role";

GRANT SELECT, UPDATE, USAGE ON SEQUENCE "public"."program_exercises_int_kpis_program_exercises_id_seq" TO "anon", "authenticated", "postgres", "service_role";

GRANT SELECT, UPDATE, USAGE ON SEQUENCE "public"."programs_programs_id_seq" TO "anon", "authenticated", "postgres", "service_role";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."exercises" TO "anon", "authenticated", "postgres", "service_role";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."exercises_int_kpis" TO "anon", "authenticated", "postgres", "service_role";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."int_kpis" TO "anon", "authenticated", "postgres", "service_role";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."log_int_kpis" TO "anon", "authenticated", "postgres", "service_role";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."log_sets" TO "anon", "authenticated", "postgres", "service_role";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."log_workouts" TO "anon", "authenticated", "postgres", "service_role";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."program_exercises_int_kpis" TO "anon", "authenticated", "postgres", "service_role";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."programs" TO "anon", "authenticated", "postgres", "service_role";
