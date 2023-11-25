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

----TRUNCATE 
--=======================================================================

--truncate also remove all record like delete command but truncate is a DDL command
--and delete is a DML command 

--truncate drop the table and recreate it


Foreign key constrant
--===================================LESSION-5=======================================

CREATE TABLE students(
   student_id int PRIMARY KEY AUTO_INCREMENT,
   student_fname varchar(20) NOT NULL,
   student_mname varchar(20),
   student_lname varchar(20) NOT NULL,
   student_email varchar(30) NOT NULL unique key,
   student_phone varchar(15) NOT NULL,
   student_alt_phone varchar(15),
   enrollment_date timestamp NOT NULL,
   year_of_exp int NOT NULL,
   student_company varchar(20),
   batch_date varchar(20) NOT NULL,
   source_of_joining varchar(20) NOT NULL,\
   location varchar(20) NOT NULL
);


INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('rohot','sharma','rohit@gmail.com','9191919191',3,3,'walmart','10-11-2023','linkedln','ambala');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('irfan','pathan','irfan@gmail.com','9192919291',3,'flipkart','10-11-2023','linkedln','ambala');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('surya','kumar','surya`@gmail.com','9193919393',3,'amazon','10-11-2023','linkedln','ambala');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('virat','kholi','virat`@gmail.com','9194919493',5,'hcl','10-11-2023','facebook','delhi');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('inshan','kishan','ishan`@gmail.com','9195919493',4,'TCS','10-11-2023','facebook','bihar');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('md','shami','shami`@gmail.com','9191919493',6,'infogain','10-11-2023','instagram','delhi');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('subhman','gill','gill@gmail.com','9197919493',4,'microsoft','10-11-2023','instagram','mumbai');

--after that create course table

CREATE TABLE courses(
   course_id int PRIMARY KEY,
   course_name varchar(20) NOT NULL,
   course_duration_month int NOT NULL,
   course_fee int NOT NULL
);

--seed data

INSERT INTO courses VALUES(1,'big data',6,50000);
INSERT INTO courses VALUES(2,'web development',3,20000);
INSERT INTO courses VALUES(3,'data science',6,40000);
INSERT INTO courses VALUES(4,'devopps',1,10000);


---let some change in our student table

CREATE TABLE students(
   student_id int PRIMARY KEY AUTO_INCREMENT,
   student_fname varchar(20) NOT NULL,
   student_mname varchar(20),
   student_lname varchar(20) NOT NULL,
   student_email varchar(30) NOT NULL unique key,
   student_phone varchar(15) NOT NULL,
   student_alt_phone varchar(15),
   enrollment_date timestamp NOT NULL,
   selected_course int NOT NULL DEFAULT '1',
   year_of_exp int NOT NULL,
   student_company varchar(20),
   batch_date varchar(20) NOT NULL,
   source_of_joining varchar(20) NOT NULL,
   location varchar(20) NOT NULL
);
--select student_fname,student_lname,selected_course,student_company,batch_date,source_of_joining,location from students;
--seed data2
INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('rohot','sharma','rohit@gmail.com','9191919191',3,'walmart','10-11-2023','linkedln','ambala');


INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('irfan','pathan','irfan@gmail.com','9192919291',2,'flipkart','10-11-2023','linkedln','ambala');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('surya','kumar','surya`@gmail.com','9193919393',3,'amazon','10-11-2023','linkedln','ambala');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('virat','kholi','virat`@gmail.com','9194919493',2,'hcl','10-11-2023','facebook','delhi');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('inshan','kishan','ishan`@gmail.com','9195919493',4,'TCS','10-11-2023','facebook','bihar');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('md','shami','shami`@gmail.com','9191919493',6,'infogain','10-11-2023','instagram','delhi');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('subhman','gill','gill@gmail.com','9197919493',4,'microsoft','10-11-2023','instagram','mumbai');

--what happend if any student choose course id 5 but not any course is exesited int course table which id is 5

INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('jaspreet','bumrah','jaspreet@gmail.com','9197819493',5,4,'microsoft','10-11-2023','instagram','mumbai');

--it will selected or inserted in table but no any course is available which course id is 5 
--than problem is created 
--and this type of problem we use foreign key constrant

--again drop the table student and let some change in


CREATE TABLE students(
   student_id int PRIMARY KEY AUTO_INCREMENT,
   student_fname varchar(20) NOT NULL,
   student_mname varchar(20),
   student_lname varchar(20) NOT NULL,
   student_email varchar(30) NOT NULL unique key,
   student_phone varchar(15) NOT NULL,
   student_alt_phone varchar(15),
   enrollment_date timestamp NOT NULL,
   selected_course int NOT NULL DEFAULT '1',
   year_of_exp int NOT NULL,
   student_company varchar(20),
   batch_date varchar(20) NOT NULL,
   source_of_joining varchar(20) NOT NULL,
   location varchar(20) NOT NULL,
   FOREIGN KEY(selected_course) REFERENCES courses(course_id)
);

--now insert the data

INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('rohot','sharma','rohit@gmail.com','9191919191',3,3,'walmart','10-11-2023','linkedln','ambala');


INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('irfan','pathan','irfan@gmail.com','9192919291',2,3,'flipkart','10-11-2023','linkedln','ambala');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('surya','kumar','surya`@gmail.com','9193919393',3,3,'amazon','10-11-2023','linkedln','ambala');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('virat','kholi','virat`@gmail.com','9194919493',2,5,'hcl','10-11-2023','facebook','delhi');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('inshan','kishan','ishan`@gmail.com','9195919493',4,'TCS','10-11-2023','facebook','bihar');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('md','shami','shami`@gmail.com','9191919493',6,'infogain','10-11-2023','instagram','delhi');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('subhman','gill','gill@gmail.com','9197919493',4,'microsoft','10-11-2023','instagram','mumbai');

--now insert/select courese_id  which is not available

INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('jaspreet','bumrah','jaspreet@gmail.com','9197819493',5,4,'microsoft','10-11-2023','instagram','mumbai');

--it will give error 
--because of foreign key constrant

--1. the foreign key constrant is used to prevent actions that would destroy links between two tables
--2. A foreign key is a field in one table that refers to the primary key in another tabnle
--3. selected_course is a foreign key in students table which refers to course_id(primary key) in courses table

--the table with foreign key is called child table
--the table with primary key is clled parent/referenced table 

/*parent/referenced table ==>  courses
child table ==> students*/

--NOT NULL KEY
--UNIQUE KEY CONSTRANT
--PRIMARY KEY CONSTRANT
--FOREIGN KEY CONSTRANT
--check constrant (its not supported in mysql)

--Constrant key is used to limit the type of data that can go into the table.
--This ensure the accuracy and relablity of the data is maintaned.
--if there is any voilation than the action is aborated.

--======================LESSION-6==========================================

--DISTINCT

--ORDER by

--limit

--LIKE
-------------------------------------------------------------
--DISTINCT
--=============================================================

CREATE DATABASE saif;

use saif;

--create table

CREATE TABLE students(
   student_id int PRIMARY KEY AUTO_INCREMENT,
   student_fname varchar(20) NOT NULL,
   student_mname varchar(20),
   student_lname varchar(20) NOT NULL,
   student_email varchar(30) NOT NULL unique key,
   student_phone varchar(15) NOT NULL,
   student_alt_phone varchar(15),
   enrollment_date timestamp NOT NULL,
   selected_course int NOT NULL DEFAULT '1',
   year_of_exp int NOT NULL,
   student_company varchar(20),
   batch_date varchar(20) NOT NULL,
   source_of_joining varchar(20) NOT NULL,
   location varchar(20) NOT NULL
);

--than insert some seed data

INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('rohit','sharma','rohit@gmail.com','9191918191',3,'walmart','10-11-2023','linkedln','ambala');


INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('irfan','pathan','irfan@gmail.com','9192919291',2,'flipkart','10-11-2023','linkedln','ambala');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('surya','kumar','surya`@gmail.com','9193919393',3,'amazon','10-11-2023','linkedln','ambala');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,selected_course,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('virat','kholi','virat`@gmail.com','9194919493',2,'hcl','10-11-2023','facebook','delhi');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('inshan','kishan','ishan`@gmail.com','9195919493',4,'TCS','10-11-2023','facebook','bihar');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('md','shami','shami`@gmail.com','9191919493',6,'infogain','10-11-2023','instagram','delhi');

INSERT INTO students(student_fname,student_lname,student_email,student_phone,year_of_exp,
student_company,batch_date,source_of_joining,location) 
VALUES('subhman','gill','gill@gmail.com','9197919493',4,'microsoft','10-11-2023','instagram','mumbai');

--now if you select or you want see location of student

select location from students;

--it will display all location in this case redendancy is to bee there like if any place comes two time it will aslo display tow times

--in this case we use DISTINCT KEYWORD

SELECT DISTINCT location from students;

SELECT DISTINCT source_of_joining from students;

SELECT DISTINCT student_company from students;

--Order By
--====================================================================

select student_fname,student_lname,selected_course,student_company,batch_date,source_of_joining,location from students ord
er by batch_date;

select student_fname,student_lname,selected_course,student_company,batch_date,source_of_joining,location from students ord
er by selected_course;

select student_fname,student_lname,selected_course,student_company,year_of_exp,batch_date,source_of_joining,location from
students order by selected_course;

select student_fname,student_lname,selected_course,student_company,year_of_exp,batch_date,source_of_joining,location from
students order by year_of_exp;

select student_fname,year_of_exp from students order by year_of_exp;

select student_fname,year_of_exp from students order by year_of_exp,student_fname;

--it will sort the data based on year_of_exp in desscending order
select student_fname,year_of_exp from students order by year_of_exp desc;

--Limit
--============================================================================

select student_fname,student_lname,selected_course,student_company,year_of_exp,batch_date,source_of_joining,location from
students order by year_of_exp;

--get 3 condidates with least experience

select student_fname,student_lname,selected_course,student_company,year_of_exp,batch_date,source_of_joining,location from
students order by year_of_exp limit 3;

---if we use limit along with order by its more logicaly


--want to know that from which source last 5 candidates have enrolled

select source_of_joining from students order by enrollment_date desc limit 5;
--this query wont work (because of order of execution) Distinct apply on both source_of_joining and enrollment_date
select DISTINCT source_of_joining from students order by enrollment_date desc limit 5;

select student_id,enrollment_date,selected_course,student_fname,year_of_exp,student_company,batch_date,source_of_joining,location from students order by enrollment_date desc limit 1;

select *from students order by enrollment_date limit 0,3;

select *from students order by enrollment_date limit 3,2; 

--LIKE
--===============================================================

select student_id,enrollment_date,selected_course,student_fname,year_of_exp,student_company,batch_date,source_of_joining,location from students where student_fname like '%ra%';

-- % is wildcard character
-- (_) means exactly one character
select student_id,enrollment_date,selected_course,student_fname,year_of_exp,student_company,batch_date,source_of_joining,location from students where student_fname like 'ra%';


select student_id,enrollment_date,selected_course,student_fname,year_of_exp,student_company,batch_date,source_of_joining,location from students where student_fname like '%at';

select student_id,enrollment_date,selected_course,student_fname,year_of_exp,student_company,batch_date,source_of_joining,location from students where student_fname like '_____';


--==============================LESSION-8==================================
--AGGREGATE FUNCTIONS

Count()

select *form students;
--it will display all record present in the table

select Count(*) from students;
---it will tell how many rows are in the table


select Count(student_company) from students;
--it will dispaly how many company from students enrolled, in this query duplicates are also counted maeans if any two students enrolled from same comapany it wil consider two times

--problem statement
--i want unique instance
select Count(DISTINCT student_company) from students;
---it will not consider duplicate 

--you can also give the alis 
--like
select Count(DISTINCT student_company) As No_of_company from students;

--problem statement
--How many students joinig in any particular month.
--right now November so i will check how many student joinig in november batch.

select count(*) from students where batch_date like '%-11%';

--problem statement
--How many students join in particular date.

select count(*) from students where batch_date like '10-%';

GROUP By
--================================================================
--WHAT I WANT TO KNOW THAT HOW MANY PEOPLE HAVE JOINED MY COURSE GOT TO KNOW ABOUT ME THROUGH

SELECT source_of_joining,count(*) from students GROUP BY source_of_joining;


--what i want to know that how many people have joined my course from where means his location.

SELECT location, count(*) from students GROUP BY location;

---this will not work
SELECT location, count(*) from students GROUP BY source_of_joining;

--now what i want to know that how many people come from which location and got to know about me through.

SELECT location,source_of_joining, count(*) FROM students GROUP BY location,source_of_joining;


--PROBLEM STATEMENT
--I WANT TO KNOW HOW MANY COURSE OPTED IN WHICH DATE WHICH COURSE 

select batch_date,selected_course,count(*) from students GROUP BY batch_date,selected_course;


MIN & MAX
--============================================================
--i want who have minimum experiance

select MIN(year_of_exp) from students;

---i want who have maximum experiance

select MAX(year_of_exp) from students;

---this wont work
select MIN(year_of_exp),student_fname from students;


--i want student name with minimum exp

select student_fname from students order by year_of_exp limit 1;
select student_fname,year_of_exp from students order by year_of_exp limit 1;

--problem statement
--i wnat to know students who are which source of joining with maximum exp

select source_of_joining,MAX(year_of_exp) from students GROUP BY source_of_joining;

SUM
--===============

--PROBLEM STATEMENT
---I WANT TO KNOW SUM OF EXPERIANCE ALL SOURCE OF JOINING

SELECT source_of_joining,SUM(year_of_exp) FROM students GROUP BY source_of_joining;


AVG
--===============

--problem statement
-- i want to know average exeperience of students from  which source

select source_of_joining,AVG(year_of_exp) from students GROUP BY source_of_joining;
select source_of_joining,AVG(selected_course) from students GROUP BY source_of_joining;

--====================lession-9==============================================

--data type
--=====================================
--decimal
CREATE TABLE courses_new(
   course_id int PRIMARY KEY,
   course_name varchar(30) NOT NULL,
   course_duration_month decimal(3,1) NOT NULL,
   course_fee int NOT NULL
);

INSERT INTO courses_new VALUE(1,'BIG DATA',6.5,50000);
INSERT INTO courses_new VALUE(2,'BIG DATA',3.5,50000);
INSERT INTO courses_new VALUE(3,'BIG DATA',6,50000);

--TIMESTAMP
--WHEN WE INSERT OR UPDATE RECORED IT WILL SHOW TIME WHEN RECORD IS INSERTED OR UPDATED
CREATE TABLE courses_new(
   course_id INT PRIMARY KEY,
   course_name varchar(30) NOT NULL,
   course_duration_month decimal(3,1) NOT NULL,
   course_fee INT NOT NULL,
   changed_at TIMESTAMP DEFAULT now()
);

INSERT INTO courses_new(course_id,course_name,course_duration_month,course_fee) VALUE(1,'BIG DATA',6.5,50000);


INSERT INTO courses_new(course_id,course_name,course_duration_month,course_fee) VALUE(2,'BIG DATA',3.5,50000);

INSERT INTO courses_new(course_id,course_name,course_duration_month,course_fee) VALUE(3,'BIG DATA',6,50000);

--it will show courent time in changed_at attribute that when the data is inserted

--now if we update record what will happen

update courses_new set course_name='devops' where course_id=3;

--it will show earlier time when we insert first time 

---so now we change some small change in our schema

CREATE TABLE courses_new(
   course_id INT PRIMARY KEY,
   course_name varchar(30) NOT NULL,
   course_duration_month decimal(3,1) NOT NULL,
   course_fee INT NOT NULL,
   changed_at TIMESTAMP DEFAULT now() on update now()
);

INSERT INTO courses_new(course_id,course_name,course_duration_month,course_fee) VALUE(1,'BIG DATA',6.5,50000);


INSERT INTO courses_new(course_id,course_name,course_duration_month,course_fee) VALUE(2,'BIG DATA',3.5,50000);

INSERT INTO courses_new(course_id,course_name,course_duration_month,course_fee) VALUE(3,'BIG DATA',6,50000);


--update data

 update courses_new set course_name='web development' where course_id=1;

----it will show now curent updated time

 update courses_new set course_name='data science' where course_id=3;
 

--======================LESSION-10========================================

--LOGICAL OPERATOR

--NOT EQUAL TO  !=

--to get people who are from delhi
select *from students where location = 'delhi'

---to get people who are not from delhi
SELECT *FROM students WHERE location != 'delhi';

--we have also courses table so
-- get the all courses which has the word 'data'

select *from courses where course_name like '%data%';

--get the all courses which do not have 'data' word

select *from courses where course_name not like '%data%';


--I want to get a list of student who have less than 8 year exp and source_of_joining is linkedln and they are from delhi

select student_fname from students where year_of_exp<5 and source_of_joining='linkedln' and location='delhi';


select student_fname,year_of_exp,source_of_joining,location from students where year_of_exp<8 and source_of_joining='linkedln' and location='delhi';




--i want all people who do not fall between 3 to 5 year_of_exp

select * from students where year_of_exp< 3 or year_of_exp >5;

--instead of this we use 'between' operator

select *from students where year_of_exp  not between 3 and 5;

--if i want all people who fall between 3 to 5 year_of_exp

select *from students where year_of_exp between 3 and 5;




---get list of students who are from flipkart , walmart or microsoft

select *from students where student_company='flipkart' or student_company='walmart' or student_company='microsoft';

---instead of this we use 'in' operator

select *from students where student_company in('flipkart','walmart','microsoft');



---i want get list of students who are not from flipkart , walmart or microsoft

select *from students where student_company not in('flipkart','walmart','microsoft');




---if a course is more than 4 months we catagerize it as mater program else it is a diploma

select course_id,course_name,course_fee,
case
when course_duration_month > 4 then 'master' 
else 'diploma'
end as course_type from courses;


--people working for walmart,flipkart, microsoft we want to say product based and all otheres services based

select student_id,student_fname,student_lname,student_company,
case
when student_company in('flipkart','walmart','microsoft') then 'product based'
else 'service based'
end as type_of_company from students;

---we can put multiple condition in case

select student_id,student_fname,student_lname,student_company,
case
when student_company in('flipkart','walmart','microsoft') then 'product based'
when student_company is NULL then 'not define'
else 'service based'
end as type_of_company from students;



--======================LESSION-10=========================================

JOINS

--WE HAVE 2 TABLES
--COURSES
--STUDENTS

--I WANT TO KNOW IN WHICH COURSE Rohit HAS ENROLLED

STUDENTS
--=========
student_fname, selected_course
rohit,1

COURSES
--=========
course_id,course_name
2,rohit

select course_name from courses where course_id=(select selected_course from students where student_fname='rohit');


--A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

--so we have two tables
--students
--courses
   --in studets table 'selected_courese'
   --in courses table 'course_id'

select student_fname,student_lname,selected_course,course_id,course_name from students join courses on students.selected_course = courses.course_id;
--order by course_id
select student_fname,student_lname,selected_course,course_id,course_name from students join courses on students.selected_course = courses.course_id ORDER BY course_id;

--by default it is inner join

--only the matching record are considered. non matching record discarded

left outer join
===========
--all the matching records from the left and right table are considred 
+
--all non matching records in the left table which does not have the  match  in the right padded with null

--select student_fname,student_lname,selected_course,course_id,course_name from students left join courses on student.selected_course = courses.course_id;

create new table

create table students_latest as select *from students;

--it will create new table as students without any constrant

create table courses_latest as select *from courses;

--it will create new table as courses without any constraint

--now delete a record in the courses_latest table

delete from courses_latest where course_id = 2;

--now write the query for left join

select student_fname,student_lname,selected_course,course_id,course_name from students_latest
left join courses_latest on students_latest.selected_course = courses_latest.course_id;


Right outer join
=========================

--all the matching records from the Right and left table are considred 
+
--all non matching records in the Right table which does not have the  match  in the left padded with null

select student_fname,student_lname,selected_course,course_id,course_name from students_latest
right join courses_latest on students_latest.selected_course = courses_latest.course_id;


full outer join
--=============================

--all the matching record
+
--non matching record from left
+
--non matching record from right

---with the help of union we can do full outer join

select student_fname,student_lname,selected_course,course_id,course_name from students_latest
left join courses_latest on students_latest.selected_course = courses_latest.course_id
union
select student_fname,student_lname,selected_course,course_id,course_name from students_latest
right join courses_latest on students_latest.selected_course = courses_latest.course_id;


--IMPORTANT SQL INTERVIEW QUESTION
--===========================================================

--Q. Where Vs Having clause in sql

--problem statement
--i want to know total number of students who have join from each source and sources ar like linkedln, youtube, google

select source_of_joining,count(*) as total from students GROUP by source_of_joining;

--problem statement

-- i want to know the leads source_of_joining with more than 2  person has registred

select source_of_joining,count(*),as total from students GROUP BY source_of_joining where total > 1;
--it will display error

--because where  clause is use before aggregation
-- where clause is used to filter the individual records before the aggeregation

--so right query for this paricular problem statement is

select source_of_joining,count(*) as total from students GROUP BY source_of_joining Having total > 2;

--problem statement
-- i want to know the count of people who registread through linkedln

select source_of_joining,count(*) as total from students GROUP by source_of_joining Having source_of_joining = 'linkedln';

--it will display the right output but this is not efficent or productive query for this ps
--efficent query is

select source_of_joining,count(*) as total from students where source_of_joining = 'linkedln' GROUP by source_of_joining;






