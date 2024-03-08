-- select companies
SELECT * FROM companies;

-- update company 'Photobug' by changing its country to 'India'
UPDATE companies SET country = 'India' WHERE name = 'Photobug';

-- select company = 'Photobug' to check if the update was successful
SELECT * FROM companies WHERE name = 'Photobug';

