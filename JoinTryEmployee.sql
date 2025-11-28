create database try;

use try;

create table employee (
empid int primary key ,
name varchar(50) not null,
salary int ,
dept_id int not null);

insert into employee values
(1,"Sagar",50000,1),
(2,"Abhishek",25000,1),
(3,"Kartik",30000,2),
(4,"Vaibhav",35000,3),
(5,"Sakshi",20000,2);

create table dept (
id int primary key , 
name varchar(50) ,
price int );

insert into dept values
(1,"Data s",5000000),
(2,"Data A",3000000),
(3,"Web Dev",250000),
(4,"HR",200000);

select * from employee;

select * from dept;

-- 1=id , 1=name , 1=salary , 2=d_name 
select empid , employee.name , salary , dept.name from employee
join dept
on employee.dept_id = dept.id ;

insert into employee values
(6,"Shubham",40000,5);

insert into dept values
(5,"SQL Dev",600000);

alter table employee
add foreign key (dept_id) REFERENCES dept(id);

insert into employee values
(7,"Sahil",45000,6);



select empid , E.name , salary , dept_id , D.name , price 
from employee as E
right join dept as D
on e.dept_id = d.id;

select empid , E.name , salary , dept_id , D.name , price 
from employee as E
right join dept as D
on e.dept_id = d.id
where e.dept_id is null;

select d.name , count(e.empid)  from employee as e
join dept as d 
on e.dept_id = d.id 
group by d.name;

select empid , E.name , salary , dept_id , D.name , price 
from dept as d
 join employee as e
on e.dept_id = d.id
where d.name != "Data s";

-- select col1, col2 , col3 from table1
-- join table2 on table1.col1 = table2.col2 
-- join table3 on table2.col2=table3.col3;

-- 1. Retrieve all employees along with their department names
SELECT e.empid, e.name, e.salary, d.name AS department
FROM employee e
JOIN dept d ON e.dept_id = d.id;

-- 2. Find employees who work in the "IT" department
SELECT e.*
FROM employee e
JOIN dept d ON e.dept_id = d.id
WHERE d.name = 'IT';

-- 3. List employees along with their department locations
-- SELECT e.empid, e.name, d.location
-- FROM employee e
-- JOIN dept d ON e.dept_id = d.id;// no location column

-- 4. Retrieve the total number of employees in each department
SELECT d.name AS department, COUNT(e.empid) AS total_employees
FROM dept d
LEFT JOIN employee e ON d.id = e.dept_id
GROUP BY d.name;


-- 5. Find the highest-paid employee in each department
SELECT d.name AS department, e.name AS employee, e.salary
FROM employee e
JOIN dept d ON e.dept_id = d.id
WHERE e.salary = (
    SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id
);

-- 6. Display employees who joined after January 1, 2020, along with their department names
-- employee table has no DateOfJoining column.


-- 7. Show employees earning more than ₹70,000 and their respective departments
SELECT e.name, e.salary, d.name AS department
FROM employee e
JOIN dept d ON e.dept_id = d.id
WHERE e.salary > 70000;


-- 8. Retrieve employees working in the "Pune" office
-- dept table has NO location column.

-- 9. List employees along with department names in alphabetical order of department names
SELECT e.empid, e.name, d.name AS department
FROM employee e
JOIN dept d ON e.dept_id = d.id
ORDER BY d.name ASC;

-- 10. Find the average salary of employees in each department
SELECT d.name AS department, AVG(e.salary) AS avg_salary
FROM dept d
LEFT JOIN employee e ON d.id = e.dept_id
GROUP BY d.name;

-- 11. Show employees whose last names start with 'S' along with department names
SELECT e.name, d.name AS department
FROM employee e
JOIN dept d ON e.dept_id = d.id
WHERE e.name LIKE 'S%';

-- 12. Find the department with the most employees
SELECT d.name, COUNT(e.empid) AS total_employees
FROM dept d
LEFT JOIN employee e ON d.id = e.dept_id
GROUP BY d.name
ORDER BY total_employees DESC
LIMIT 1;

-- 13. Show employees who do not have a department assigned
SELECT *
FROM employee
WHERE dept_id NOT IN (SELECT id FROM dept);


-- 14. Retrieve employees sorted by salary in descending order along with their department names
SELECT e.empid, e.name, e.salary, d.name AS department
FROM employee e
JOIN dept d ON e.dept_id = d.id
ORDER BY e.salary DESC;

-- 15. List the employees with the same department as 'Amit Sharma'
SELECT e.*
FROM employee e
WHERE dept_id = (
    SELECT dept_id FROM employee WHERE name = 'Amit Sharma'
);

-- 16. List all employees along with their department names, including employees without a department.
SELECT e.empid, e.name, d.name AS department
FROM employee e
LEFT JOIN dept d ON e.dept_id = d.id;

-- 17. Retrieve all departments and the employees working in them, including departments with no employees.
SELECT *
FROM employee
WHERE dept_id NOT IN (SELECT id FROM dept);


-- 18. Find employees who do not belong to any department.
SELECT *
FROM employee
WHERE dept_id NOT IN (SELECT id FROM dept);

-- 19. List departments that have no employees assigned.
SELECT d.*
FROM dept d
LEFT JOIN employee e ON d.id = e.dept_id
WHERE e.empid IS NULL;

-- 20. Retrieve all employees and their department details, ensuring all departments are listed even if they have no employees.
SELECT d.id AS dept_id, d.name AS department, e.empid, e.name AS employee, e.salary
FROM dept d
LEFT JOIN employee e ON d.id = e.dept_id;
