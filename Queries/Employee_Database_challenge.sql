

-- Delivery 1 
-- create new table for retirement titles 
SELECT e.first_name,
	e.last_name,
	e.emp_no,
	t.title, 
	t.from_date,
	t.to_date	
INTO retirement_titles
FROM employees as e
LEFT JOIN title as t 
ON e.emp_no = t.emp_no 
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT * 
FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles 
FROM retirement_titles 
WHERE to_date ='9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT* 
FROM unique_titles; 
-- retiring titles table 
SELECT count(title), title
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY count(title) DESC;

SELECT* 
FROM retiring_titles; 

-- Delivery 2
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date, 
	de.from_date, 
	de.to_date, 
	t.title 
INTO mentorhsip_eligibility 
FROM employees as e 
LEFT JOIN dep_emp as de 
ON e.emp_no =de.emp_no 
LEFT JOIN title as t 
ON e.emp_no =t.emp_no 
WHERE (de.to_date = '9999-01-01')
	 AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no; 

SELECT * 
FROM mentorhsip_eligibility;

--additional queries 
SELECT count(title), title 
INTO mentor_titles 
FROM mentorhsip_eligibility  
GROUP BY title
ORDER BY count(title) DESC;  

SELECT * 
FROM mentor_titles; 

SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date, 
	de.from_date, 
	de.to_date, 
	t.title 
INTO unpdate_eligibility 
FROM employees as e 
LEFT JOIN dep_emp as de 
ON e.emp_no =de.emp_no 
LEFT JOIN title as t 
ON e.emp_no =t.emp_no 
WHERE (de.to_date = '9999-01-01')
	 AND (e.birth_date BETWEEN '1964-01-01' AND '1965-12-31')
ORDER BY e.emp_no; 

SELECT * 
FROM unpdate_eligibility;

