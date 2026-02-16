
-- 1. SETUP THE DATABASE AND TABLES
SHOW databases;

CREATE DATABASE trigger_practice_db;

USE trigger_practice_db;

-- =========================================== 
-- =========================================== 

-- Table 1: Employees (Main Data)
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    salary DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'Active'
);

SELECT * FROM employees;


-- Table 2: Audit Logs (Tracking Changes)
CREATE TABLE audit_logs(
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    action_type VARCHAR(20),					 -- INSERT, UPDATE, DELETE
    emp_id INT,
    old_value TEXT, new_value TEXT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM audit_logs;

-- ==================================================
-- ==================================================

-- 2. INSERT TRIGGERS

-- BEFORE INSERT: Data Cleaning
DELIMITER //
CREATE TRIGGER trg_emp_before_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	SET NEW.email = LOWER(NEW.email);
    IF NEW.salary < 0 THEN SET NEW.salary = 0; END IF;
END //
DELIMITER ;

-- Add a user (Check logs and lowercase email)
INSERT INTO employees (name, email, salary) VALUES ('ALICE SMITH', 'Alice@Work.com', 4000);

INSERT INTO employees (name, email, salary) VALUES
	('Bob Johnson', 'BOB@Email.com', 5000),  -- normal insert
	('Carol Lee', 'Carol@Work.com', -1000)   -- negative salary, should auto-correct to 0
;

select * from employees;

















