
-- Q31 All employees ordered by Their salary in ascending order
select * from Employee order by salary ASC;

-- Q32 All employees ordered by Their age in descending order
select * from Employee order by age DESC;

-- Q33 All Employees ordered by their hire date in ascending order
select * from Employee order by hire_date ASC;

-- Q34 All Employees ordered by their department and then by their salary
select * from Employee order by department_id,salary;


-- Q35 Departments ordered by the total salary of their employees
select d.name, sum(e.salary) as total_salary
from Department d
join Employee e
on d.department_id = e.department_id
group by d.name
order by total_salary;


-- Q36 get employee names with their department names
select e.name, d.name
from Employee e
join Department d
on e.department_id = d.department_id;


-- Q37  project names with their department names
select p.name, d.name
from Project p
join Department d
on p.department_id = d.department_id;


-- Q38 employee names with project names (via department)
select e.name, p.name
from Employee e
join Project p
on e.department_id = p.department_id;


-- Q39   employees and their departments (even if no department)
select e.name, d.name
from Employee e
left join Department d
on e.department_id = d.department_id;


-- Q40  all departments and their employees (even if no employees)
select d.name, e.name
from Department d
left join Employee e
on d.department_id = e.department_id;


-- Q41  employees who are not linked to any project
select e.name
from Employee e
left join Project p
on e.department_id = p.department_id
where p.project_id is null;


-- Q42 count how many projects each employee's department has
select e.name, count(p.project_id) as project_count
from Employee e
join Project p
on e.department_id = p.department_id
group by e.name;


-- Q43 find departments that have no employees
select d.name
from Department d
left join Employee e
on d.department_id = e.department_id
where e.emp_id is null;


-- Q44 find employees who are in the same department as john doe
select name
from Employee
where department_id = (
    select department_id
    from Employee
    where name = 'john doe');


-- Q45 find department with highest average salary
select d.name
from Department d
join Employee e
on d.department_id = e.department_id
group by d.name
order by avg(e.salary) desc
limit 1;


-- 46. find employee(s) with highest salary
select *
from Employee
where salary = (select max(salary) from Employee);


-- 47. find employees earning more than average salary
select *
from Employee
where salary > (select avg(salary) from Employee);


-- 48. find second highest salary
select max(salary)
from Employee
where salary < (select max(salary) from Employee);


-- 49. find department with most employees
select department_id
from Employee
group by department_id
order by count(*) desc
limit 1;


-- 50. find employees earning more than their department average
select *
from Employee e
where salary > (
    select avg(salary)
    from Employee
    where department_id = e.department_id);
    
    
-- 51. find 3rd highest salary
select distinct salary
from Employee
order by salary desc
limit 2, 1;
    
    
-- 52. find employees older than all employees in hr department
select *
from Employee
where age > all (
    select age
    from Employee e
    join Department d
    on e.department_id = d.department_id
    where d.name = 'hr');


-- 53. find departments where average salary > 55000
select d.name
from Department d
join Employee e
on d.department_id = e.department_id
group by d.name
having avg(e.salary) > 55000;


-- 54. find employees working in departments with at least 2 projects
select *
from Employee
where department_id in (
    select department_id
    from Project
    group by department_id
    having count(*) >= 2);
    
    
-- 55. find employees hired on same date as jane smith
select *
from Employee
where hire_date = (
    select hire_date
    from Employee
    where name = 'jane smith');


-- 56. total salary of employees hired in the year 2020
select sum(salary) as total_salary
from Employee
where year(hire_date) = 2020;


-- 57. average salary of employees in each department, ordered descending
select department_id, avg(salary) as avg_salary
from Employee
group by department_id
order by avg_salary desc;


-- 58. departments with more than 1 employee and avg salary > 55000
select department_id
from Employee
group by department_id
having count(*) > 1 and avg(salary) > 55000;


-- 59. employees hired in the last 2 years, ordered by hire date
select *
from Employee
where hire_date >= date_sub(curdate(), interval 2 year)
order by hire_date;


-- 60. total employees and avg salary for departments with more than 2 employees
select department_id, count(*) as total_employees, avg(salary) as avg_salary
from Employee
group by department_id
having count(*) > 2;


-- 61. names and salary of employees earning above their department average
select name, salary
from Employee e
where salary > (
    select avg(salary)
    from Employee
    where department_id = e.department_id);


-- 62. employees hired on same date as the oldest employee (earliest hire_date)
select name
from Employee
where hire_date = (
    select min(hire_date)
    from Employee);


-- 63. department names with total number of projects, ordered by project count
select d.name, count(p.project_id) as project_count
from Department d
left join Project p
on d.department_id = p.department_id
group by d.name
order by project_count desc;


-- 64. employee name with highest salary in each department
select name, department_id, salary
from Employee e1
where salary = (
    select max(salary)
    from Employee e2
    where e2.department_id = e1.department_id);


-- 65. names and salaries of employees older than department average age
select name, salary
from Employee e
where age > (
    select avg(age)
    from Employee
    where department_id = e.department_id);
