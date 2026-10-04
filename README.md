# Hospital Analytics & Operations Performance

A data analytics project focused on analyzing hospital operations,
patient visits, appointments, admissions, treatments and billing using
**MySQL** for data cleaning, validation and analysis, and **Microsoft
Power BI** for interactive dashboards and reporting.

## Problem Statement

Hospitals generate large volumes of data related to patients, doctors,
appointments, admissions, treatments and billing. When this information
is stored across multiple tables and contains missing values,
inconsistent formats, duplicate records or invalid entries, it becomes
difficult to analyze operational performance accurately.

The objective of this project is to build a structured hospital
analytics solution using MySQL and Power BI to clean, validate, organize
and analyze hospital data. The project aims to provide meaningful
insights into patient activity, doctor workload, appointment trends,
treatment performance, admission patterns and billing operations to
support data-driven operational decisions.

## Project Overview

This project organizes hospital-related data into a relational MySQL
database and prepares it for operational analysis. SQL is used for
database creation, data cleaning, data validation, exploratory analysis,
advanced queries and KPI calculations. Microsoft Power BI is used to
develop interactive dashboards that help explore hospital operations and
performance.

The project follows a complete data analytics workflow, from raw data
preparation and quality checks to analytical reporting and
visualization.

**Key objectives:** - Organize hospital data into a relational
database. - Identify and handle missing, duplicate, inconsistent and
invalid data. - Validate relationships and business rules across
hospital tables. - Analyze patient, doctor, appointment, admission,
treatment and billing activity. - Develop KPIs and interactive Power BI
dashboards. - Present operational insights through clear and accessible
visual reports.

> **Data privacy:** Use only synthetic, anonymized or otherwise
> authorized data in this public repository. Never publish real
> patient-identifiable, confidential or sensitive hospital information.

## Tools & Technologies

-   **MySQL** --- relational database management, data cleaning,
    validation and analysis
-   **Microsoft Power BI** --- data modeling, DAX measures, KPIs and
    interactive dashboards
-   **SQL** --- DDL, DML, joins, subqueries, CTEs, aggregations,
    constraints and transactions
-   **Power Query** --- data transformation and preparation
-   **DAX** --- calculated measures and analytical metrics
-   **Microsoft Excel / CSV** --- source data preparation
-   **Git & GitHub** --- version control and project sharing

## Repository Structure

``` text
Hospital-Analytics-and-Operations-Performance/
│
├── README.md
├── .gitignore
│
├── SQL/
│   ├── 01_data_cleaning.sql
│   ├── 02_data_validation.sql
│   ├── 03_exploratory_analysis.sql
│   ├── 04_advanced_analysis.sql
│   └── 05_kpi_queries.sql
│
├── PowerBI/
│   ├── hospital.pbix
│   └── Screenshots/
│       └── README.md
│
└── Documentation/
    ├── Project_Documentation.md
    └── Data_Dictionary.md
```

*Adjust the filenames above to match the actual files included in your
repository.*

## Database Design

The project uses a MySQL database named `hospital_analysis`, organized
around eight tables.

  -----------------------------------------------------------------------
  Table                               Description
  ----------------------------------- -----------------------------------
  `departments`                       Department names, types and floor
                                      details

  `doctors`                           Doctor profiles, specialization,
                                      experience, shift and department
                                      assignment

  `patients`                          Patient demographics, city,
                                      registration date and patient type

  `appointments`                      Appointment schedules, types,
                                      statuses and durations

  `visits`                            Patient visits, assigned doctors
                                      and visit dates

  `admissions`                        Admission and discharge details,
                                      bed type and length of stay

  `treatments`                        Treatment dates, types, statuses,
                                      costs and related records

  `billing`                           Billing dates, service types,
                                      amounts, insurance and payment
                                      details
  -----------------------------------------------------------------------

Primary keys uniquely identify records, while foreign keys establish
relationships between relevant tables and support referential integrity.

## Project Workflow

1.  **Data collection:** Prepare the authorized source CSV files for the
    hospital tables.
2.  **Database creation:** Create the `hospital_analysis` database in
    MySQL.
3.  **Table creation:** Define tables, appropriate data types, primary
    keys and foreign keys.
4.  **Data loading:** Import source data into the respective MySQL
    tables.
5.  **Data cleaning:** Identify and handle missing values, blank
    strings, whitespace, inconsistent categories and invalid records.
6.  **Data validation:** Check duplicates, key relationships, invalid
    dates, numeric ranges and business-rule consistency.
7.  **Exploratory analysis:** Use SQL queries, joins and aggregations to
    examine hospital operations.
8.  **Advanced analysis:** Apply advanced SQL techniques to investigate
    operational patterns and trends.
9.  **KPI development:** Calculate operational metrics to support
    performance monitoring.
10. **Dashboard development:** Build interactive Power BI dashboards
    using cleaned and validated data.
11. **Reporting:** Present findings and document the methodology,
    metrics and limitations.

## Data Cleaning & Validation

The SQL workflow includes checks and cleaning examples for:

-   Missing, `NULL`, blank and whitespace-only values
-   Leading and trailing spaces in text fields
-   Unexpected characters and inconsistent category values
-   Duplicate records and duplicate identifiers
-   Invalid numeric values, including age, experience, duration and cost
-   Missing, invalid, zero or future dates, where applicable
-   Invalid foreign-key references
-   Admission and discharge date sequence
-   Length-of-stay consistency
-   Billing arithmetic, including insurance and patient payment amounts

Data-cleaning operations may include trimming text, standardizing
selected categories, handling missing values and correcting or removing
identified invalid records.

**Important:** Review all `UPDATE`, `DELETE`, `TRUNCATE` and other
data-changing SQL statements before execution. Run them against a backup
or disposable copy of the database, and verify that each cleaning rule
is appropriate for your own dataset.

## SQL Analysis

The SQL analysis is organized into the following areas:

### 1. Data Cleaning

-   Handling missing and blank values
-   Removing unnecessary whitespace
-   Standardizing inconsistent text
-   Addressing invalid values and records

### 2. Data Validation

-   Checking primary and foreign-key consistency
-   Identifying duplicate records
-   Validating numeric ranges and date sequences
-   Verifying business rules across related tables

### 3. Exploratory Data Analysis

-   Patient distribution by age, gender, city and patient type
-   Doctor distribution by department and specialization
-   Appointment trends and appointment statuses
-   Patient visits by doctor and department
-   Admission patterns and length of stay
-   Treatment types, statuses and costs
-   Billing and payment patterns

### 4. Advanced SQL Analysis

-   Multi-table joins
-   Subqueries and common table expressions (CTEs)
-   Conditional aggregations
-   Date-based analysis
-   Ranking and top-performing category analysis
-   Window functions, where applicable

### 5. KPI Analysis

-   Total patients and visits
-   Total appointments and appointment statuses
-   Total admissions and average length of stay
-   Total treatments and treatment costs
-   Total billing amount and payment metrics

Metric definitions should be aligned with the final SQL queries and
Power BI measures to ensure consistent reporting.

## Power BI Dashboard

The Power BI report is designed to provide an interactive view of
hospital operations. Depending on the final saved report, dashboard
pages may include the following analytical areas:

### Patient & Hospital Overview

-   Total Patients
-   Total Doctors
-   Total Appointments
-   Total Visits
-   Patient distribution by demographics and location
-   Patient registration trends

### Doctor & Appointment Analysis

-   Top 10 Doctors by Patients
-   Top 10 Doctors by Appointments
-   Appointment Status Distribution
-   Doctors by Specialization
-   Appointments by Specialization

### Treatment & Clinical Analysis

-   Total Treatments
-   Completed, Pending and Cancelled Treatments
-   Total and Average Treatment Cost
-   Monthly Treatment Trend
-   Treatment Volume by Type
-   Treatments by Department
-   Treatment Status Distribution
-   Treatment Cost by Department
-   Top 10 Treatment Types by Cost

### Admissions & Billing Analysis

-   Admission trends and discharge patterns
-   Length-of-stay analysis
-   Billing totals and payment status
-   Insurance and patient payment distribution

*The above are analytical areas and candidate visuals; include only the
KPIs and visuals confirmed in the final `.pbix` file.*

## Key Performance Indicators (KPIs)

  KPI                      Purpose
  ------------------------ ------------------------------------------
  Total Patients           Measures the number of distinct patients
  Total Doctors            Measures the number of doctors
  Total Appointments       Tracks appointment volume
  Total Visits             Measures patient visit activity
  Total Admissions         Tracks hospital admissions
  Average Length of Stay   Measures average duration of admission
  Total Treatments         Tracks treatment volume
  Completed Treatments     Measures completed treatment activity
  Pending Treatments       Tracks treatments awaiting completion
  Cancelled Treatments     Measures cancelled treatment activity
  Total Treatment Cost     Calculates the sum of treatment costs
  Average Treatment Cost   Measures average treatment cost
  Total Billing Amount     Tracks the amount billed
  Patient Payment Amount   Measures the patient-payable portion
  Insurance Amount         Measures the insurance-covered portion

KPI definitions should specify whether the calculation uses row counts,
distinct IDs, filtered statuses or summed amounts. This helps avoid
double-counting when tables are joined.

## Getting Started

### Requirements

-   MySQL Server
-   MySQL Workbench or another MySQL client
-   Microsoft Power BI Desktop
-   Git
-   Authorized hospital sample data, if needed for database loading or
    report refresh

### Clone the Repository

``` bash
git clone <your-github-repository-url>
cd Hospital-Analytics-and-Operations-Performance
```

### Set Up MySQL

1.  Open MySQL Workbench.
2.  Open the SQL scripts in the `SQL` folder.
3.  Review the database schema and table definitions.
4.  Update any machine-specific CSV file paths.
5.  Confirm that the source data is authorized and contains no sensitive
    patient information.
6.  Back up the database before running cleaning or deletion statements.
7.  Execute the scripts in the intended order.
8.  Run validation queries to confirm the results.

If your environment requires `LOAD DATA LOCAL INFILE`, configure it only
when permitted by your security policy. Local file paths in the scripts
must be updated to match your system.

### Open the Power BI Report

1.  Open `PowerBI/hospital.pbix` in Power BI Desktop.
2.  Configure the data source to use your own MySQL database or
    authorized data files.
3.  Review the table relationships and cross-filter directions.
4.  Check DAX measures and calculated columns.
5.  Refresh the dataset.
6.  Verify that the dashboard visuals display the expected results.

The report may require data-source credentials, gateway or local
connection configuration before it can be refreshed.

## Expected Outcomes

This project provides a structured approach to preparing and analyzing
hospital operational data. It supports:

-   Improved visibility into patient and appointment activity
-   Analysis of doctor workload and department-level operations
-   Monitoring of treatment volume, status and cost
-   Review of admission patterns and length of stay
-   Understanding of billing and payment distributions
-   Interactive reporting to support operational review and data-driven
    decisions

Actual findings and numerical results should be added after validating
the final dataset and refreshing the Power BI report. Avoid reporting
estimated values as measured outcomes.

## Limitations & Responsible Use

-   This is an educational and portfolio analytics project, not a
    clinical decision-support system.
-   Results depend on the completeness, accuracy and definitions of the
    source data.
-   Cleaning rules and example corrections may be specific to the
    original working dataset and should not be blindly reused.
-   The dashboards describe recorded operational data and do not
    establish clinical effectiveness or causation.
-   Use synthetic, anonymized or otherwise authorized data when sharing
    the project.
-   Do not publish personally identifiable, sensitive or confidential
    health information.

## Future Enhancements

-   Automate data ingestion and refresh workflows.
-   Add additional data-quality monitoring and exception reporting.
-   Extend operational trend analysis using more historical data.
-   Improve dashboard navigation and role-specific reporting.
-   Add documented, reproducible KPI definitions and validation tests.

## Author

**Vamshi Sabbani**\
Data Analytics Portfolio Project

## License

A license may be added for original project code and documentation where
appropriate. A license does not grant permission to redistribute
third-party datasets, confidential hospital information or proprietary
reports. Confirm that you have the rights to share every included file
before publishing the repository.
