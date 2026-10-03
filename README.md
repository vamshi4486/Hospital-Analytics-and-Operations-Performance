# Hospital Analytics & Operations Performance

A data analytics project focused on exploring hospital operations using **MySQL** for database management, data cleaning, validation and analysis, and **Microsoft Power BI** for interactive reporting.

## Project Overview

This project organizes hospital-related data into a relational database and prepares it for operational analysis. The SQL work includes table creation, data-quality checks, cleaning updates, referential-integrity checks and business-rule validation. The Power BI report is provided as a `.pbix` file for interactive exploration.

> **Data note:** Use only synthetic, anonymized or otherwise authorized data in this public repository. Do not upload real patient-identifiable or confidential hospital information.

## Tools & Technologies

- **MySQL** — relational database, SQL transformations and data validation
- **Microsoft Power BI** — data modeling, measures and dashboard reporting
- **SQL** — DDL, DML, filtering, aggregation, joins, subqueries, constraints and transactions
- **Git & GitHub** — version control and project sharing

## Repository Structure

```text
Hospital-Analytics-and-Operations-Performance/
├── README.md
├── .gitignore
├── SQL/
│   └── hospital_analysis.sql
├── PowerBI/
│   ├── hospital.pbix
│   └── Screenshots/
└── Documentation/
    ├── Project_Documentation.md
    └── Data_Dictionary.md
```

## Database Design

The SQL script creates the `hospital_analysis` database and works with these eight tables:

| Table | Purpose |
|---|---|
| `departments` | Department names, types and floor details |
| `doctors` | Doctor profiles, department assignment, specialization, experience and shift |
| `patients` | Patient demographics, city, registration date and patient type |
| `appointments` | Scheduled appointments, type, status and duration |
| `visits` | Patient visits, assigned doctor/department and consultation timestamps |
| `admissions` | Admission and discharge details, bed type and length of stay |
| `treatments` | Treatment date, type, status, cost and related patient/doctor/department |
| `billing` | Bill dates, service type, amounts, insurance/patient portions and payment status |

Primary keys identify records, while foreign keys connect related entities and help enforce referential integrity.

## Project Workflow

1. **Database setup:** Create and select the `hospital_analysis` database.
2. **Schema creation:** Define tables, data types, primary keys and foreign-key constraints.
3. **Data loading:** Load source CSV data into the relevant tables (update file paths for your own machine).
4. **Initial profiling:** Inspect table structures, row counts and sample records.
5. **Data cleaning:** Check and address blanks, whitespace, unexpected characters, invalid IDs, invalid numeric values, dates and inconsistent categories.
6. **Data validation:** Check duplicates, foreign-key consistency, date sequences, length of stay and billing arithmetic.
7. **Reporting:** Open the Power BI `.pbix` report and refresh it using your own configured data source.
8. **Documentation:** Record the data model, cleaning approach, validation rules and limitations.

## Data Quality Checks Included

The SQL script contains checks and/or remediation examples for:

- Null, blank and whitespace-only values
- Leading/trailing spaces and unusual text characters
- ID format checks and duplicate detection
- Out-of-range numeric values (such as age, experience, duration and cost)
- Missing, zero or future dates and invalid admission/discharge sequence
- Invalid foreign-key references
- Length-of-stay consistency using `DATEDIFF`
- Billing consistency: `amount = insurance_amount + patient_amount`
- Unexpected or inconsistent category values

Cleaning rules may replace missing categories with `Unknown`, normalize selected category spellings, correct identified values, or remove invalid dependent records. Review the SQL carefully and run it against a **backup or disposable copy** first; some statements update or delete records.

## Getting Started

### Requirements

- MySQL Server and MySQL Workbench (or another MySQL client)
- Microsoft Power BI Desktop
- Git
- A local copy of the source dataset, if required for a refresh

### Run the SQL

1. Clone or download this repository.
2. Open `SQL/hospital_analysis.sql` in MySQL Workbench.
3. Review the script, especially `LOAD DATA LOCAL INFILE` paths, `TRUNCATE`, `UPDATE`, `DELETE`, transaction and foreign-key-check statements.
4. Back up your database before running any data-changing statements.
5. Configure MySQL local-infile settings only if your environment and security policy permit it.
6. Execute the script in logical sections and verify the results after each stage.

The SQL file may contain machine-specific CSV paths. Replace those paths with the location of your own authorized data files. The script is not necessarily a one-click, repeatable deployment script because it includes data-loading and data-cleaning operations intended for a particular workflow.

### Open the Power BI report

1. Open `PowerBI/hospital.pbix` in Power BI Desktop.
2. If prompted, configure the data source credentials and connection to your own MySQL database or authorized files.
3. Review table relationships and measures.
4. Refresh the report and verify that visuals load correctly.

The report's exact visual inventory and KPI definitions should be documented from the final saved PBIX after confirming them in Power BI Desktop.

## Results

The repository includes the SQL workflow and Power BI report for reviewing hospital operations. Add verified screenshots and measured findings here after refreshing the report against the intended dataset. Avoid publishing patient-level information or unsupported performance claims.

## Limitations & Responsible Use

- This is an analytics/portfolio project, not a clinical decision-support system.
- Findings depend on the source data, data definitions, cleaning decisions and refresh configuration.
- Example corrections in SQL are specific to records/values identified in the working dataset; they should not be applied blindly to another dataset.
- Do not publish personal, sensitive, confidential or identifiable health information.

## Author

**Vamshi Sabbani**  
Data Analytics Portfolio Project

## License

Add a license only if you have the rights to share the code and included materials. A license does not grant permission to redistribute third-party datasets or confidential reports.
