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
![Check results 1](Screenshot%20%281%29.png)
![Check results 2](Screenshot%20%282%29.png)
![Check results 3](Screenshot%20%283%29.png)

## Tools
SQL (SQLite), DB Browser for SQLite

## Author
Kushi | B.Pharm | Aspiring Clinical Data Associate
