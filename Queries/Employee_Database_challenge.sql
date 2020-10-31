--  DELIVERABLE 1

-- Creating retirement_titles.csv
SELECT e.emp_no, e.first_name, e.last_name, 
ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM titles as ti
LEFT JOIN employees as e
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Creating retiring_titles.csv
SELECT COUNT (emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT (emp_no) DESC;

-- Creating mentorship_eligibility.csv
SELECT DISTINCT ON (emp_no)
e.emp_no, e.first_name, e.last_name, e.birth_date,
de.from_date, de.to_date, ti.title
INTO mentorship_eligibilty
FROM employees as e
JOIN dept_employees as de
ON e.emp_no = de.emp_no
JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (de.to_date = '9999-01-01') and (e.birth_date between '1965-01-01' and '1965-12-31')
ORDER BY e.emp_no;