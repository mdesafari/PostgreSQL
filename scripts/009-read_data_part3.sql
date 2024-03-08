-- select employees and their date of birth. Limit to 10
SELECT first_name, date_birth FROM employees;

-- for each employee return his/her current age
-- use AGE clause: AGE(from_date, date_birth) = date_birth - from_date
SELECT
    first_name,
    -- let's extract only the Year
    -- for that, use the EXTRACT clause
    EXTRACT(YEAR FROM AGE(NOW(), date_birth))  -- NOW() gives you the current date (i.e., 2024-03-07)
FROM employees;

-- for each employee return his/her date of birth + 5 Years
-- use the INTERVAL clause
-- You can see that the result of `birth_plus_five`
-- is a TIMESTAMP (YYYY-MM-DD HH:MM:SS) instead of
-- DATE (YYYY-MM-DD)
-- let's cast TIMESTAMP to DATE
SELECT
    first_name,
    date_birth,
    (date_birth + INTERVAL '5 YEAR')::DATE AS birth_plus_five  -- '5 YEARS' also work
FROM employees;


