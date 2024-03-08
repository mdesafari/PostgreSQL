-- to insert data from a csv file, we will use the COPY clause
-- As `employees` depends on `companies`, we must insert data
-- into `companies` first
COPY companies(id, name, country) FROM 'C:/Users/Learner/Desktop/PostgreTuto/data/companies.csv'
DELIMITER ',' CSV HEADER;

-- 2. in `employees` table
COPY employees(id, first_name, last_name, email, gender, date_birth, company_id)
FROM 'C:/Users/Learner/Desktop/PostgreTuto/data/employees.csv'
DELIMITER ',' CSV HEADER;

-- VERY IMPORTANT: PROBLEM / ISSUE
-- for this to work, you need to allow some permissions/authorizations
-- to 'postgres' (you) user to access the folder `data`
-- in this tutorial we will not going to see that and we will insert data using the CMD
-- because with CMD we do not need to handle these permissions issues
-- the command to execute in CMD is exactly as above with one exception: start by \ and
-- the script should be on only 1 line
\COPY companies(id, name, country) FROM 'C:/Users/Learner/Desktop/PostgreTuto/data/companies.csv' DELIMITER ',' CSV HEADER;
\COPY employees(id, first_name, last_name, email, gender, date_birth, company_id) FROM 'C:/Users/Learner/Desktop/PostgreTuto/data/employees.csv' DELIMITER ',' CSV HEADER;

-- let's go to CMD
