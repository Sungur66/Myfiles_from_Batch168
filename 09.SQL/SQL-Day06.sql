CREATE TABLE employees 
(  
  id CHAR(9), 
  name VARCHAR(50), 
  state VARCHAR(50), 
  salary SMALLINT,
  company VARCHAR(20)
);

INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM employees;

CREATE TABLE companies 
(  
  company_id CHAR(9), 
  company VARCHAR(20),
  number_of_employees SMALLINT
);

INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);

SELECT * FROM companies;

--Herbir company için company, number_of_employees ve ortalama salary değerlerini bulun.

SELECT company, number_of_employees, 
(SELECT ROUND(AVG(salary),2) AS ortalama_maas FROM employees WHERE employees.company=companies.company) 
FROM companies;  -- WHERE employees.company=companies.company dedigimizde her sirket icin ortalama hesaplar

--Herbir company için company_id, company,  en yüksek ve en düşük salary değerlerini bulun. 

SELECT company_id, company, 
(SELECT MIN(salary) AS min_maas FROM employees WHERE employees.company=companies.company) as min_maas,
(SELECT MAX(salary) AS min_maas FROM employees WHERE employees.company=companies.company) as min_maas
FROM companies;

-- WILDCARDS in SQL(SQL de Joker KArakterler)
--LIKE Condition: Wildcard ile kullanilir

--1) %: percetage wildcard: sifir yada birden fazla karakterin olup olmadigini sorgular
-- 'E' ile baslayan employee 'name' degerini cagirin
SELECT name FROM employees
WHERE name LIKE 'E%';

-- 'e' ile biten employee 'name' degerini cagirin
SELECT name FROM employees
WHERE name LIKE '%e';

-- 'e' gecen employee 'name' degerini cagirin
SELECT name FROM employees
WHERE name LIKE '%e%';

--'B' ile başlayıp 't' ile biten employee 'name' değerlerini çağırın.
SELECT name FROM employees
WHERE name LIKE 'B%' AND name LIKE '%t';

SELECT name FROM employees
WHERE name LIKE 'B%t';

-- Herhangi bir yerinde 'a' bulunan employee 'name' değerlerini çağırın.
SELECT name FROM employees
WHERE name LIKE '%a%';

-- Herhangi bir yerinde 'e' ve 'r' bulunan employee 'name' değerlerini çağırın.
SELECT name FROM employees
WHERE name LIKE '%e%r%' OR name LIKE '%r%e%';

-- Herhangi bir yerinde 'e' veya 'r' bulunan employee 'name' değerlerini çağırın.
SELECT name FROM employees
WHERE name LIKE '%e%' OR name LIKE '%r%';

--2) _ Wildcard: Tek karakteri temsil eder.
-- Ikinci karakteri 'e' ve dördüncü karakteri 'n' olan "state" degerlerini cagirin
SELECT state FROM employees
WHERE state LIKE '_e_n%';

--Sondan ücüncü karakteri 'i' olan "state" değerlerini çağırın.
SELECT state FROM employees
WHERE state LIKE '%i__';

--İkinci karakteri 'e' olan ve en az 6 karakteri bulunan "state" değerlerini çağırın.
SELECT state FROM employees
WHERE state LIKE '_e____%';

CREATE TABLE words
( 
  word_id CHAR(10) UNIQUE,
  word VARCHAR(50) NOT NULL,
  number_of_letters SMALLINT
);

INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);

SELECT * FROM words;

-- NOT LIKE Condition
-- Herhangi bir yerinde 'h' bulunmayan "word" degerini cagirin
SELECT word FROM words
WHERE word NOT LIKE '%h%';

--'t' veya 'f' ile bitmeyen "word" değerlerini çağırın. 
SELECT word FROM words
WHERE word NOT LIKE '%t' AND word NOT LIKE '%f';

--Hergangi bir karakterle başlayıp 'a' veya 'e' ile devam etmeyen "word" değerlerini çağırın.
SELECT word FROM words
WHERE word NOT LIKE '_a%' AND word NOT LIKE '_e%';

--içinde a e geçmeyen "word" değerlerini çağırın.
SELECT word FROM words
WHERE word NOT LIKE '%a%' AND word NOT LIKE '%e%';

-- Regular Expression Condition:
-- ilk karakteri 'h', ikinci karakteri 'o','a' veya 'i' son karakteri 't' olan "word" değerlerini çağırın.
-- 1.Yol
SELECT word FROM words
WHERE word LIKE 'ho%t' OR word LIKE 'ha%t' OR word LIKE 'hi%t';

-- 2.Yol REGEXP kullanarak 
SELECT word FROM words
WHERE word ~ 'h[oai](.*)t';

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan "word" değerlerini çağırın.
SELECT word FROM words
WHERE word ~ 'h[a-e](.*)t';













