-- select all records in `companies` table
SELECT * -- all columns
FROM companies;  -- all records

-- select the first 5 records in `companies` table
-- 1. METHOD 1: use of FETCH FIRST clause
SELECT * FROM companies FETCH FIRST 5 ROW ONLY;

-- METHOD 1 is a little bite complicated
-- 2. METHOD 2: use of LIMIT
SELECT * FROM companies LIMIT 5;

-- select all records in `companies`, order by country name in DESC order
-- and return the first 5 rows
SELECT * FROM companies
ORDER BY name DESC
LIMIT 5;

-- skip the first 4 records and from the 5th record, select the next 5 records
-- for this, we will use the OFFSET clause
SELECT * FROM companies OFFSET 4 LIMIT 5;

-- select the first 5 countries in `companies` table
SELECT country  -- select only `country` column
FROM companies LIMIT 5;

-- select all countries in `companies` table
-- then return only one instance of each country
-- and limit the returned records to 5
-- use distinct clause for that
SELECT DISTINCT country FROM companies;

-- select distinct companies in `companies` table
-- and limit the returned records to 5
SELECT DISTINCT * FROM companies LIMIT 5;

-- select companies located in Canada
-- use WHERE clause to select a subset of records
-- matching a criteria
-- 1. METHOD 1: use of equality
SELECT * FROM companies WHERE country = 'Canada';

-- 2. METHOD 2: use of LIKE
-- LIKE clause allows to match a pattern
SELECT * FROM companies WHERE country LIKE 'Canada';  -- the pattern here is `Canada`

-- now let's re-use equality but now type 'canada' instead of 'Canada'
SELECT * FROM companies WHERE country = 'canada';

-- we get no data because it is case-sensitive
-- we can use ILIKE clause to circumvent this
SELECT * FROM companies WHERE country ILIKE 'canada';  -- case-insensitive

-- select companies located in Canada with name starting from `Ro`
-- we will use 'LIKE' because it is about a pattern
SELECT * FROM companies
WHERE country = 'Canada'
AND name LIKE 'Ro%'; -- starts by Ro followed by any sequence of characters;

-- select companies located in Canada with name starting from `Ro` or companies from 'Nigeria'
SELECT * FROM companies
WHERE (country = 'Canada' AND name LIKE 'Ro%') OR (country = 'Nigeria');

-- select companies located in Nigeria, Canada, France, China
-- for that we will use IN clause
SELECT * FROM companies WHERE country IN ('Nigeria', 'Canada', 'Ftance', 'China');

-- count number of companies by country and order by country name in ASC order
-- step 1: select all companies
-- step 2: group companies by country name
-- step 3: for each group (country name), count the number of companies
-- step 4: return country name and number of companies associated
-- now let's try with alias
-- let's give an alias to country column
-- step 5: order by country_name in Ascending order
SELECT country AS country_name, COUNT(*) AS num_companies
FROM companies
GROUP BY country
ORDER BY country_name ASC;

-- count number of companies by country and order by number of companies in DESC order
-- same as previous
SELECT country AS country_name, COUNT(*) AS num_companies
FROM companies
GROUP BY country
ORDER BY country_name DESC;

-- select the first company found in `companies` table for each
-- of the following countries: Nigeria, Canada, France, China
-- order by country name in DESC order
-- step 1: select all companies
-- step 3: group by country name
-- step 3: retrieve only the following groups: Nigeria, Canada, France, China
-- step 4: retrieve the minimum index for each group
-- step 5: select companies where id = min_id
-- step 6: order by country name in DESC order

SELECT * FROM companies
WHERE id IN (
    -- this request, will send back the min id
    -- let's execute it before continuing
    SELECT MIN(id) FROM companies
    GROUP BY country
    -- after Group by, you can't use WHERE, so HAVING is analogous to WHERE after Group by
    HAVING country IN ('Nigeria', 'Canada', 'France', 'China')
)
ORDER BY country DESC;

-- select countries with more than 70 `companies` and order by number of companies in DESC order
-- step 1: select all companies
-- step 3: group by country name
-- step 3: count number of companies by country
-- step 4: retrieve countries with number of companies > 50
-- step 5: order by number of companies in DESC order

SELECT country, COUNT(*) AS num_companies FROM companies
GROUP BY country
-- you can't use `num_companies` because the output is not yet generated
HAVING COUNT(*) > 70
-- Here the output is generated, we can use num_companies if necessary
ORDER BY num_companies DESC;





