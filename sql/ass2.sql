-- ข้อ a
SELECT e."Fname" ||' '|| e."Lname" as "Employee_full_name",
	   e."Salary" as "Max_salary"
FROM "EMPLOYEE" e 
WHERE e."Dno" IN (SELECT e."Dno"  FROM "EMPLOYEE" e 
	  	WHERE e."Salary" = (SELECT MAX(e."Salary") as "Max_Salary" FROM "EMPLOYEE" e));

-- ข้อ b
SELECT e1."Fname" ||' '|| e1."Lname" as "Employee_full_name" ,
	   e1."Super_ssn" as "Super_ssn" ,
	   Super_id."Super_ssn" as "Super_Supervisor_Ssn"
	   FROM  (select e1."Ssn" , e1."Super_ssn" from "EMPLOYEE" e1 WHERE e1."Super_ssn" = '888665555') as Super_id , "EMPLOYEE" e1
WHERE Super_id."Ssn" = e1."Super_ssn" ; 

-- ข้อ c
SELECT e."Fname" ||' '|| e."Lname" as "Employee_full_name",
	   e."Salary" as "Employee_salary"
FROM "EMPLOYEE" e 
WHERE e."Salary" > 10000  + (SELECT MIN(e."Salary") as "Min_Salary" FROM "EMPLOYEE" e);

-- Check data in Table
SELECT * FROM "EMPLOYEE" ; 

