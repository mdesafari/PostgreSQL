-- to export the output of a SELECT clause, use COPY clause
-- let's export the first 5 companies to a csv file
COPY (SELECT * FROM companies LIMIT 5) TO 'C:/Users/Learner/Desktop/PostgreTuto/data/comp_part.csv'
DELIMITER ',' CSV HEADER;

-- for this to work, you should allow the right permissions to acces the above path
-- here, we will export using CMD
-- the script is the same as above except that it has to be on 1 line and start by \
\COPY (SELECT * FROM companies LIMIT 5) TO 'C:/Users/Learner/Desktop/PostgreTuto/data/comp_part.csv' DELIMITER ',' CSV HEADER;


-- let's go to CMD
