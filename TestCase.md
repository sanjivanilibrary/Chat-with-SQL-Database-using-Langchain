https://chatgpt.com/s/t_69b5583e4db48191b67d839b5fd2ceb2

Below are **10 complete test cases** for your **Chat AI → MySQL system**.
Each test case includes:

* **Natural language question**
* **Expected SQL query**
* **Expected answer**

These match the **school database script** you created earlier.

---

# Test Case 1

### Question

Which student scored the highest marks in the Midterm exam?

### Expected SQL

```sql
SELECT s.first_name, s.last_name, m.marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN exams e ON m.exam_id = e.exam_id
WHERE e.exam_name = 'Midterm'
ORDER BY m.marks DESC
LIMIT 1;
```

### Expected Answer

| first_name | last_name | marks |
| ---------- | --------- | ----- |
| Anjali     | Singh     | 92    |

---

# Test Case 2

### Question

Which students have pending fees?

### Expected SQL

```sql
SELECT s.first_name, s.last_name
FROM students s
JOIN fees f ON s.student_id = f.student_id
WHERE f.status = 'Pending';
```

### Expected Answer

| first_name | last_name |
| ---------- | --------- |
| Arjun      | Yadav     |
| Karan      | Mehta     |

---

# Test Case 3

### Question

List all books that are currently borrowed and not returned.

### Expected SQL

```sql
SELECT s.first_name, s.last_name, b.title
FROM borrow br
JOIN students s ON br.student_id = s.student_id
JOIN books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL;
```

### Expected Answer

| student     | book               |
| ----------- | ------------------ |
| Ravi Kumar  | Mathematics Basics |
| Arjun Yadav | English Grammar    |

---

# Test Case 4

### Question

What is the average marks scored in Math?

### Expected SQL

```sql
SELECT AVG(m.marks) AS avg_marks
FROM marks m
JOIN subjects s ON m.subject_id = s.subject_id
WHERE s.subject_name = 'Math';
```

### Expected Answer

```
78.8
```

---

# Test Case 5

### Question

How many students are in each class?

### Expected SQL

```sql
SELECT c.class_name, c.section, COUNT(s.student_id) AS total_students
FROM classes c
LEFT JOIN students s ON c.class_id = s.class_id
GROUP BY c.class_id;
```

### Expected Answer

| class | section | students |
| ----- | ------- | -------- |
| 10    | A       | 2        |
| 10    | B       | 1        |
| 9     | A       | 1        |
| 8     | A       | 1        |

---

# Test Case 6

### Question

Which teacher has the highest salary?

### Expected SQL

```sql
SELECT first_name, last_name, salary
FROM teachers
ORDER BY salary DESC
LIMIT 1;
```

### Expected Answer

| teacher    | salary |
| ---------- | ------ |
| Neha Gupta | 55000  |

---

# Test Case 7

### Question

List students who scored more than 80 marks in Math.

### Expected SQL

```sql
SELECT s.first_name, s.last_name, m.marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN subjects sub ON m.subject_id = sub.subject_id
WHERE sub.subject_name = 'Math'
AND m.marks > 80;
```

### Expected Answer

| student      | marks |
| ------------ | ----- |
| Ravi Kumar   | 85    |
| Anjali Singh | 92    |
| Sneha Patel  | 90    |

---

# Test Case 8

### Question

How many students are enrolled in the school?

### Expected SQL

```sql
SELECT COUNT(*) AS total_students
FROM students;
```

### Expected Answer

```
5
```

---

# Test Case 9

### Question

Which students borrowed books in February 2025?

### Expected SQL

```sql
SELECT s.first_name, s.last_name, b.title
FROM borrow br
JOIN students s ON br.student_id = s.student_id
JOIN books b ON br.book_id = b.book_id
WHERE MONTH(br.borrow_date) = 2
AND YEAR(br.borrow_date) = 2025;
```

### Expected Answer

| student     | book            |
| ----------- | --------------- |
| Arjun Yadav | English Grammar |

---

# Test Case 10

### Question

Show all teachers with their subject specialization.

### Expected SQL

```sql
SELECT first_name, last_name, subject_specialization
FROM teachers;
```

### Expected Answer

| teacher      | subject |
| ------------ | ------- |
| Rahul Sharma | Math    |
| Priya Singh  | Science |
| Amit Verma   | English |
| Neha Gupta   | History |

---

✅ These **10 test cases** test your AI for:

* **JOIN queries**
* **Filtering**
* **Aggregation**
* **Sorting**
* **Date filtering**
* **COUNT / AVG**
* **NULL conditions**

