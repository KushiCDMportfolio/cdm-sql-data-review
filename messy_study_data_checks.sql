/* ==========================================================
   PROJECT : The Messy Study - Mock CDM SQL Data Review
   AUTHOR  : Kushi
   TOOL    : DB Browser for SQLite
   PURPOSE : Practice SQL data-review checks (edit checks and
             reconciliation logic) on a small fake clinical dataset.
   NOTE    : All data is fictional and created for learning.
   ========================================================== */


/* ---------- PART A: SET UP THE TABLES ---------- */

CREATE TABLE subjects (
    subject_id   TEXT,
    site_id      TEXT,
    sex          TEXT,
    age          INTEGER,
    consent_date TEXT
);

CREATE TABLE vitals (
    vital_id   INTEGER,
    subject_id TEXT,
    visit      TEXT,
    visit_date TEXT,
    sbp        INTEGER,
    dbp        INTEGER,
    pulse      INTEGER
);

INSERT INTO subjects VALUES
('S001','Site01','F',34,'2025-01-10'),
('S002','Site01','M',45,'2025-01-12'),
('S003','Site02','F',29,'2025-01-15'),
('S004','Site02','M',52,'2025-01-18'),
('S005','Site03','F',61,'2025-01-20'),
('S006','Site03','M',38,'2025-01-22'),
('S007','Site01','F',47,'2025-01-25'),
('S008','Site02','M',210,'2025-01-27');

INSERT INTO vitals VALUES
(1,'S001','Baseline','2025-01-10',118,76,72),
(2,'S001','Week4','2025-02-07',122,80,70),
(3,'S002','Baseline','2025-01-12',130,85,78),
(4,'S003','Baseline','2025-01-15',115,72,68),
(5,'S003','Baseline','2025-01-15',116,73,69),
(6,'S004','Baseline','2025-01-18',300,90,80),
(7,'S005','Baseline','2025-01-20',NULL,88,75),
(8,'S006','Baseline','2025-01-20',125,82,74),
(9,'S008','Baseline','2025-01-27',120,78,71);


/* ---------- PART B: DATA REVIEW CHECKS ---------- */

/* CHECK 1: Age out of plausible range (below 18 or above 100)
   Type: range check | Expected finding: S008 (age 210) */
SELECT subject_id, site_id, age
FROM subjects
WHERE age < 18 OR age > 100;


/* CHECK 2: Systolic BP out of plausible range (below 60 or above 250)
   Type: range check | Expected finding: S004 (SBP 300) */
SELECT subject_id, visit, visit_date, sbp
FROM vitals
WHERE sbp < 60 OR sbp > 250;


/* CHECK 3: Missing systolic BP value
   Type: missing data check | Expected finding: S005 Baseline */
SELECT subject_id, visit, visit_date
FROM vitals
WHERE sbp IS NULL;


/* CHECK 4: Visit date earlier than informed consent date
   Type: cross-table date check | Expected finding: S006 */
SELECT s.subject_id, s.consent_date, v.visit, v.visit_date
FROM subjects s
INNER JOIN vitals v
    ON s.subject_id = v.subject_id
WHERE v.visit_date < s.consent_date;


/* CHECK 5: Duplicate records (same subject and visit more than once)
   Type: duplicate check | Expected finding: S003 Baseline (2 records) */
SELECT subject_id, visit, COUNT(*) AS record_count
FROM vitals
GROUP BY subject_id, visit
HAVING COUNT(*) > 1;


/* CHECK 6: Enrolled subjects with no vitals data at all
   Type: completeness check | Expected finding: S007 */
SELECT s.subject_id, s.site_id
FROM subjects s
LEFT JOIN vitals v
    ON s.subject_id = v.subject_id
WHERE v.subject_id IS NULL;


/* ---------- PART C: STUDY SUMMARY ---------- */

/* Number of subjects per site | Expected: Site01=3, Site02=3, Site03=2 */
SELECT site_id, COUNT(*) AS subject_count
FROM subjects
GROUP BY site_id
ORDER BY site_id;
