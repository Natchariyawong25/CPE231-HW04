-- ข้อ a
SELECT e."Fname" ||' '|| e."Lname" as "Employee_full_name",
	   e."Salary" as "Max_salary"
FROM "EMPLOYEE" e 
WHERE e."Dno" IN (SELECT e."Dno"  FROM "EMPLOYEE" e 
	  	WHERE e."Salary" = (SELECT MAX(e."Salary") as "Max_Salary" FROM "EMPLOYEE" e));

-- ข้อ b
SELECT e."Fname" ||' '|| e."Lname" as "Employee_full_name" ,
	   (select e1."Fname" ||' '|| e1."Lname" 
		from "EMPLOYEE" e1
		WHERE e1."Ssn" = '888665555') as "Supervisor_name" ,
	   (select e2."Ssn" 
		from "EMPLOYEE" e2
		WHERE e2."Ssn" = '888665555' ) as "Ssn_id"
FROM "EMPLOYEE" e 
WHERE e."Super_ssn" IN (SELECT e."Ssn" FROM "EMPLOYEE" e 
	  		WHERE e."Ssn" = '888665555' );

-- ข้อ c
SELECT e."Fname" ||' '|| e."Lname" as "Employee_full_name",
	   e."Salary" as "Employee_salary"
FROM "EMPLOYEE" e 
WHERE e."Salary" > 10000  + (SELECT MIN(e."Salary") as "Min_Salary" FROM "EMPLOYEE" e);

-- Check data in Table
SELECT * FROM "EMPLOYEE" ; 

