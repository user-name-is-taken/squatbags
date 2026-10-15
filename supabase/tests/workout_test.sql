BEGIN;
SELECT plan(0);

-- created with: `npx supabase test new --template pgtap workout`
-- Examples: https://pgtap.org/documentation.html

SELECT * FROM finish();
ROLLBACK;
