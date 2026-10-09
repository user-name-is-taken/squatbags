-- log_int_kpis
--   logs int kpis for a set.
--   For example the "reps" int_kpi would be recorded against a set. Then in a separate row the "weight" int_kpi would be recorded against a set.
--
--   log_int_kpis is append always meaning:
--    to edit a log_set: write a log_set with the same int_kpis_id and log_sets_id and different kpi_recording.
--    to delete a log_set: write a log_set with the same int_kpis_id and log_sets_id and a NULL kpi_recording.
--    when selecting only pull the latest (int_kpis_id, log_sets_id) and remove records with NULL kpi_recording.

--
-- REFERENCES
--  log_int_kpis *--1 sets defines log's set.
--  log_int_kpis *--1 int_kpis defines the log's int_kpi 

CREATE TABLE log_int_kpis (
    log_int_kpis_id SERIAL PRIMARY KEY,
    int_kpis_id INT REFERENCES int_kpis(int_kpis_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    log_sets_id INT REFERENCES log_sets(log_sets_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    kpi_recording INT, -- This is the actual record of what they did
    log_int_kpis_datetime timestamp without time zone
);

CREATE INDEX IF NOT EXISTS 
    log_int_kpis_datetime_idx ON log_int_kpis
    USING BRIN (log_int_kpis_datetime);

