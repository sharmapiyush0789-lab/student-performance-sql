-- ============================================
-- Student Performance — 12 Business Queries
-- ============================================


-- Q1: View all students with their grade
-- PURPOSE: Get a full picture of the dataset
SELECT student_id, name, subject, score,
       CASE
           WHEN score >= 90 THEN 'A'
           WHEN score >= 80 THEN 'B'
           WHEN score >= 70 THEN 'C'
           WHEN score >= 60 THEN 'D'
           ELSE 'F'
       END AS grade
FROM students
ORDER BY score DESC;


-- Q2: Top 5 performers overall
-- PURPOSE: Identify the highest-scoring students across all subjects
SELECT name, subject, score
FROM students
ORDER BY score DESC
LIMIT 5;


-- Q3: Average score per subject
-- PURPOSE: Compare difficulty or engagement across subjects
SELECT subject,
       ROUND(AVG(score), 2) AS avg_score,
       MAX(score)            AS top_score,
       MIN(score)            AS lowest_score
FROM students
GROUP BY subject
ORDER BY avg_score DESC;


-- Q4: Count of students per grade (A / B / C / D / F)
-- PURPOSE: Understand grade distribution across all subjects
SELECT
    CASE
        WHEN score >= 90 THEN 'A'
        WHEN score >= 80 THEN 'B'
        WHEN score >= 70 THEN 'C'
        WHEN score >= 60 THEN 'D'
        ELSE 'F'
    END AS grade,
    COUNT(*) AS total_students
FROM students
GROUP BY grade
ORDER BY grade;


-- Q5: Students who failed (score < 60)
-- PURPOSE: Flag students who need academic support
SELECT name, subject, score
FROM students
WHERE score < 60
ORDER BY score ASC;


-- Q6: Filter — students who scored an A (>= 90)
-- PURPOSE: Recognise and reward high achievers
SELECT name, subject, score
FROM students
WHERE score >= 90
ORDER BY score DESC;


-- Q7: Sort all students by subject, then score descending
-- PURPOSE: Compare performance within each subject
SELECT name, subject, score
FROM students
ORDER BY subject ASC, score DESC;


-- Q8: Top scorer in each subject
-- PURPOSE: Find the subject champion for each class
SELECT subject, name, score
FROM students
WHERE (subject, score) IN (
    SELECT subject, MAX(score)
    FROM students
    GROUP BY subject
)
ORDER BY subject;


-- Q9: Each student's average score across all subjects
-- PURPOSE: Identify the most well-rounded students
SELECT name,
       ROUND(AVG(score), 2) AS avg_score,
       COUNT(subject)        AS subjects_taken
FROM students
GROUP BY name
ORDER BY avg_score DESC;


-- Q10: Subjects with average score above 75
-- PURPOSE: Identify stronger-performing subject areas
SELECT subject, ROUND(AVG(score), 2) AS avg_score
FROM students
GROUP BY subject
HAVING AVG(score) > 75
ORDER BY avg_score DESC;


-- Q11: Rank students within each subject
-- PURPOSE: Understand relative standing inside each class
SELECT name, subject, score,
       RANK() OVER (PARTITION BY subject ORDER BY score DESC) AS rank_in_subject
FROM students
ORDER BY subject, rank_in_subject;


-- Q12: Students who scored above the overall average
-- PURPOSE: Segment above-average performers using a subquery
SELECT name, subject, score
FROM students
WHERE score > (SELECT AVG(score) FROM students)
ORDER BY score DESC;
