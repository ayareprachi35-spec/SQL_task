




CREATE TABLE employee(emp_id INT NOT NULL ,
	fisrt_name VARCHAR(50),
	last_name VARCHAR(50),
	dep_ID INT
);
CREATE TABLE departments(dept_id INT NOT NULL,
	Dept_name VARCHAR(20),
    Skills_id INT );
    
    
CREATE TABLE Sklills(skills_id INT NOT NULL,
	Skills_name VARCHAR(50));
    
    
ALTER TABLE employee
RENAME COLUMN fisrt_name to first_name;
      

INSERT INTO employee(emp_id, first_name, last_name, dep_ID)
VALUES
	(1, 'RAHUL', 'SAWANT', 301),
	(2, 'KARAN', 'RANE', 302),
	(3, 'SANIKA', 'CHAVAN', 303),
	(4, 'SAMITA', 'SHINDE', 301),
	(5, 'SARTHI', 'SUTAR', 302),
	(6, 'OMISHA', 'GUPTA', 304),
	(7, 'OMKAR', 'MISHRA', 306),
	(8, 'SAGAR', 'RAISE', 305),
	(9, 'SUMIT', 'PAL', 305),
	(10, 'ROHAN', 'JAISWAR', 302);


select * from employee;

INSERT INTO departments(dept_id,Dept_name,Skills_id)
VALUES
	(301,'HR',1),
    (302,'SALES',3),
    (303,'MARKETING',1),
    (304,'FINANCE',4),
    (305,'IT',2),
    (306,'BUSINESS DEPARTMENT',1);
    
SELECT *FROM departments;

ALTER TABLE sklills
RENAME to skills;

select * from skills;

INSERT INTO skills(skills_id,skills_name)
VALUES(1,'COMMUNICATION'),
(2,'PYTHON'),
(3,'CRM'),
(4,'EXCEL');


select * from skills;


ALTER TABLE employee
ADD PRIMARY KEY(emp_id);
ALTER TABLE departments
ADD PRIMARY KEY(dept_id);
ALTER TABLE skills
ADD PRIMARY KEY(skills_id);
ALTER TABLE employee
RENAME column dep_ID TO dept_id;

SELECT CONCAT(first_name, ' ', last_name) AS employee_name,
dept_name
FROM employee e
INNER JOIN departments d
ON e.dept_id=d.dept_id;


select dept_name,count(e.emp_id) AS employee_count
	FROM departments d
LEFT JOIN employee e 
ON d.dept_id=e.dept_id
GROUP BY d.dept_name;


SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    s.skills_name AS skills
FROM employee e
JOIN departments d
    ON e.dept_id = d.dept_id
JOIN skills s
    ON d.skills_id = s.skills_id;
    
    
    
CREATE TABLE Mapping (
    id INT NOT NULL,
    emp_id INT NOT NULL,
    skills_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (skills_id) REFERENCES skills(skills_id)
);

DROP TABLE Mapping;

SELECT *FROM Mapping;

INSERT INTO Mapping(id,emp_id,skills_id)
VALUES(1,1,4),
(2,2,3),
(3,1,2),
(4,3,1),
(5,4,1),
(6,4,3);

INSERT INTO Mapping(id,emp_id,skills_id)
VALUES(7,5,2),
(8,6,1),
(9,7,2),
(10,8,3),
(11,9,2),
(12,10,3),
(13,10,1);


SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(m.skills_id) AS skill_count
FROM employee e
LEFT JOIN Mapping m
    ON e.emp_id = m.emp_id
GROUP BY e.emp_id, e.first_name, e.last_name;


















