-- ข้อ a
SELECT d."Dname" as "Department_name" ,
	   count(e."Dno") as "Number_Employee_in_Department"
FROM "EMPLOYEE" e
JOIN "DEPARTMENT" d ON d."Dnumber" = e."Dno"
GROUP BY d."Dname"
HAVING AVG("Salary") > 30000 ;


-- ข้อ b
SELECT	e."Sex" as "Gender",
		d."Dname" as "Department_name" ,
		count(e."Dno") as "Number_Male_Employee"
FROM "EMPLOYEE" e
JOIN "DEPARTMENT" d ON d."Dnumber" = e."Dno"
WHERE e."Sex" = 'M'AND e."Dno" IN (SELECT e."Dno" FROM "EMPLOYEE" e
								   GROUP BY e."Dno" 
								   HAVING AVG("Salary") > 30000 )
GROUP BY d."Dname" , e."Sex" ; 
/* can query */ 


