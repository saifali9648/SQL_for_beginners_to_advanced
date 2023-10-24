/*===================================LESSION2===========================================
CRUD OPERATION
CRUD :- stand for 
CREATE : CREATION OF NEW RECORD WHICH THOROUGH INSERT COMMAND
READ   : ONCE A DATA INSERTED IN TABLE WE CAN READ THROUGH  SELECT COMMAND
UPDATE : SOME RECORD IS ALREADY IN OUR TABLE WE CAN UPDATE THOROUGH UPDATE COMMAND
DELETE : SOME RECORD IS ALREADY IN OUR TABLE WE CAN DELETE THOROUGH DELETE COMMAND

CREATION of table and INSERT statements

hiring requirement locaction Saharsa
first CREATE DATABASE*/
 CREATE DATABASE saif;
--USE DATABASE
USE saif;
--CREATE TABLE 
CREATE TABLE employee
(
 firtname varchar(20),
 middlename varchar(20),
 lastname varchar(20),
 age INT,
 salary INT,
 locaction varchar(20)
);

--after that seeing fields write COMMAND

show TABLE;

--than write COMMAND

--DESCribe table_name
   DESC employee;

/*AFTER CREATING TABLE WE CAN INSERT DATA INTO TABLE RESPECTIVILY FIELDS table_name

FOR INSETING DATA INTO TABLE COMMAND IS

(recommanded way)*/
INSERT INTO employee(firstname,middlename,lastname,age,salary,locaction) VALUES('MD','SAIF','ALI',22,10000,'SAHARSA');


/*you can also write this way (in this case it will run but not all the time)*/
INSERT INTO employee VALUES('MD','SAIF','ALI',22,10000,'SAHARSA');

/*if someone don't have middlename than 
--(recommanded way) or to right way*/
INSERT INTO employee(firstname,lastname,age,salary,location) VALUES('Rajesh','kumar',32,1100,'Saharsa');

/*(in this case it give you an error)*/
INSERT INTO employee VALUES('Rajesh','kumar',32,1100,'Saharsa');

--if you want to add ' in your record we have two way to achive this 
--first is
INSERT INTO employee(firstname,lastname,age,salary,location) VALUES("Rajes's",'kumar',32,1100,'Saharsa'); 

--sencond way is
--INSERT INTO employee(firstname,lastname,age,salary,location) VALUES('Rajes\'s','kumar',32,1100,'Saharsa');

--how to insert multiple record in sigle query

INSERT INTO employee(firstname,middlename,lastname,age,salary,location) VALUES('md','rashid','ali',23,10000,'saharsa'),('r
akesh','kumar','mehta',34,10000,'saharsa');

--NULL constrant
--=========================================================
--when we want in our table that any particular or any field must be any value than we use "NOT NULL" constrant

--like
CREATE TABLE employee(
      firstname varchar(20) NOT NULL,
      middlename varchar(20) NOT NULL,
      lastname varchar(20) NOT NULL,
      age int,
      salary int NOT NULL,
      locaction varchar(30) NOT NULL
);

--Default values
--============================================================
--when we use any particular values and required many times than we set as default

CREATE TABLE employee(
   firtname varchar(20) NOT NULL,
   middlename varchar(20),
   lastname varchar(20) NOT NULL,
   age INT NOT NULL,
   salary INT NOT NULL,
   locaction varchar(20) DEFAULT 'SAHARSA'
);
--AFTER CREATING TABLE AND SET DEFAULT VALUE THAN 
--INSERT DATA INTO TABLE WITHOUT MENTION PARTICULAR DEAFAULT VALUE

INSERT INTO employee(firstname,lastname,age,salary) VALUES('MD','SIAF',23,10000);
--YOU CAN ALSO SET YOUR OWN VALUES IF YOU HAVE ANOTER DATA 
--LIKE
INSERT INTO employee(firstname,lastname,age,salary,locaction) VALUES('MD','RASHID',25,10000,'SASARAM');
--YOU CAN ALSO SET NULL IN THE PLACE OF DEFAULT VALUE
INSERT INTO employee(firstname,lastname,age,salary,locaction) VALUES('RAJESH','KUMAR',26,10000,NULL);

--Combination of DEFAULT and NOT NULL
--=======================================================================
--first drop the earlier table
DROP TABLE employee;
--THAN CREATE NEW TABLE 
CREATE TABLE employee(
   firtname varchar(20) NOT NULL,
   middlename varchar(20),
   lastname varchar(20) NOT NULL,
   age INT NOT NULL,
   salary INT NOT NULL,
   locaction varchar(20) NOT NULL DEFAULT 'SAHARSA'
);
--than insert data accordingly

INSERT INTO employee(firstname,lastname,age,salary) VALUES('RAKESH','KUMAR',23,10000);

--you can set your values at the place of default valuesl;
INSERT INTO employee(firstname,lastname,age,salary,locaction) VALUES('RAKESH','KUMAR',23,10000,'hydrabad');

INSERT INTO employee(firstname,lastname,age,salary,locaction) VALUES('RAKESH','KUMAR',23,10000,null);--it will give you an error


--=============================LESSION3=========================================
--PRIMARY KEY
--AUTO INCREMENT KEY
--UNIQUE KEY
--UNIQUE KEY VS PRIMARY KEY
--===========================================

--primary key
--========================================

--primary key helps to uniquely identify the record in the table


CREATE TABLE employee(
   empid INT PRIMARY KEY,
   firstname varchar(20) NOT null,
   middlename varchar(20),
   lastname varchar(20) NOT NULL,
   age INT NOT NULL,
   salary INT NOT NULL,
   locaction varchar NOT NULL DEFAULT "SAHARSA"
);

INSERT INTO employee(empid,firstname,middlename,lastname,age,salary) 
VALUES(1,'MD','SAIF','ALI',23,10000)

--if you insert same empid that is 1 than it will give you an error(because of that empid set as primary key)
INSERT INTO employee(empid,firstname,middlename,lastname,age,salary) 
VALUES(1,'MD','SAIF','ALI',23,10000)

--AUTO INCREMENT
--==================================================
CREATE TABLE employee(
   empid INT AUTO_INCREMENT,
   firstname varchar(20) NOT NULL,
   middlename varchar(20),
   lastname varchar(20)NOT NULL,
   age INT NOT NULL,
   salary INT NOT NULL,
   locaction varchar(20) DEFAULT 'saharsa',
   PRIMARY KEY(empid)
);

