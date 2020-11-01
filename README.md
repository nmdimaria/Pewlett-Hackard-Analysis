# Pewlett-Hackard-Analysis

## Overview

The "Silver Tsunami" is-a-comin' and Pewlett Hackard needs to be prepared. We will break down the retiring employees by job title to see where PH needs to focus it's hiring efforts and figure out how we can impliment it's proposed mentorship program to keep some retirees on part-time payroll.

## Results

- [retirement_titles](Data/retirement_titles.csv) shows a list of every employee retiring and the titles they've held while at the company
- [unique_titles](Data/unique_titles.csv) eliminates duplicate employees and just shows their current/most recent job title
- [retiring_titles](Data/retiring_titles.csv) shows the number of employees retiring from each job title 
- [mentorship_eligibility](Data/mentorship_eligibility.csv) shows which current employees are eligible to participate in a mentorship program for new hires

## Summary

`SELECT COUNT (emp_no), dept_name`
`INTO dept_info_count`
`FROM dept_info`
`GROUP BY dept_name;`

`SELECT COUNT (me.emp_no), d.dept_name
INTO mentor_dept_count
FROM mentorship_eligibility as me
JOIN dept_employees as de
on me.emp_no = de.emp_no
JOIN "Departments" as d
on de.dept_no = d.dept_no
GROUP BY d.dept_name;`
