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
