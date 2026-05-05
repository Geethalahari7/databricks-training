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
