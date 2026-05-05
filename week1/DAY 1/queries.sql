Query SQL
-- Q1: Select all columns
SELECT * FROM Employee;

-- Q2: Select name and salary
SELECT name, salary FROM Employee;

-- Q3: Employees older than 30
SELECT * FROM Employee WHERE age > 30;

-- Q4: Department names
SELECT name FROM Department;

-- Q5: Employees in IT department
SELECT e.* FROM Employee e, Department d where e.department_id = d.department_id AND d.name = 'IT';

-- Q6: Select employees whose name starts with J
select * from Employee where name LIKE 'J%';

-- Q7: Select employees whose name start ends with e
select * from Employee where name LIKE '%e';

-- Q8: Select employee name whose names contains a
select * from Employee where name LIKE  '%a%';

-- Q9: Select employee whose names are exactly 9 chars long
select * from Employee where LENGTH(name)=9;

-- Q10: Employee whose name have second letter as o
 select * from Employee where name LIKE '_o%';
