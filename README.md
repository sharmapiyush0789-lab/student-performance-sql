# 🎓 Student Performance SQL Project

A beginner-friendly SQL portfolio project that analyses student scores across
three subjects — Math, Science, and English — using a structured relational database.

---

## 📁 Project Structure

```
student-performance-sql/
├── README.md       ← You are here
├── schema.sql      ← CREATE TABLE + 30 INSERT statements
├── queries.sql     ← 12 business queries with comments
└── students.csv    ← Sample dataset (importable into any tool)
```

---

## 🗃️ Schema Design

```sql
CREATE TABLE students (
    student_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    name        VARCHAR(100) NOT NULL,
    subject     VARCHAR(50)  NOT NULL,
    score       INTEGER      NOT NULL CHECK (score BETWEEN 0 AND 100),
    grade       VARCHAR(2)   -- Computed: A / B / C / D / F
);
```

**Grade Scale:**

| Score Range | Grade |
|-------------|-------|
| 90 – 100    | A     |
| 80 – 89     | B     |
| 70 – 79     | C     |
| 60 – 69     | D     |
| Below 60    | F     |

---

## ❓ Business Questions Answered

| # | Question | Query |
|---|----------|-------|
| 1 | View all students with computed grades | Q1 |
| 2 | Who are the top 5 performers overall? | Q2 |
| 3 | Which subject has the highest average score? | Q3 |
| 4 | How many students earned each grade? | Q4 |
| 5 | Which students failed (score < 60)? | Q5 |
| 6 | Which students scored an A (≥ 90)? | Q6 |
| 7 | Who ranked highest in each subject? | Q8 |
| 8 | Which student has the best overall average? | Q9 |
| 9 | Which subjects average above 75? | Q10 |
| 10 | How does each student rank within their subject? | Q11 |
| 11 | Who scored above the class average? | Q12 |

---

## 📊 Key Findings

- **Highest scorer:** Priya Patel — English (95) and Arjun Bose — Math (96)
- **Best subject average:** Math edges ahead due to fewer failing scores
- **Most students at risk:** 5 students scored below 60 (grade F)
- **Most well-rounded student:** Aarav Sharma — consistent B/A scores across all subjects

---

## 🚀 How to Run

### Option A — SQLite (Recommended for beginners)
```bash
# Install SQLite (usually pre-installed on Mac/Linux)
sqlite3 school.db

# Inside the SQLite shell:
.read schema.sql
.read queries.sql
```

### Option B — DB Browser for SQLite (GUI, no coding)
1. Download from https://sqlitebrowser.org
2. Open → New Database → name it `school.db`
3. Go to **Execute SQL** tab
4. Paste and run `schema.sql`, then `queries.sql`

### Option C — Online (No install needed)
1. Go to https://sqliteonline.com
2. Paste `schema.sql` → Run
3. Paste any query from `queries.sql` → Run

---

## 🛠️ SQL Concepts Used

- `CREATE TABLE` with constraints (`PRIMARY KEY`, `CHECK`, `NOT NULL`)
- `INSERT INTO` for populating data
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- `GROUP BY`, `HAVING`, `AVG`, `MAX`, `MIN`, `COUNT`
- `CASE WHEN` for computed grade labels
- `RANK() OVER (PARTITION BY ...)` window function
- Subqueries with `IN` and scalar `SELECT`

---

## 👤 Author

Built as a SQL portfolio project to demonstrate schema design,
data querying, and analytical thinking using real-world style data.

---

## 📄 License

MIT — free to use, modify, and share.
