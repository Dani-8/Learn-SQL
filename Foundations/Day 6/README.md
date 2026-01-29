# Day 6 – SQL Subqueries

On Day 6, we focused on **SQL Subqueries** — queries written **inside another query** to solve problems step by step.

Subqueries allow you to:
- Compare values against calculated results
- Filter data dynamically
- Perform complex logic in a clean and readable way

This is a **core skill** used heavily in real-world SQL.

---

## 🔹 What is a Subquery?

A **subquery** is a query nested inside another SQL query.

It is usually used when:
- A value must be calculated first
- The result of one query is required by another

Example use cases:
- Employees earning more than the company average
- Finding records based on max/min values
- Filtering data using grouped results

---

## 🔹 Topics Covered

### 2️⃣ Subqueries with Aggregate Functions
You used subqueries combined with:
- `AVG()`
- `MAX()`
- `MIN()`
- `GROUP BY`
- `HAVING`

These allowed you to make **dynamic comparisons** instead of hardcoding values.

---

### 1️⃣ Subqueries with SELECT
You practiced using subqueries inside `WHERE` clauses to:
- Find employees earning above the average salary
- Find employees with the maximum salary
- Compare salaries with a specific employee
- Filter employees based on city-level salary averages

---

### 3️⃣ Subqueries with INSERT
You created a new table and inserted data using a subquery:
- Copied table structure using `CREATE TABLE LIKE`
- Inserted only high-salary employees using a subquery

---

### 4️⃣ Subqueries with UPDATE
You updated employee salaries conditionally:
- Increased salary by 10% for employees below the company average
- Used nested subqueries to safely bypass MySQL restrictions

---

### 5️⃣ Subqueries with DELETE
You deleted employees based on calculated conditions:
- Removed employees earning below the average salary
- Used subqueries to preview data before deletion
- Safely handled MySQL Safe Update Mode

---

## ▶ How to Run

Make sure you are using the correct database before running queries:

```sql
use new_sql;
```
