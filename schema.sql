-- ============================================
-- Student Performance Database
-- Schema: CREATE TABLE + INSERT sample data
-- ============================================

-- Step 1: Create the students table
CREATE TABLE students (
    student_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name         VARCHAR(100) NOT NULL,
    subject      VARCHAR(50)  NOT NULL,
    score        INTEGER      NOT NULL CHECK (score BETWEEN 0 AND 100),
    grade        VARCHAR(2)   GENERATED ALWAYS AS (
                     CASE
                         WHEN score >= 90 THEN 'A'
                         WHEN score >= 80 THEN 'B'
                         WHEN score >= 70 THEN 'C'
                         WHEN score >= 60 THEN 'D'
                         ELSE 'F'
                     END
                 ) VIRTUAL
);

-- ============================================
-- Step 2: Insert 30 sample student records
-- ============================================

INSERT INTO students (name, subject, score) VALUES
-- Math scores
('Aarav Sharma',    'Math',    92),
('Priya Patel',     'Math',    85),
('Rohan Mehta',     'Math',    73),
('Sneha Iyer',      'Math',    61),
('Karan Gupta',     'Math',    55),
('Anjali Singh',    'Math',    88),
('Vikram Nair',     'Math',    47),
('Divya Reddy',     'Math',    79),
('Arjun Bose',      'Math',    96),
('Meera Joshi',     'Math',    68),

-- Science scores
('Aarav Sharma',    'Science', 88),
('Priya Patel',     'Science', 91),
('Rohan Mehta',     'Science', 65),
('Sneha Iyer',      'Science', 77),
('Karan Gupta',     'Science', 82),
('Anjali Singh',    'Science', 54),
('Vikram Nair',     'Science', 93),
('Divya Reddy',     'Science', 70),
('Arjun Bose',      'Science', 60),
('Meera Joshi',     'Science', 87),

-- English scores
('Aarav Sharma',    'English', 76),
('Priya Patel',     'English', 95),
('Rohan Mehta',     'English', 83),
('Sneha Iyer',      'English', 90),
('Karan Gupta',     'English', 72),
('Anjali Singh',    'English', 66),
('Vikram Nair',     'English', 81),
('Divya Reddy',     'English', 58),
('Arjun Bose',      'English', 74),
('Meera Joshi',     'English', 49);
