-- for each employee, get info on his/her companies
-- step 1: select all employees
-- step 2: for each employee, link its company_id to the corresponding id in `companies` table
-- this will give a new table containing all employee info with their company info
-- for that, use INNER JOIN

-- INNER JOIN (or JOIN) return a new table containing all employee info with their company info 
SELECT *
FROM employees AS e  -- Alias for `employees` table
INNER JOIN companies AS c  -- Alias for `companies` table
ON e.company_id = c.id;  -- if e.company_id = c.id, the associated record will be retrieved

-- do the same as previous but return only employee's first_name, company name, and company country
-- limit results to 10
SELECT e.first_name, c.name, c.country
FROM employees e  -- no need to use AS but using it is more clear
JOIN companies c  -- JOIN = INNER JOIN
on E.company_id = c.id
LIMIT 10;

-- select companies with more than 2 employees
-- METHOD 1
-- step 1: select all employees
-- step 2: group by company_id
-- step 3: for each company_id, count the number of employees
-- step 4: retrieve company_id with more than 2 employees
-- step 5: select all `companies` where company_id matches
-- Step 6: limit to 10 records

SELECT * FROM companies
WHERE id IN (
    SELECT company_id FROM employees
    GROUP BY company_id
    -- with GROUP BY you need to have an aggregation method such as COUNT, MIN, MAX, AVG, ...
    -- either in after SELECT or after HAVING or both
    HAVING COUNT(*) > 2  -- steps 3 and 4
)
LIMIT 10;

-- METHOD 2
-- step 1: select all employees
-- step 2: join with `companies` table
-- step 3: group by company_id
-- step 4: for each company_id, count the number of employees
-- step 5: retrieve company_id with more than 2 employees
-- step 6: order by company name in ASC order
-- Step 7: limit to 10 records
-- colums to return: company_id, name, country, number of employees

-- When using GROUP BY, every column you return (in SELECT clause)
-- should be specified in the GROUP BY clause
SELECT e.company_id, c.name, c.country, COUNT(*) AS num_employees
FROM employees e
JOIN companies c
ON e.company_id = c.id
GROUP BY e.company_id, c.name, c.country
HAVING COUNT(*) > 2  -- step 4 and 5
ORDER BY c.name ASC
LIMIT 10;


-- select all employees, return only first_name and also
-- a new column named `status` = 'Updated' if first_name starts by 'Ma' and
-- 'Unknown' if not
SELECT
    first_name,
    CASE
        WHEN first_name LIKE 'Ma%' THEN 'Updated'
        ELSE 'Unknown'
    END AS status -- the new column is named: status
FROM employees;


-- create a new table named testtable that store the first name and status of all employee
-- `status` = 'Updated' if first_name starts by 'Ma' and NULL if not
CREATE TABLE IF NOT EXISTS testtable AS
SELECT
    first_name,
    CASE
        WHEN first_name LIKE 'Ma%' THEN 'Updated'
        ELSE NULL  -- null instead of 'Unknown' as previous
    END AS status -- the new column is named: status
FROM employees;

-- in our table `testtable` if status is null return 'Unknown' for `status`
-- for that, we will use COALESCE clause
-- COALESCE(column, value1, value2, ...) = column value if column value is not null
-- else = value1 if not null else = value2 if not null, ...
SELECT first_name, COALESCE(status, 'Unknown') FROM testtable;





