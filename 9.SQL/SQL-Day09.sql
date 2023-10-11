--DQL-->Data Query Language
--DML -->Data Manipulation Language : Sadece verileri CRUD operations ile kullandik.
--DDL --> Data Definition Language

--ALTER TABLE :This command is used to add, delete or update field of an existing table.
--ALTER TABLE command is used to add, delete or update the data type of a field in an existing table

--1)How to add a column to an existing table
ALTER TABLE workers
ADD worker_address VARCHAR(80);

--2) How to add a field with default value
ALTER TABLE my_companies
ADD employee_address TEXT DEFAULT 'Miami, FL, USA';

SELECT * FROM my_companies;

--3) how to add multiple Fields into a table
ALTER TABLE my_companies
ADD num_employees NUMERIC DEFAULT 0,
ADD name_of_ceo TEXT;

--4) how to drop Fields from a table
ALTER TABLE my_companies
DROP COLUMN name_of_ceo;

ALTER TABLE my_companies
DROP COLUMN employee_adress;

--5) How to rename a field in a existing table
ALTER TABLE your_companies
RENAME employee_address TO worker_address;

--6) How to rename a existing table
ALTER TABLE my_companies
RENAME TO your_companies;

SELECT * FROM workers;

--7) how to modify(Add constraint, change data type or change size) of a field
ALTER TABLE your_companies
ALTER COLUMN company_id SET NOT NULL; 

--8) how to add unique constraint
ALTER TABLE employees
--ALTER COLUMN employee_id SET UNIQUE;  bu sekilde olmuyormus / bu racon sadece unique e özel
ADD CONSTRAINT employee_id_unique UNIQUE (employee_id);

--wokers table inda worker_address icin UNIQUE constraint ekleyiniz
ALTER TABLE workers
ADD UNIQUE (title);


--worker_assress field inin data type ni varchar dan char a degistirelim (50)
ALTER TABLE workers
ALTER COLUMN worker_address TYPE CHAR(50);




CREATE OR REPLACE FUNCTION addF(x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS 
$$
BEGIN

RETURN x+y;

END
$$

SELECT addF(3.6, 4.4) AS toplam;



