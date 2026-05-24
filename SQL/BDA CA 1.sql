CREATE DATABASE Ireflix;
USE Ireflix;
-- ●	Identify and implement relationships between tables using Primary Keys (PKs)
--  and Foreign Keys (FKs) to maintain data integrity.
SELECT dm.emp_no,
e.first_name,
e.last_name,
e.hire_date,
dm.dept_no
FROM dept_manager As dm
INNER JOIN employees AS e ON dm.emp_no= e.emp_no;