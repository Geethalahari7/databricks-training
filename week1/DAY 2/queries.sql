
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
