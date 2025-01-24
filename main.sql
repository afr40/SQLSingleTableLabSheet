
-- Single Table Lab Sheet

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1), checkups SMALLINT UNSIGNED, birth DATE, death DATE);

. schema
. schema pet
. table


INSERT INTO pet (name,owner,species,sex,checkups,birth,death)VALUES 
('Fluffy','Harold','cat','f',5,'2001-02-04',NULL), 
('Claws','Gwen','cat','m',2,'2000-03-17',NULL), 
('Buffy','Harold','dog','f',7,'1999-05-13',NULL), 
('Fang','Benny','dog','m',4,'2000-08-27',NULL), 
('Bowser','Diane','dog','m',8,'1998-08-31','2001-07-29'), 
('Chirpy','Gwen','bird','f',0,'2002-09-11',NULL), 
('Whistler','Gwen','bird','',1,'2001-12-09',NULL), 
('Slim','Benny','snake','m',5,'2001-04-29',NULL);


SELECT * FROM pet;

SELECT * FROM pet WHERE sex = 'm'; 

SELECT DISTINCT owner FROM pet;

SELECT owner FROM pet WHERE sex = 'm';

SELECT name, species, sex FROM pet WHERE species = 'snake' OR species = 'bird';


-- Questions - 1

-- Q1-1
SELECT owner, name FROM pet WHERE sex = 'f';

-- Q1-2
SELECT name, birth FROM pet WHERE species = 'dog';

-- Q1-3
SELECT DISTINCT owner FROM pet WHERE species = 'bird';

-- Q1-4
SELECT DISTINCT species FROM pet WHERE sex = 'f';

-- Q1-5
SELECT name, birth FROM pet WHERE species = 'cat' OR species = 'bird';

-- Q1-6
SELECT name, species FROM pet WHERE species = 'cat' OR species = 'bird' AND sex = 'f';


SELECT name FROM pet WHERE sex < "m";


-- Questions - 2

-- Q2-1
SELECT owner, name FROM pet WHERE name LIKE '%er' OR '%all';

-- Q2-2
SELECT name FROM pet WHERE name LIKE '%e%' OR 'E%';

-- Q2-3
SELECT name FROM pet WHERE name NOT LIKE '%fy';

-- Q2-4
SELECT name FROM pet WHERE LENGTH(owner) = 4;

-- Q2-5 / Q2-6
-- Add another entry with a name that ends and starts with A
INSERT INTO pet (name,owner,species,sex,checkups,birth,death)VALUES 
('Miso','Anna','cat','f',5,'2001-02-04',NULL);
SELECT DISTINCT owner FROM pet WHERE owner REGEXP '^[A-E].*[a-e]$';


SELECT name, birth FROM pet ORDER BY birth; 
SELECT name, birth FROM pet ORDER BY birth DESC; 
SELECT name, species, birth FROM pet ORDER BY species, birth DESC;

SELECT name, birth, species FROM pet ORDER BY species DESC, birth; 

SELECT name FROM pet WHERE strftime('%m',birth) = strftime('%m','12');

SELECT name, strftime('%m', birth) AS Month FROM pet; 
SELECT name, strftime('%m', birth) AS Month FROM pet WHERE death IS NULL;

SELECT owner, name, (checkups * 20) AS income FROM pet;
SELECT owner, name, birth, MIN(strftime('%Y',birth)) AS birth FROM pet GROUP BY owner;


-- Questions - 3

-- Q3-1
SELECT owner, AVG(checkups) AS 'Average Checkups' FROM pet GROUP BY owner;

-- Q3-2
SELECT species, COUNT(species) AS 'Number of Species' FROM pet GROUP BY species;

-- Q3-3
SELECT owner, species, COUNT(species) AS 'NoSpecies' FROM pet GROUP BY owner, species;

-- Q3-4
SELECT owner, COUNT(DISTINCT species) AS 'No Distinct Species' FROM pet GROUP BY owner;

-- Q3-5
SELECT sex, COUNT(sex) AS 'No of each Gender' FROM pet WHERE sex != '' AND sex IS NOT NULL GROUP BY sex;

-- Q3-6
SELECT owner, COUNT(species) AS 'No of Birds' FROM pet WHERE species = 'bird' GROUP BY owner;

-- Q3-7
SELECT owner, SUM(checkups) AS 'Total Checkups' FROM pet GROUP BY owner;
