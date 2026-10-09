-- int_kpis
--   int kpis are classes of measurement.
--   For example 'miles' or 'reps' would be int kpis.
--
-- REFERENCES
--   int_kpis 1--* log_int_kpis to record measurements of kpis for a set
--   int_kpis 1--* exercise_kpis to define the default int kpi measurements an exercise should record. For example "shoulder press" should record "weight" and "reps".

CREATE TABLE int_kpis (
    int_kpis_id SERIAL PRIMARY KEY,
    kpi_name varchar (400) NOT NULL,
    kpi_description text NOT NULL
);

ALTER TABLE public.int_kpis ENABLE ROW LEVEL SECURITY;

REVOKE all ON TABLE public.int_kpis from anon, authenticated;

GRANT SELECT ON TABLE public.int_kpis TO authenticated;