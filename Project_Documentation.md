# Project Documentation
## Hospital Analytics & Operations Performance

## 1. Introduction

The Hospital Analytics & Operations Performance project uses a relational hospital dataset to support structured data preparation and operational reporting. MySQL is used to create the database, inspect and clean records, and validate data quality. Microsoft Power BI is used to explore the prepared data in a report.

## 2. Objectives

- Organize hospital data in a relational database.
- Identify data-quality issues before analysis.
- Apply documented cleaning and standardization rules.
- Validate identifiers, relationships, dates, numeric values and business rules.
- Make the prepared data available for interactive reporting in Power BI.
- Present the project in a reproducible and understandable repository.

## 3. Tools

| Tool | Role |
|---|---|
| MySQL | Database creation, querying, cleaning and validation |
| MySQL Workbench | SQL development and database inspection |
| Power BI Desktop | Data model and interactive report |
| Git/GitHub | Version control and portfolio publication |

## 4. Data Model

The SQL script defines eight entities:

- **departments:** `department_id` (primary key), department name/type and floor.
- **doctors:** `doctor_id` (primary key), department reference, name, specialization, experience and shift.
- **patients:** `patient_id` (primary key), name, age, gender, city, registration date and patient type.
- **appointments:** `appointment_id` (primary key), patient and doctor references, date/time, type, status and scheduled duration.
- **visits:** `visit_id` (primary key), patient, doctor and department references, visit date, check-in and consultation timestamps, and visit type.
- **admissions:** `admission_id` (primary key), patient and department references, admission/discharge dates, admission type, bed type and length of stay.
- **treatments:** `treatment_id` (primary key), patient, doctor and department references, date, type, status and cost.
- **billing:** `bill_id` (primary key), patient, optional admission and treatment references, bill date, service type, total/insurance/patient amounts and payment status.

Foreign keys are used to connect transactional records with their related patient, doctor, department, admission or treatment records. See the `CREATE TABLE` statements in the SQL script for the implemented constraints.

## 5. Workflow

### 5.1 Database and schema setup
The script creates and selects `hospital_analysis`, then defines the tables and their keys. It also includes table inspection commands such as `DESC` and `SHOW TABLES`.

### 5.2 Data loading and profiling
The script includes a `LOAD DATA LOCAL INFILE` example for appointments, plus row-count queries and sample previews. The local CSV path must be changed to match the user's environment.

### 5.3 Data cleaning
The SQL script demonstrates:
- Converting blank strings to `NULL` before treating missing values.
- Replacing selected missing categorical values with `Unknown`.
- Trimming leading/trailing whitespace.
- Normalizing selected text values and correcting known special-character variants.
- Checking ID formats and invalid numeric ranges.
- Removing selected invalid records and dependent records where the script's logic calls for it.

These operations are dataset-specific. A correction such as assigning a default value or deleting a row should be supported by the data owner's rules and should be reviewed before reuse.

### 5.4 Data validation
The script checks:
- Duplicate primary-key values and exact duplicate rows.
- Empty strings and whitespace.
- Unexpected category values.
- Foreign-key orphans through `LEFT JOIN` checks.
- Numeric ranges for age, experience, floor, scheduled duration, length of stay and costs.
- Date validity and future dates.
- Discharge dates earlier than admission dates.
- Length of stay against `DATEDIFF(discharge_date, admission_date)`.
- Billing arithmetic, including whether the total equals the insurance amount plus the patient amount.

### 5.5 Power BI reporting
The supplied `hospital.pbix` is the report artifact. Open it in Power BI Desktop, configure its data source, check relationships and measures, and refresh it before sharing screenshots or reporting results. The exact visual titles, KPI formulas and final findings should be copied from the verified report rather than assumed from the SQL schema.

## 6. Key SQL Concepts Demonstrated

- DDL: `CREATE DATABASE`, `CREATE TABLE`
- DML: `SELECT`, `INSERT`/data loading, `UPDATE`, `DELETE`
- Constraints: primary keys and foreign keys
- Filtering: `WHERE`, `IS NULL`, `TRIM`, `REGEXP`
- Aggregation: `COUNT`, `SUM`, `GROUP BY`, `HAVING`
- Joins: `LEFT JOIN`
- Subqueries and derived tables
- Set operations: `UNION ALL`
- Date functions: `CURRENT_DATE`, `DATE_FORMAT`, `DATEDIFF`
- Transactions: `START TRANSACTION`, `COMMIT`
- Database inspection: `DESC`, `SHOW TABLES`, server-variable checks

## 7. Reproduction and Safety

1. Use a copy of the database or restore from a backup before running the script.
2. Confirm that the CSV files are authorized for use and that the local paths are correct.
3. Review all statements that modify or delete data.
4. Execute the script in sections, inspecting results after each section.
5. Confirm the final row counts and rerun validation queries.
6. Refresh the PBIX against the intended data source and confirm that its visuals are populated.

The script includes environment-specific and data-specific statements; it should not be treated as a generic migration script without review.

## 8. Privacy and Data Governance

Only synthetic, anonymized or explicitly authorized data should be included in a public repository. Remove patient names, direct identifiers, contact information, medical details and other confidential information from source files, screenshots, exports and report pages before publication.

## 9. Deliverables

- MySQL SQL script
- Power BI report (`.pbix`)
- Project README
- Project documentation
- Data dictionary
- Optional dashboard screenshots and license

## 10. Future Improvements

- Separate schema creation, data loading, cleaning, validation and analysis into independent SQL scripts.
- Parameterize data file paths and document database prerequisites.
- Add a repeatable validation summary with expected outcomes.
- Document each Power BI measure, relationship and report page.
- Add sanitized dashboard screenshots and verified project findings.
