-- let's create our `companies` table
CREATE TABLE IF NOT EXISTS companies(
    -- PRIMARY KEY means that column `id` will uniquely identify a company
    id BIGSERIAL PRIMARY KEY,  -- BIGSERIAL is an auto-incremented integer
    -- NOT NULL means that when inserting data in this table, name should
    -- not be null
    name VARCHAR(50) NOT NULL, -- VARCHAR(50) means that it is a text up to 50 characters
    country VARCHAR(100)
);

-- let's create our `employees` table
CREATE TABLE IF NOT EXISTS employees(
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    date_birth DATE NOT NULL,

    -- now, specify our foreign key to establish
    -- a relationship with `companies` table
    company_id BIGINT NOT NULL,
    -- means that company_id in `employees` table references
    -- id column in `companies` table
    FOREIGN KEY (company_id) REFERENCES companies(id)
);

