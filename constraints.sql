          
		  
		  -------UNIQUE CONSTRAINTS-----
	CREATE TABLE persons(
    person_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    UNIQUE(email)
)
select * from persons
INSERT INTO persons(first_name, last_name, email)
VALUES('John','Doe','tanay7614@gmail.com');
INSERT INTO persons(first_name, last_name, email)
VALUES('Tanay','Doe','tanay7614@gmail.com');

CREATE TABLE person_skills (
    id INT IDENTITY(1,3) PRIMARY KEY,
    person_id int,
    skill_id int,
    updated_at DATETIME,
    UNIQUE (person_id, skill_id)
);
select * from person_skills
INSERT INTO person_skills(person_id,skill_id,updated_at)
VALUES(2,6,GETDATE());
INSERT INTO person_skills(person_id,skill_id,updated_at)
VALUES(3,7,GETDATE());


           ------- forgein key, primary key constraints ------
		   CREATE TABLE employee1 (Emp_ID INT NOT NULL PRIMARY KEY,
		                           Emp_Name VARCHAR (40),
								   Emp_Salary VARCHAR (40)
								   )
		   CREATE TABLE department(Dept_ID INT NOT NULL PRIMARY KEY,
		                           Dept_Name VARCHAR(40), 
								   Emp_ID INT NOT NULL,
								   FOREIGN KEY(Emp_ID) REFERENCES employee1(Emp_ID)
								   )  
		   select * from department 

		   --------GROUP BY ORDER BY CLAUSE------

SELECT emp_address,AVG(emp_salary)
FROM employee  
GROUP BY  emp_address  
ORDER BY emp_address ASC;  

SELECT emp_address,SUM(emp_salary)
FROM employee  
GROUP BY  emp_address  
ORDER BY emp_address ASC; 

SELECT emp_address,COUNT(*) as NumOfAddress
FROM employee  
GROUP BY  emp_address  
ORDER BY emp_address DESC; 
 select  * from employee

                    --------SUBQUERIES-------

   SELECT * FROM employee 
   WHERE emp_ID IN (SELECT emp_ID 
   FROM  employee
   WHERE emp_salary < 600000)

   UPDATE persons 
   SET last_name = 'smith'
   WHERE person_id IN (SELECT emp_id FROM employee WHERE emp_address = 'Chennai' )

   select * from persons

    --------Cast Function--------
	 SELECT CAST('2017-08-25' AS datetime);
	 SELECT CAST(25.65 AS varchar);
	 SELECT CAST(25.65 AS smallint);
	 SELECT CAST(25.65 AS tinyint);
	
	 SELECT CAST(25.65 AS numeric);
	 SELECT CAST(25.65 AS  datetime);
	 SELECT CAST(25.65 AS varchar);
	 SELECT CAST(25 AS binary);
	 select id,name,birth_date,CAST(birth_date as varchar)as convertedDOB from tblemploye
	 select id,name,birth_date,convert( nvarchar ,birth_date,103)as convertedDOB from tblemploye
	      -------Convert Function-------
     SELECT CONVERT(varchar, '2017-08-25');
	 SELECT CONVERT(int, 12.5);

	 A derived table is an expression that generates a table within the scope of a query FROM clause.
	 For example, a subquery in a SELECT statement FROM clause is a derived table:


	  --------Indexes-------

	 CREATE INDEX idx_lastname    /*retrive data is fast but input in slow*/
     ON employee (emp_Name);
	 
	 drop  index employee.idx_lastname
	 
	      -----------function----------

	CREATE FUNCTION east_from (@long int)
    RETURNS TABLE AS
    RETURN
	SELECT *
	FROM employee
	WHERE emp_salary > @long;

	sELECT * FROM east_from(100000)

	[YourName] Added:Implemented DML,DQL,TCL Features in SQL Practice COmmands Project