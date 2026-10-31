# Mock CDM SQL Data Review

A beginner project that shows how SQL is used in Clinical Data Management
to find data quality issues. The dataset is fictional and built for practice.

## What this project covers
- Built a small database with `subjects` and `vitals` tables
- Wrote 6 SQL data review checks (the SQL version of edit checks)
- Documented the findings in a Data Review Report with proposed site queries

## Checks performed
| # | Check type | SQL concept used |
|---|-----------|------------------|
| 1 | Age range check | WHERE, OR |
| 2 | Systolic BP range check | WHERE, OR |
| 3 | Missing data check | IS NULL |
| 4 | Visit before consent date | INNER JOIN |
| 5 | Duplicate records | GROUP BY, HAVING |
| 6 | Subjects with no vitals data | LEFT JOIN |

## Files
- `messy_study_data_checks.sql`: table setup and all 6 checks
- `Data Review Report.pdf`: findings and proposed queries to the site
- `Screenshot (1).png` to `Screenshot (3).png`: query results in DB Browser for SQLite

## Sample results
<img width="1366" height="726" alt="Screenshot SQL 1" src="https://github.com/user-attachments/assets/d873805c-5583-45ea-bdcc-b5026cb0023b" />
<img width="1366" height="723" alt="Screenshot SQL 2" src="https://github.com/user-attachments/assets/8e078f3b-83f2-4cdd-a65f-0f4a84e725dc" />
<img width="1366" height="726" alt="Screenshot SQL 3" src="https://github.com/user-attachments/assets/254b2897-c841-42d7-93a9-c510a96704c5" />

## Tools
SQL (SQLite), DB Browser for SQLite

## Author
Kushi | B.Pharm | Aspiring Clinical Data Associate
