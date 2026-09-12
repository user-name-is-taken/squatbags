# Local development quickstart

```
docker compose up
```

- supabase lite: https://www.npmjs.com/package/@supabase/lite?activeTab=readme
  - runs in browser
  - pglite/sqlite?

- nodejs docker docs: https://docs.docker.com/guides/nodejs/
- TODO: start a vite frontend. Recommended by lite

# quickstart

supabase logging in (note this uses our project ID):

```
npx supabase login

npx supabase link \
  --project-ref uivgsszcikqrsrjopsdn

export SUPABASE_DB_PASSWORD='your-actual-database-password'
```

Pull the database

```
npx supabase db pull
```

- CODING STANDARD https://github.com/BurntSushi/erd
- https://supabase.com/docs/guides/local-development/declarative-database-schemas
- https://supabase.com/docs/guides/local-development/declarative-database-schemas#schema-migrations
- https://www.geeksforgeeks.org/postgresql/postgresql-naming-conventions/

```
npx supabase db start

FILENAME="TODO enter a file name here"
npx supabase db schema declarative  sync --s \
    ./schemas/00_exercises.sql,./schemas/01_programs.sql,... \
  -f "./migrations/$(date -Iseconds)-$FILENAME.sql" --strict-coverage
```

## Dev environment

- The dev environment is managed by npm.
