-- select companies
SELECT * FROM companies ORDER BY id ASC;

-- insert a new company with id = 1
-- There will be a conflict on id because id should be unique (primary key)
-- let's try
-- INSERT INTO companies(id, name, country)
-- VALUES (1, 'Naruto inc.', 'Japan');

-- in that case, we have two options when there is a conflict
-- option 1: do nothing if there is a conflict when inserting data
-- let's try option 1
INSERT INTO companies(id, name, country)
VALUES (1, 'Naruto inc.', 'Japan')
ON CONFLICT (id)
DO NOTHING;  -- no error

-- option 2: update the existing data if there is a conflict when inserting data
-- let's try this second option
INSERT INTO companies(id, name, country)
VALUES (1, 'Naruto inc.', 'Japan')
ON CONFLICT (id)
DO UPDATE SET
    name = EXCLUDED.name, --- means that the current name's value will be replaced by the new one
    country = EXCLUDED.country;

-- select to check if option 2 was successful
SELECT * FROM companies WHERE id = 1;
