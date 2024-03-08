-- let's delete all data contained in `companies` table
DELETE FROM companies;

-- select all data remaning to check if deletion was successful
-- we should get 'no data'
SELECT * FROM companies;
