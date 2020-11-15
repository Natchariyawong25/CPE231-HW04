-- ข้อ a
CREATE VIEW assignment_a AS 
	SELECT d."Dname" as "Departure_name",
		   e."Fname" ||' '|| e."Lname" as "Manager_name" ,
		   e."Salary" as "Salary"
	FROM "EMPLOYEE" e
	JOIN "DEPARTMENT" d ON d."Mgr_ssn" = e."Ssn"
	GROUP BY d."Dnumber" , e."Fname" , e."Lname" ,e."Salary";
-- Drop view
DROP VIEW assignment_a;
-- check data in view
SELECT * FROM assignment_a ;
-- ข้อ b
CREATE VIEW assignment_b AS 
	SELECT	e1."Fname" ||' '|| e1."Lname" as "Employee_full_name" ,
			e2."Fname" ||' '|| e2."Lname" as "Supervisor_full_name" ,
			d."Dname" as "Departure_name",
			e1."Salary" as "Salary"
	FROM "EMPLOYEE" e1 , "EMPLOYEE" e2 ,"DEPARTMENT" d 
	WHERE e1."Super_ssn" = e2."Ssn" AND d."Dnumber" = e1."Dno" AND d."Dname" = 'Research' ;
-- Drop view
DROP VIEW assignment_b;
-- check data in view
SELECT * FROM assignment_b ;

-- ข้อ c
-- เเบบ 1 : I will choose (1) to query.
CREATE VIEW assignment_c AS
	SELECT	P."Pname" as "Product_name",
			d."Dname" as "Departure_name",
			COUNT(*) as "Number_of_employees" ,
			SUM(w."Hours") as "Total_hours"
	FROM "PROJECT" P , "DEPARTMENT" d , "WORK_ON" w
	WHERE P."Pnumber" = w."Pno" AND P."Dnum" = d."Dnumber"
	GROUP BY P."Pname" , d."Dname" ;
-- แบบ 2 
CREATE VIEW assignment_c1 AS
	SELECT P."Pname" as "Product_name",
		   D."Dname" as "Departure_name",
		  (select COUNT(*) from "WORK_ON" W1
			where W1."Pno" = P."Pnumber") as Number_of_employee, 
		  (select SUM(W2."Hours") from "WORK_ON" W2
			where W2."Pno" = P."Pnumber" 
			group by W2."Pno") as Total_Hours
	FROM "PROJECT" P, "DEPARTMENT" D
	WHERE P."Dnum" = D."Dnumber" ;
	
-- Drop view
DROP VIEW assignment_c;
DROP VIEW assignment_c1;
-- check data in view
SELECT * FROM assignment_c ; 
SELECT * FROM assignment_c1 ; 

-- ข้อ d
CREATE VIEW assignment_d AS
	SELECT P."Pname" as "Product_name",
		   D."Dname" as "Departure_name",
		  (select COUNT(*) from "WORK_ON" W1
			where W1."Pno" = P."Pnumber") as Number_of_employee, 
		  (select SUM(W2."Hours") from "WORK_ON" W2
			where W2."Pno" = P."Pnumber" 
			group by W2."Pno") as Total_Hours
	FROM "PROJECT" P, "DEPARTMENT" D
	WHERE P."Dnum" = D."Dnumber" AND (SELECT COUNT(*) FROM "WORK_ON" W3
					  WHERE P."Pnumber" = W3."Pno"
					  GROUP BY W3."Pno") > 1 ;

-- Drop view
DROP VIEW assignment_d;
-- check data in view
SELECT * FROM assignment_d ; 