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
--LET INSERT SOME VALUES IN TABLE

INSERT INTO employee(firstname,lastname,age,salary) VALUES('MD','SAIF',23,10000);

--here i am not put the value of empid if you do SELECT * FORM employee; you get the value of empid
--initialy value of empid is 1 then next is 2 and so on........
SELECT *FROM employee;

--UNIQUE KEY v\s primary key
--===================================================================================
--you can have only one PRIMARY KEY
--and the PRIMARY KEY can not hold NULL
--we should use primary key when we have to uniquely identify each record
--the purpose of primary key is to make sure that we can uniquly identify the record

--UNIQUE KEY can hold NULL

--for example in MySQL a unique key can hold any number of null values
--in other famoud DB a unique key can hodl only one null value
--so the purpose of unique key  is to make sure the values do not duplicates

--we can have only one primary key but multiple unique key

--composite primary key

CREATE TABLE employee(
   firstname varchar(20) NOT NULL,
   lastname varchar(20) NOT NULL,
   age INT NOT NULL,
   PRIMARY KEY(firstname,lastname)
);

INSERT INTO employee VALUES('MD','SAIF',23);

INSERT INTO employee VALUES('MD','RASHID',23); --IT WILL NOT GIVE YOU AN ERROR


--IF YOU INSERT AGEIN THE FIRST QUERY THAN IT WILL GIVE YOU AN ERROR LIKE DUPLICATE ENTRY 





CREATE TABLE employee(
   firstname varchar(20) UNIQUE KEY,
   lastname varchar(20) NOT NULL,
   age INT NOT NULL,
   salary INT NOT NULL
);


INSERT INTO employee(firtname,lastname,age,salary) VALUES('MD','SAIF',23,10000);

INSERT INTO employee(firtname,lastname,age,salary) VALUES(NULL,'SAIF',23,10000); ---IT WILL NOT GIVE YOU ERROR 

--IF YOU INSERT AGAIN FIRST QUERY THAN IT WILL GIVE YOU AN ERROR THAT IS DUPLICATE BECAUSE OF UNIQUE KEY CONSTRANT

INSERT INTO employee(firtname,lastname,age,salary) VALUES('MD','SAIF',23,10000); ---ERROR

--COMBINATION OF UNIQE KEY CONSTRANT

CREATE TABLE employee(
   ID INT UNIQUE KEY,
   firstname varchar(20) UNIQUE KEY NOT NULL,
   lastname varchar(20) NOT NULL,
   age INT NOT NULL,
   salary INT NOT NULL
);


---============LESSION-4========================

CRUD

C  - CREATE => INSERT
R  - READ   => SELECT
U  - UPDATE => UPDATE
D  - DELETE => DELETE

--select
--===============================================
--first create a database like 'saif'
CREATE DATABASE saif;
--than create table employee
CREATE TABLE employee(
   id INT PRIMARY KEY,
   firstname varchar NOT NULL,
   middlename varchar,
   lastname varchar NOT NULL,
   age int NOT NULL,
   salary int NOT null,
   locaction varchar NOT NULL DEFAULT 'saharsa'
);
--selecting all columns
SELECT *FROM employee;

--selecting specific columns

SELECT firstname,lastname,age FROM employee;


--select by appling where clause (fillter condition)

SELECT * FROM employee where age>20;

--selecting using two clause

SELECT firstname,lastname FROM employee where age>26 and salary>1000;


--Update
--=============================================================

--use update Query with clause
--before updating any record check the corrosponding values
--like
SELECT firstname,lastname,locaction FROM employee;
--than update 

UPDATE employee SET locaction='MADHEPURA' WHERE firstname='MD' AND lastname='SAIF';


--Delete
--==============================================================
---before deleting any record check the crrosponding values
--like 
SELECT firstname,lastname,age from employee WHERE age=23;
DELETE FROM employee WHERE age=23;

--if i write the statement like...
 DELETE from employee;

 --then it will delete all the record which is avilable in table


 --Alter v\s Update

--update is used to update our record

--and Alter is used to alter the schema

--Alter
--==================================================================

--add a column in employee table column name is jobtile

Alter TABLE employee add column jobtitle varchar(20);

--drop the column jobtitle 

Alter TABLE employee DROP column jobtitle;

--set varchar(30) of firstname
Alter TABLE employee modify cloumn firstname varchar(30);

--remove primary key from the table
 Alter table employee drop primary key;

--add primary key 

Alter TABLE employee add primary key(id);


DDL & DML
--====================================================================
DDL => DATA DEFINATION LANGUAGE 
      =>DEALS WITH TABLE STRUCTURE
   

DML => DATA MANIPULATION LANGUAGE
      =>DEALS WITH DATA

      DDL ->>>> CREATE , Alter , DROP

      DML ->>>> INSERT,UPDATE , DELETE