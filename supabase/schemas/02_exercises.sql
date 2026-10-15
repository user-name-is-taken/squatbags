-- exercises
--   exercises that a user could perform
--   For example "shoulder press" or "running"
--
-- REFERENCES:
--   This is a base table and has no references

CREATE TABLE exercises (
  exercises_id SERIAL PRIMARY KEY,
  id                VARCHAR(10) ,
  name              VARCHAR(255) NOT NULL,
  category          VARCHAR(100),
  body_part         VARCHAR(100),
  equipment         VARCHAR(100),
  instructions_en   TEXT,
  instructions_es   TEXT,
  instructions_it   TEXT,
  instructions_tr   TEXT,
  instructions_ru   TEXT,
  instructions_zh   TEXT,
  instructions_hi   TEXT,
  instructions_pl   TEXT,
  instructions_ko   TEXT,
  muscle_group      VARCHAR(100),
  secondary_muscles JSONB,
  target            VARCHAR(100),
  image             VARCHAR(500),
  gif_url           VARCHAR(500),
  created_at        TIMESTAMPTZ
);

CREATE INDEX IF NOT EXISTS
    exercises_id_idx ON exercises
    USING BTREE (id);

ALTER TABLE public.exercises ENABLE ROW LEVEL SECURITY;

REVOKE all ON TABLE public.exercises from anon, authenticated;

GRANT SELECT ON TABLE public.exercises TO authenticated;
