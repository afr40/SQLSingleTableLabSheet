
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

SELECT * FROM pet WHERE sex = "m"; 

SELECT DISTINCT owner FROM pet;

SELECT owner FROM pet WHERE sex = "m";

SELECT name, species, sex FROM pet WHERE species = "snake" OR species = "bird";


-- Questions - 1

-- Q1-1
SELECT owner, name FROM pet WHERE sex = "f";

-- Q1-2
SELECT name, birth FROM pet WHERE species = "dog";

-- Q1-3
SELECT DISTINCT owner FROM pet WHERE species = "bird";

-- Q1-4
SELECT DISTINCT species FROM pet WHERE sex = "f";

-- Q1-5
SELECT name, birth FROM pet WHERE species = "cat" OR species = "bird";

-- Q1-6
SELECT name, species FROM pet WHERE species = "cat" OR species = "bird" AND sex = "f";
