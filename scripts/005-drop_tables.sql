-- let's drop/remove tables
-- because employees depends on companies, we should
-- first delete employees before deleting companies
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS companies;
