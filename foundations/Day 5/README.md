# Day 5 – SQL JOINs

Today we learned about **SQL JOINs** to combine data from multiple tables using a common column.

SQL JOINs help you extract related information from different tables using a shared key.

---

## 🔹 What you learned today

### INNER JOIN
- Returns only records that exist in **both tables**
- Used when you only want matching rows

### LEFT JOIN
- Returns **all records from the left table**
- Includes matching records from the right table (or NULL if no match)

### RIGHT JOIN
- Returns **all records from the right table**
- Includes matching records from the left table (or NULL if no match)

### FULL OUTER JOIN (using UNION)
- MySQL doesn’t support FULL JOIN directly
- You can simulate it using `LEFT JOIN` + `RIGHT JOIN` with `UNION`

---


## 🔹 Real practice
You joined the `students` table with `student_activities` to:
- Join students with their activities
- Find students with no activities
- Find activities without students
- Use UNION to simulate FULL OUTER JOIN
- Use JOIN with GROUP BY and HAVING

---


## ▶ How to Run

Make sure you are using the correct database before running the queries:

```sql
use student_db;
