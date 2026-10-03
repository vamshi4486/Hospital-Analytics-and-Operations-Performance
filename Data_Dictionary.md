# Data Dictionary
## Hospital Analytics & Operations Performance

This dictionary is based on the table definitions in `hospital_analysis.sql`. It describes the columns shown in those definitions; actual nullability and source-data quality should be checked in the database after loading.

| Table | Column | Description |
|---|---|---|
| departments | department_id | Unique department identifier (PK) |
| departments | department_name | Department name |
| departments | department_type | Department category/type |
| departments | floor | Floor number |
| doctors | doctor_id | Unique doctor identifier (PK) |
| doctors | doctor_name | Doctor's name |
| doctors | department_id | Department reference (FK) |
| doctors | specialization | Doctor's specialization |
| doctors | experience_years | Years of experience |
| doctors | shift | Work shift |
| patients | patient_id | Unique patient identifier (PK) |
| patients | patient_name | Patient's name |
| patients | age | Patient age |
| patients | gender | Gender category |
| patients | city | Patient city |
| patients | registration_date | Patient registration date |
| patients | patient_type | Patient type/category |
| appointments | appointment_id | Unique appointment identifier (PK) |
| appointments | patient_id | Patient reference (FK) |
| appointments | doctor_id | Doctor reference (FK) |
| appointments | appointment_date | Appointment date |
| appointments | appointment_time | Appointment time |
| appointments | appointment_type | Appointment category |
| appointments | appointment_status | Appointment status |
| appointments | scheduled_duration | Scheduled duration |
| visits | visit_id | Unique visit identifier (PK) |
| visits | patient_id | Patient reference (FK) |
| visits | doctor_id | Doctor reference (FK) |
| visits | department_id | Department reference (FK) |
| visits | visit_date | Visit date |
| visits | check_in_time | Patient check-in timestamp |
| visits | consultation_start_time | Consultation start timestamp |
| visits | consultation_end_time | Consultation end timestamp |
| visits | visit_type | Visit category |
| admissions | admission_id | Unique admission identifier (PK) |
| admissions | patient_id | Patient reference (FK) |
| admissions | department_id | Department reference (FK) |
| admissions | admission_date | Admission date |
| admissions | discharge_date | Discharge date |
| admissions | admission_type | Admission category |
| admissions | bed_type | Bed category |
| admissions | length_of_stay | Length of stay value |
| treatments | treatment_id | Unique treatment identifier (PK) |
| treatments | patient_id | Patient reference (FK) |
| treatments | doctor_id | Doctor reference (FK) |
| treatments | department_id | Department reference (FK) |
| treatments | treatment_date | Treatment date |
| treatments | treatment_type | Treatment category |
| treatments | treatment_status | Treatment status |
| treatments | treatment_cost | Treatment cost |
| billing | bill_id | Unique bill identifier (PK) |
| billing | patient_id | Patient reference (FK) |
| billing | admission_id | Optional admission reference (FK) |
| billing | treatment_id | Treatment reference (FK) |
| billing | bill_date | Billing date |
| billing | service_type | Billed service category |
| billing | amount | Total bill amount |
| billing | insurance_amount | Amount attributed to insurance |
| billing | patient_amount | Amount attributed to patient |
| billing | payment_status | Payment status |

**PK** = Primary Key; **FK** = Foreign Key. Units, allowed category values and business definitions should be confirmed against the source dataset and final reporting model.
