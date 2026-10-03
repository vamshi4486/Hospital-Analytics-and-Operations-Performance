create database hospital_analysis;

use hospital_analysis;
select * from billing;
select *  from treatments;
CREATE TABLE departments (
    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    department_type VARCHAR(50) NOT NULL,
    floor INT NOT NULL
);

CREATE TABLE doctors (
    doctor_id VARCHAR(10) PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    department_id VARCHAR(10) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    experience_years INT NOT NULL,
    shift VARCHAR(20) NOT NULL,

    CONSTRAINT fk_doctor_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
select *from doctors;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE appointments;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE patients (
    patient_id VARCHAR(10) PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(20) NOT NULL,
    city VARCHAR(50) NOT NULL,
    registration_date DATE NOT NULL,
    patient_type VARCHAR(30) NOT NULL
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id VARCHAR(10) NOT NULL,
    doctor_id VARCHAR(10) NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    appointment_type VARCHAR(30) NOT NULL,
    appointment_status VARCHAR(30) NOT NULL,
    scheduled_duration INT NOT NULL,

    CONSTRAINT fk_appointment_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    CONSTRAINT fk_appointment_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
);

CREATE TABLE visits (
    visit_id INT PRIMARY KEY,
    patient_id VARCHAR(10) NOT NULL,
    doctor_id VARCHAR(10) NOT NULL,
    department_id VARCHAR(10) NOT NULL,
    visit_date DATE NOT NULL,
    check_in_time DATETIME NOT NULL,
    consultation_start_time DATETIME NOT NULL,
    consultation_end_time DATETIME NOT NULL,
    visit_type VARCHAR(30) NOT NULL,

    CONSTRAINT fk_visit_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    CONSTRAINT fk_visit_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id),

    CONSTRAINT fk_visit_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE admissions (
    admission_id INT PRIMARY KEY,
    patient_id VARCHAR(10) NOT NULL,
    department_id VARCHAR(10) NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE NOT NULL,
    admission_type VARCHAR(30) NOT NULL,
    bed_type VARCHAR(30) NOT NULL,
    length_of_stay INT NOT NULL,

    CONSTRAINT fk_admission_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    CONSTRAINT fk_admission_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    patient_id VARCHAR(10) NOT NULL,
    doctor_id VARCHAR(10) NOT NULL,
    department_id VARCHAR(10) NOT NULL,
    treatment_date DATE NOT NULL,
    treatment_type VARCHAR(50) NOT NULL,
    treatment_status VARCHAR(30) NOT NULL,
    treatment_cost DECIMAL(12,2) NOT NULL,

    CONSTRAINT fk_treatment_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    CONSTRAINT fk_treatment_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id),

    CONSTRAINT fk_treatment_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE billing (
    bill_id INT PRIMARY KEY,
    patient_id VARCHAR(10) NOT NULL,
    admission_id INT,
    treatment_id INT NOT NULL,
    bill_date DATE NOT NULL,
    service_type VARCHAR(50) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    insurance_amount DECIMAL(12,2) NOT NULL,
    patient_amount DECIMAL(12,2) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_billing_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    CONSTRAINT fk_billing_admission
        FOREIGN KEY (admission_id)
        REFERENCES admissions(admission_id),

    CONSTRAINT fk_billing_treatment
        FOREIGN KEY (treatment_id)
        REFERENCES treatments(treatment_id)
);

DESC departments;
DESC doctors;
DESC patients;
DESC appointments;
DESC visits;
DESC admissions;
DESC treatments;
DESC billing;
select bill_date ,sum(amount)from billing group by bill_date;

LOAD DATA LOCAL INFILE 'C:/Users/sabba/Downloads/hospial/appointments.csv'
INTO TABLE appointments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


select *from doctors;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
-- OPT_LOCAL_INFILE=1


select * from departments;
select * from patients;
select * from admissions;
select * from billing;
select * from doctors;
select * from treatments ;
select * from visits;
select * from appointments;

use hospital_analysis;
SHOW TABLES;

-- Checking Row Counts

SELECT 'departments' AS table_name, COUNT(*) AS row_count FROM departments
UNION ALL
SELECT 'doctors', COUNT(*) FROM doctors
UNION ALL
SELECT 'patients', COUNT(*) FROM patients
UNION ALL
SELECT 'appointments', COUNT(*) FROM appointments
UNION ALL
SELECT 'visits', COUNT(*) FROM visits
UNION ALL
SELECT 'admissions', COUNT(*) FROM admissions
UNION ALL
SELECT 'treatments', COUNT(*) FROM treatments
UNION ALL
SELECT 'billing', COUNT(*) FROM billing;

-- Preview the Data

SELECT * FROM departments LIMIT 10;
SELECT * FROM doctors LIMIT 10;
SELECT * FROM patients LIMIT 10;
SELECT * FROM appointments LIMIT 10;
SELECT * FROM visits LIMIT 10;
SELECT * FROM admissions LIMIT 10;
SELECT * FROM treatments LIMIT 10;
SELECT * FROM billing LIMIT 10;

-- Check NULL Values and blanks

SELECT *
FROM patients
WHERE patient_id IS NULL
   OR TRIM(patient_id) = ''
   OR patient_name IS NULL
   OR TRIM(patient_name) = ''
   OR age IS NULL
   OR gender IS NULL
   OR TRIM(gender) = ''
   OR city IS NULL
   OR TRIM(city) = ''
   OR registration_date IS NULL
   OR patient_type IS NULL
   OR TRIM(patient_type) = '';


SELECT *
FROM doctors
WHERE doctor_id IS NULL
   OR TRIM(doctor_id) = ''
   OR doctor_name IS NULL
   OR TRIM(doctor_name) = ''
   OR department_id IS NULL
   OR TRIM(department_id) = ''
   OR specialization IS NULL
   OR TRIM(specialization) = ''
   OR experience_years IS NULL
   OR shift IS NULL
   OR TRIM(shift) = '';



SELECT *
FROM departments
WHERE department_id IS NULL
   OR TRIM(department_id) = ''
   OR department_name IS NULL
   OR TRIM(department_name) = ''
   OR department_type IS NULL
   OR TRIM(department_type) = ''
   OR floor IS NULL;



SELECT *
FROM appointments
WHERE appointment_id IS NULL
   OR TRIM(appointment_id) = ''
   OR patient_id IS NULL
   OR TRIM(patient_id) = ''
   OR doctor_id IS NULL
   OR TRIM(doctor_id) = ''
   OR appointment_date IS NULL
   OR appointment_time IS NULL
   OR appointment_type IS NULL
   OR TRIM(appointment_type) = ''
   OR appointment_status IS NULL
   OR TRIM(appointment_status) = ''
   OR scheduled_duration IS NULL;



SELECT *
FROM admissions
WHERE admission_id IS NULL
   OR TRIM(admission_id) = ''
   OR patient_id IS NULL
   OR TRIM(patient_id) = ''
   OR department_id IS NULL
   OR TRIM(department_id) = ''
   OR admission_date IS NULL
   OR discharge_date IS NULL
   OR admission_type IS NULL
   OR TRIM(admission_type) = ''
   OR bed_type IS NULL
   OR TRIM(bed_type) = ''
   OR length_of_stay IS NULL;



SELECT *
FROM treatments
WHERE treatment_id IS NULL
   OR TRIM(treatment_id) = ''
   OR patient_id IS NULL
   OR TRIM(patient_id) = ''
   OR doctor_id IS NULL
   OR TRIM(doctor_id) = ''
   OR department_id IS NULL
   OR TRIM(department_id) = ''
   OR treatment_date IS NULL
   OR treatment_type IS NULL
   OR TRIM(treatment_type) = ''
   OR treatment_status IS NULL
   OR TRIM(treatment_status) = ''
   OR treatment_cost IS NULL;



SELECT *
FROM billing
WHERE bill_id IS NULL
   OR TRIM(bill_id) = ''
   OR patient_id IS NULL
   OR TRIM(patient_id) = ''
   OR treatment_id IS NULL
   OR TRIM(treatment_id) = ''
   OR bill_date IS NULL
   OR service_type IS NULL
   OR TRIM(service_type) = ''
   OR amount IS NULL
   OR insurance_amount IS NULL
   OR patient_amount IS NULL
   OR payment_status IS NULL
   OR TRIM(payment_status) = '';



SELECT *
FROM visits
WHERE visit_id IS NULL
   OR TRIM(visit_id) = ''
   OR patient_id IS NULL
   OR TRIM(patient_id) = ''
   OR doctor_id IS NULL
   OR TRIM(doctor_id) = ''
   OR department_id IS NULL
   OR TRIM(department_id) = ''
   OR visit_date IS NULL
   OR check_in_time IS NULL
   OR  consultation_start_time IS NULL
   OR  consultation_end_time IS NULL
   OR visit_type IS NULL
   OR TRIM(visit_type) = '';
   
   select * from visits;
-- FIX for critical transaction records, delete records with missing required IDs:

/* Convert blank text values to NULL first */
UPDATE patients
SET patient_name = NULL
WHERE patient_name IS NOT NULL
  AND TRIM(patient_name) = '';

UPDATE patients
SET gender = NULL
WHERE gender IS NOT NULL
  AND TRIM(gender) = '';

UPDATE patients
SET city = 'Unknown'
WHERE patient_id="PAT00011";

UPDATE patients
SET patient_type = NULL
WHERE patient_type IS NOT NULL
  AND TRIM(patient_type) = '';

/* Fill missing categorical values */
UPDATE patients
SET gender = 'Unknown'
WHERE gender IS NULL;

UPDATE patients
SET city = 'Unknown'
WHERE city IS NULL;

UPDATE patients
SET patient_type = 'Unknown'
WHERE patient_type IS NULL;


/* ---------------------------------------------------------
   2. DOCTORS
   --------------------------------------------------------- */

UPDATE doctors
SET doctor_name = NULL
WHERE doctor_name IS NOT NULL
  AND TRIM(doctor_name) = '';

UPDATE doctors
SET specialization = NULL
WHERE specialization IS NOT NULL
  AND TRIM(specialization) = '';

UPDATE doctors
SET shift = NULL
WHERE shift IS NOT NULL
  AND TRIM(shift) = '';

/* Fill missing categorical values */
UPDATE doctors
SET specialization = 'Unknown'
WHERE specialization IS NULL;

UPDATE doctors
SET shift = 'Unknown'
WHERE shift IS NULL;

/* Example numeric fix */
UPDATE doctors
SET experience_years = 0
WHERE experience_years IS NULL;


/* ---------------------------------------------------------
   3. DEPARTMENTS
   --------------------------------------------------------- */

UPDATE departments
SET department_name = NULL
WHERE department_name IS NOT NULL
  AND TRIM(department_name) = '';

UPDATE departments
SET department_type = NULL
WHERE department_type IS NOT NULL
  AND TRIM(department_type) = '';

UPDATE departments
SET department_name = 'Unknown'
WHERE department_name IS NULL;

UPDATE departments
SET department_type = 'Unknown'
WHERE department_type IS NULL;


/* ---------------------------------------------------------
   4. APPOINTMENTS
   --------------------------------------------------------- */

UPDATE appointments
SET appointment_type = NULL
WHERE appointment_type IS NOT NULL
  AND TRIM(appointment_type) = '';

UPDATE appointments
SET appointment_status = NULL
WHERE appointment_status IS NOT NULL
  AND TRIM(appointment_status) = '';

UPDATE appointments
SET appointment_type = 'Unknown'
WHERE appointment_type IS NULL;

UPDATE appointments
SET appointment_status = 'Unknown'
WHERE appointment_status IS NULL;	

UPDATE appointments
SET patient_id="PAT0001"
WHERE appointment_id=1;

/* ---------------------------------------------------------
   5. ADMISSIONS
   --------------------------------------------------------- */

UPDATE admissions
SET admission_type = NULL
WHERE admission_type IS NOT NULL
  AND TRIM(admission_type) = '';

UPDATE admissions
SET admission_type = 'Unknown'
WHERE admission_type IS NULL;

UPDATE admissions
SET bed_type = 'ICU'
WHERE admission_id=10;
select bed_type from admissions;

/* ---------------------------------------------------------
   6. TREATMENTS
   --------------------------------------------------------- */

UPDATE treatments
SET treatment_type = NULL
WHERE treatment_type IS NOT NULL
  AND TRIM(treatment_type) = '';

UPDATE treatments
SET treatment_status = NULL
WHERE treatment_status IS NOT NULL
  AND TRIM(treatment_status) = '';

UPDATE treatments
SET treatment_type = 'Unknown'
WHERE treatment_type IS NULL;


UPDATE treatments
SET treatment_status = 'Unknown'
WHERE treatment_status IS NULL;


/* ---------------------------------------------------------
   7. BILLING
   --------------------------------------------------------- */

UPDATE billing
SET service_type = NULL
WHERE service_type IS NOT NULL
  AND TRIM(service_type) = '';

UPDATE billing
SET payment_status = NULL
WHERE payment_status IS NOT NULL
  AND TRIM(payment_status) = '';

UPDATE billing
SET service_type = 'Unknown'
WHERE service_type IS NULL;

UPDATE billing
SET payment_status = 'Unknown'
WHERE payment_status IS NULL;


/* ---------------------------------------------------------
   8. VISITS
   --------------------------------------------------------- */

UPDATE visits
SET visit_type = NULL
WHERE visit_type IS NOT NULL
  AND TRIM(visit_type) = '';

UPDATE visits
SET visit_type = 'Unknown'
WHERE visit_type IS NULL;

DELETE FROM appointments
WHERE patient_id IS NULL
   OR doctor_id IS NULL;

DELETE FROM visits
WHERE patient_id IS NULL
   OR doctor_id IS NULL
   OR department_id IS NULL;

DELETE FROM admissions
WHERE patient_id IS NULL
   OR department_id IS NULL;


DELETE FROM treatments
WHERE patient_id IS NULL
   OR doctor_id IS NULL
   OR department_id IS NULL;

DELETE FROM billing
WHERE patient_id IS NULL
   OR treatment_id IS NULL;




-- Check for Duplicate Primary Keys

SELECT
    patient_id,
    COUNT(*) AS duplicate_count
FROM patients
GROUP BY patient_id
HAVING COUNT(*) > 1;


SELECT doctor_id, COUNT(*)
FROM doctors
GROUP BY doctor_id
HAVING COUNT(*) > 1;


-- Check Empty Strings.

SELECT *
FROM patients
WHERE TRIM(patient_name) = ''
   OR TRIM(gender) = ''
   OR TRIM(city) = ''
   OR TRIM(patient_type) = '';

SELECT *
FROM doctors
WHERE TRIM(doctor_name) = ''
   OR TRIM(department_id) = ''
   OR TRIM(specialization) = ''
   OR TRIM(shift) = '';

SELECT *
FROM departments
WHERE TRIM(department_name) = ''
   OR TRIM(department_type) = '';

SELECT *
FROM appointments
WHERE TRIM(patient_id) = ''
   OR TRIM(doctor_id) = ''
   OR TRIM(appointment_type) = ''
   OR TRIM(appointment_status) = '';

SELECT *
FROM visits
WHERE TRIM(patient_id) = ''
   OR TRIM(doctor_id) = ''
   OR TRIM(department_id) = ''
   OR TRIM(visit_type) = '';

SELECT *
FROM admissions
WHERE TRIM(patient_id) = ''
   OR TRIM(department_id) = ''
   OR TRIM(admission_type) = ''
   OR TRIM(bed_type) = '';

SELECT *
FROM treatments
WHERE TRIM(patient_id) = ''
   OR TRIM(doctor_id) = ''
   OR TRIM(department_id) = ''
   OR TRIM(treatment_type) = ''
   OR TRIM(treatment_status) = '';

SELECT *
FROM billing
WHERE TRIM(patient_id) = ''
   OR TRIM(treatment_id) = ''
   OR TRIM(service_type) = ''
   OR TRIM(payment_status) = '';
   


-- For records with missing critical text:

SET SQL_SAFE_UPDATES = 0;

DELETE FROM patients 
WHERE TRIM(patient_name) = '';

DELETE FROM doctors
WHERE TRIM(doctor_name) = ''
   OR TRIM(specialization) = '';
   
DELETE FROM treatments
WHERE TRIM(treatment_type) = '';

DELETE FROM billing
WHERE TRIM(service_type) = '';

-- Check Leading / Trailing Spaces

SELECT *
FROM patients
WHERE patient_name <> TRIM(patient_name)
   OR gender <> TRIM(gender)
   OR city <> TRIM(city)
   OR patient_type <> TRIM(patient_type);
   
SELECT *
FROM doctors
WHERE doctor_name <> TRIM(doctor_name)
   OR department_id <> TRIM(department_id)
   OR specialization <> TRIM(specialization)
   OR shift <> TRIM(shift);

SELECT *
FROM departments
WHERE department_name <> TRIM(department_name)
   OR department_type <> TRIM(department_type);

SELECT *
FROM appointments
WHERE patient_id <> TRIM(patient_id)
   OR doctor_id <> TRIM(doctor_id)
   OR appointment_type <> TRIM(appointment_type)
   OR appointment_status <> TRIM(appointment_status);

SELECT *
FROM visits
WHERE patient_id <> TRIM(patient_id)
   OR doctor_id <> TRIM(doctor_id)
   OR department_id <> TRIM(department_id)
   OR visit_type <> TRIM(visit_type);

SELECT *
FROM admissions
WHERE patient_id <> TRIM(patient_id)
   OR department_id <> TRIM(department_id)
   OR admission_type <> TRIM(admission_type)
   OR bed_type <> TRIM(bed_type);

SELECT *
FROM treatments
WHERE patient_id <> TRIM(patient_id)
   OR doctor_id <> TRIM(doctor_id)
   OR department_id <> TRIM(department_id)
   OR treatment_type <> TRIM(treatment_type)
   OR treatment_status <> TRIM(treatment_status);

SELECT *
FROM billing
WHERE patient_id <> TRIM(patient_id)
   OR service_type <> TRIM(service_type)
   OR payment_status <> TRIM(payment_status);

-- Fix Leading / Trailing Spaces

UPDATE patients
SET patient_name = TRIM(patient_name),
    gender = TRIM(gender),
    city = TRIM(city),
    patient_type = TRIM(patient_type);

UPDATE doctors
SET doctor_name = TRIM(doctor_name),
    specialization = TRIM(specialization),
    shift = TRIM(shift);
    
UPDATE departments
SET department_name = TRIM(department_name),
    department_type = TRIM(department_type);

UPDATE appointments
SET appointment_type = TRIM(appointment_type),
    appointment_status = TRIM(appointment_status);

UPDATE admissions
SET admission_type = TRIM(admission_type),
    bed_type = TRIM(bed_type);

UPDATE treatments
SET treatment_type = TRIM(treatment_type),
    treatment_status = TRIM(treatment_status);
    
-- Check Strange Text / Special Characters

-- 1. PATIENTS 
SELECT *
FROM patients
WHERE patient_name REGEXP '[^A-Za-z ]'
   OR gender REGEXP '[^A-Za-z ]'
   OR city REGEXP '[^A-Za-z ]'
   OR patient_type REGEXP '[^A-Za-z ]';

-- Inspect unique values 
SELECT DISTINCT patient_name FROM patients;
SELECT DISTINCT gender FROM patients;
SELECT DISTINCT city FROM patients;
SELECT DISTINCT patient_type FROM patients;


-- 2. DOCTORS 
SELECT *
FROM doctors
WHERE doctor_name REGEXP '[^A-Za-z .]'
   OR specialization REGEXP '[^A-Za-z ]'
   OR shift REGEXP '[^A-Za-z ]';

-- Inspect unique values 
SELECT DISTINCT doctor_name FROM doctors;
SELECT DISTINCT specialization FROM doctors;
SELECT DISTINCT shift FROM doctors;


-- 3. DEPARTMENTS 
SELECT *
FROM departments
WHERE department_name REGEXP '[^A-Za-z ]'
   OR department_type REGEXP '[^A-Za-z ]';

-- Inspect unique values 
SELECT DISTINCT department_name FROM departments;
SELECT DISTINCT department_type FROM departments;


-- 4. APPOINTMENTS 
SELECT *
FROM appointments
WHERE appointment_type REGEXP '[^A-Za-z ]'
   OR appointment_status REGEXP '[^A-Za-z ]';

-- Inspect unique values 
SELECT DISTINCT appointment_type FROM appointments;
SELECT DISTINCT appointment_status FROM appointments;


-- 5. VISITS 
SELECT *
FROM visits
WHERE visit_type REGEXP '[^A-Za-z ]';

-- Inspect unique values 
SELECT DISTINCT visit_type FROM visits;


-- 6. ADMISSIONS 
SELECT *
FROM admissions
WHERE admission_type REGEXP '[^A-Za-z ]'
   OR bed_type REGEXP '[^A-Za-z ]';

-- Inspect unique values
SELECT DISTINCT admission_type FROM admissions;
SELECT DISTINCT bed_type FROM admissions;

SELECT *
FROM admissions
WHERE bed_type IS NULL
   OR TRIM(bed_type) = '';


-- 7. TREATMENTS 
SELECT *
FROM treatments
WHERE treatment_type REGEXP '[^A-Za-z ]'
   OR treatment_status REGEXP '[^A-Za-z ]';

-- Inspect unique values 
SELECT DISTINCT treatment_type FROM treatments;
SELECT DISTINCT treatment_status FROM treatments;


-- 8. BILLING 
SELECT *
FROM billing
WHERE service_type REGEXP '[^A-Za-z ]'
   OR payment_status REGEXP '[^A-Za-z ]';

-- Inspect unique values 
SELECT DISTINCT service_type FROM billing;
SELECT DISTINCT payment_status FROM billing;



-- FIX 

/* PATIENTS */
UPDATE patients
SET city = 'Hyderabad'
WHERE city = 'Hyderabad@@';

/* DOCTORS */
UPDATE doctors
SET specialization = 'Cardiology'
WHERE specialization = 'Cardiology@@';

/* DEPARTMENTS */
UPDATE departments
SET department_name = 'Neurology'
WHERE department_name = 'Neurology@@';

/* APPOINTMENTS */
UPDATE appointments
SET appointment_type = 'Consultation'
WHERE appointment_type = 'Consultation@@';

/* VISITS */
UPDATE visits
SET visit_type = 'Follow Up'
WHERE visit_type = 'Follow Up@@';

/* ADMISSIONS */
UPDATE admissions
SET admission_type = 'Emergency'
WHERE admission_type = 'Emergency@@';

/* TREATMENTS */
UPDATE treatments
SET treatment_type = 'Surgery'
WHERE treatment_type = 'Surgery@@';

/* BILLING */
UPDATE billing
SET service_type = 'Consultation'
WHERE service_type = 'Consultation@@';

-- Check Incorrect ID Formats

-- Patient IDs

SELECT *
FROM patients
WHERE patient_id NOT REGEXP '^PAT[0-9]{5}$';

-- Doctor IDs

SELECT *
FROM doctors
WHERE doctor_id NOT REGEXP '^DOC[0-9]{3}$';

-- Department IDs

SELECT *
FROM departments
WHERE department_id NOT REGEXP '^DEP[0-9]{3}$';

-- Transaction IDs

SELECT * FROM appointments WHERE appointment_id <= 0;
SELECT * FROM visits WHERE visit_id <= 0;
SELECT * FROM admissions WHERE admission_id <= 0;
SELECT * FROM treatments WHERE treatment_id <= 0;
SELECT * FROM billing WHERE bill_id <= 0;

-- FIX 

UPDATE patients
SET patient_id = 'PAT00009'
WHERE patient_id = 'P009';

UPDATE doctors
SET doctor_id = 'DOC005'
WHERE doctor_id = 'DR05';

DELETE FROM appointments
WHERE appointment_id <= 0;

-- Check Duplicate records

SELECT patient_id, COUNT(*) AS duplicate_count
FROM patients
GROUP BY patient_id
HAVING COUNT(*) > 1;


/* 2. DOCTORS */
SELECT doctor_id, COUNT(*) AS duplicate_count
FROM doctors
GROUP BY doctor_id
HAVING COUNT(*) > 1;


/* 3. DEPARTMENTS */
SELECT department_id, COUNT(*) AS duplicate_count
FROM departments
GROUP BY department_id
HAVING COUNT(*) > 1;


/* 4. APPOINTMENTS */
SELECT appointment_id, COUNT(*) AS duplicate_count
FROM appointments
GROUP BY appointment_id
HAVING COUNT(*) > 1;


/* 5. VISITS */
SELECT visit_id, COUNT(*) AS duplicate_count
FROM visits
GROUP BY visit_id
HAVING COUNT(*) > 1;


/* 6. ADMISSIONS */
SELECT admission_id, COUNT(*) AS duplicate_count
FROM admissions
GROUP BY admission_id
HAVING COUNT(*) > 1;


/* 7. TREATMENTS */
SELECT treatment_id, COUNT(*) AS duplicate_count
FROM treatments
GROUP BY treatment_id
HAVING COUNT(*) > 1;


/* 8. BILLING */
SELECT bill_id, COUNT(*) AS duplicate_count
FROM billing
GROUP BY bill_id
HAVING COUNT(*) > 1;


-- CHECK EXACT DUPLICATE ROWS

/* PATIENTS */
SELECT patient_id, patient_name, age, gender, city,
       registration_date, patient_type, COUNT(*) AS duplicate_count
FROM patients
GROUP BY patient_id, patient_name, age, gender, city,
         registration_date, patient_type
HAVING COUNT(*) > 1;


/* DOCTORS */
SELECT doctor_id, doctor_name, department_id, specialization,
       experience_years, shift, COUNT(*) AS duplicate_count
FROM doctors
GROUP BY doctor_id, doctor_name, department_id, specialization,
         experience_years, shift
HAVING COUNT(*) > 1;


/* DEPARTMENTS */
SELECT department_id, department_name, department_type, floor,
       COUNT(*) AS duplicate_count
FROM departments
GROUP BY department_id, department_name, department_type, floor
HAVING COUNT(*) > 1;


/* APPOINTMENTS */
SELECT appointment_id, patient_id, doctor_id, appointment_date,
       appointment_time, appointment_type, appointment_status,
       scheduled_duration, COUNT(*) AS duplicate_count
FROM appointments
GROUP BY appointment_id, patient_id, doctor_id, appointment_date,
         appointment_time, appointment_type, appointment_status,
         scheduled_duration
HAVING COUNT(*) > 1;


/* VISITS */
SELECT visit_id, patient_id, doctor_id, department_id, visit_date,
       check_in_time, consultation_start_time, consultation_end_time, visit_type,
       COUNT(*) AS duplicate_count
FROM visits
GROUP BY visit_id, patient_id, doctor_id, department_id, visit_date,
         check_in_time, consultation_start_time, consultation_end_time, visit_type
HAVING COUNT(*) > 1;


/* ADMISSIONS */
SELECT admission_id, patient_id, department_id, admission_date,
       discharge_date, admission_type, bed_type, length_of_stay,
       COUNT(*) AS duplicate_count
FROM admissions
GROUP BY admission_id, patient_id, department_id, admission_date,
         discharge_date, admission_type, bed_type, length_of_stay
HAVING COUNT(*) > 1;


/* TREATMENTS */
SELECT treatment_id, patient_id, doctor_id, department_id,
       treatment_date, treatment_type, treatment_status,
       treatment_cost, COUNT(*) AS duplicate_count
FROM treatments
GROUP BY treatment_id, patient_id, doctor_id, department_id,
         treatment_date, treatment_type, treatment_status,
         treatment_cost
HAVING COUNT(*) > 1;


/* BILLING */
SELECT bill_id, patient_id, treatment_id, bill_date,
       service_type, amount, insurance_amount, patient_amount,
       payment_status, COUNT(*) AS duplicate_count
FROM billing
GROUP BY bill_id, patient_id, treatment_id, bill_date,
         service_type, amount, insurance_amount, patient_amount,
         payment_status
HAVING COUNT(*) > 1;


-- CHECK Negative and Invalid Numeric Values

SELECT *
FROM patients
WHERE age < 1 OR age > 120;
SELECT *
FROM doctors
WHERE experience_years < 0
   OR experience_years > 60;
   
SELECT *
FROM departments
WHERE floor <= 0
   OR floor > 100;
   
SELECT *
FROM appointments
WHERE scheduled_duration <= 0
   OR scheduled_duration > 480;
   
SELECT *
FROM admissions
WHERE length_of_stay < 0
   OR length_of_stay > 365;
   
SELECT *
FROM treatments
WHERE treatment_cost <= 0;

SELECT *
FROM billing
WHERE amount < 0
   OR insurance_amount < 0
   OR patient_amount < 0;
   
-- FIX

UPDATE patients
SET age = 38
WHERE age < 1 OR age > 120;

SELECT *
FROM patients
WHERE age < 1 OR age > 120;

UPDATE doctors
SET experience_years = 15
WHERE experience_years < 0
   OR experience_years > 60;

SELECT *
FROM doctors
WHERE experience_years < 0
   OR experience_years > 60;
   
select * from admissions;
   
UPDATE appointments
SET scheduled_duration = 30
WHERE scheduled_duration <= 0
   OR scheduled_duration > 480;
   
UPDATE admissions
SET length_of_stay = 20
WHERE length_of_stay < 0;

SELECT *
FROM admissions
WHERE length_of_stay < 0;

START TRANSACTION;

DELETE FROM billing
WHERE treatment_id IN (
    SELECT treatment_id
    FROM (
        SELECT treatment_id
        FROM treatments
        WHERE treatment_cost <= 0
    ) AS invalid_treatments
);

DELETE FROM treatments
WHERE treatment_cost <= 0;

COMMIT;

SELECT *
FROM treatments
WHERE treatment_cost <= 0;

DELETE FROM billing
WHERE amount < 0;

-- Check Incorrect Dates

SELECT *
FROM patients
WHERE registration_date > CURRENT_DATE
   OR registration_date IS NULL
   OR CAST(registration_date AS CHAR) = '0000-00-00'
   OR CAST(registration_date AS CHAR) = ''
   OR (
        registration_date IS NOT NULL
        AND DATE_FORMAT(registration_date, '%Y-%m-%d') IS NULL
      );

SELECT *
FROM appointments
WHERE appointment_date > CURRENT_DATE
   OR appointment_date IS NULL
   OR CAST(appointment_date AS CHAR) = '0000-00-00'
   OR CAST(appointment_date AS CHAR) = ''
   OR (
        appointment_date IS NOT NULL
        AND DATE_FORMAT(appointment_date, '%Y-%m-%d') IS NULL
      );

SELECT *
FROM visits
WHERE visit_date > CURRENT_DATE
   OR visit_date IS NULL
   OR CAST(visit_date AS CHAR) = '0000-00-00'
   OR CAST(visit_date AS CHAR) = ''
   OR (
        visit_date IS NOT NULL
        AND DATE_FORMAT(visit_date, '%Y-%m-%d') IS NULL
      );

SELECT *
FROM admissions
WHERE admission_date IS NULL
   OR discharge_date IS NULL
   OR CAST(admission_date AS CHAR) = '0000-00-00'
   OR CAST(admission_date AS CHAR) = ''
   OR CAST(discharge_date AS CHAR) = '0000-00-00'
   OR CAST(discharge_date AS CHAR) = ''
   OR (
        admission_date IS NOT NULL
        AND DATE_FORMAT(admission_date, '%Y-%m-%d') IS NULL
      )
   OR (
        discharge_date IS NOT NULL
        AND DATE_FORMAT(discharge_date, '%Y-%m-%d') IS NULL
      );

SELECT *
FROM admissions
WHERE discharge_date < admission_date;

SELECT *
FROM treatments
WHERE treatment_date > CURRENT_DATE
   OR treatment_date IS NULL
   OR CAST(treatment_date AS CHAR) = '0000-00-00'
   OR CAST(treatment_date AS CHAR) = ''
   OR (
        treatment_date IS NOT NULL
        AND DATE_FORMAT(treatment_date, '%Y-%m-%d') IS NULL
      );

SELECT *
FROM billing
WHERE bill_date > CURRENT_DATE
   OR bill_date IS NULL
   OR CAST(bill_date AS CHAR) = '0000-00-00'
   OR CAST(bill_date AS CHAR) = ''
   OR (
        bill_date IS NOT NULL
        AND DATE_FORMAT(bill_date, '%Y-%m-%d') IS NULL
      );
      
-- FIX Incorrect Dates

START TRANSACTION;

DELETE FROM billing
WHERE patient_id IN (
    SELECT patient_id
    FROM (
        SELECT patient_id
        FROM patients
        WHERE registration_date > CURRENT_DATE
           OR registration_date IS NULL
           OR CAST(registration_date AS CHAR) = '0000-00-00'
           OR CAST(registration_date AS CHAR) = ''
           OR (
                registration_date IS NOT NULL
                AND DATE_FORMAT(registration_date, '%Y-%m-%d') IS NULL
              )
    ) AS invalid_patients
);

DELETE FROM appointments
WHERE patient_id IN (
    SELECT patient_id
    FROM (
        SELECT patient_id
        FROM patients
        WHERE registration_date > CURRENT_DATE
           OR registration_date IS NULL
           OR CAST(registration_date AS CHAR) = '0000-00-00'
           OR CAST(registration_date AS CHAR) = ''
           OR (
                registration_date IS NOT NULL
                AND DATE_FORMAT(registration_date, '%Y-%m-%d') IS NULL
              )
    ) AS invalid_patients
);

DELETE FROM visits
WHERE patient_id IN (
    SELECT patient_id
    FROM (
        SELECT patient_id
        FROM patients
        WHERE registration_date > CURRENT_DATE
           OR registration_date IS NULL
           OR CAST(registration_date AS CHAR) = '0000-00-00'
           OR CAST(registration_date AS CHAR) = ''
           OR (
                registration_date IS NOT NULL
                AND DATE_FORMAT(registration_date, '%Y-%m-%d') IS NULL
              )
    ) AS invalid_patients
);

DELETE FROM admissions
WHERE patient_id IN (
    SELECT patient_id
    FROM (
        SELECT patient_id
        FROM patients
        WHERE registration_date > CURRENT_DATE
           OR registration_date IS NULL
           OR CAST(registration_date AS CHAR) = '0000-00-00'
           OR CAST(registration_date AS CHAR) = ''
           OR (
                registration_date IS NOT NULL
                AND DATE_FORMAT(registration_date, '%Y-%m-%d') IS NULL
              )
    ) AS invalid_patients
);

DELETE FROM treatments
WHERE patient_id IN (
    SELECT patient_id
    FROM (
        SELECT patient_id
        FROM patients
        WHERE registration_date > CURRENT_DATE
           OR registration_date IS NULL
           OR CAST(registration_date AS CHAR) = '0000-00-00'
           OR CAST(registration_date AS CHAR) = ''
           OR (
                registration_date IS NOT NULL
                AND DATE_FORMAT(registration_date, '%Y-%m-%d') IS NULL
              )
    ) AS invalid_patients
);

DELETE FROM patients
WHERE registration_date > CURRENT_DATE
   OR registration_date IS NULL
   OR CAST(registration_date AS CHAR) = '0000-00-00'
   OR CAST(registration_date AS CHAR) = ''
   OR (
        registration_date IS NOT NULL
        AND DATE_FORMAT(registration_date, '%Y-%m-%d') IS NULL
      );

COMMIT;




DELETE FROM appointments
WHERE appointment_date > CURRENT_DATE
   OR appointment_date IS NULL
   OR CAST(appointment_date AS CHAR) = '0000-00-00'
   OR CAST(appointment_date AS CHAR) = ''
   OR (
        appointment_date IS NOT NULL
        AND DATE_FORMAT(appointment_date, '%Y-%m-%d') IS NULL
      );

DELETE FROM visits
WHERE visit_date > CURRENT_DATE
   OR visit_date IS NULL
   OR CAST(visit_date AS CHAR) = '0000-00-00'
   OR CAST(visit_date AS CHAR) = ''
   OR (
        visit_date IS NOT NULL
        AND DATE_FORMAT(visit_date, '%Y-%m-%d') IS NULL
      );

START TRANSACTION;

DELETE FROM billing
WHERE admission_id IN (
    SELECT admission_id
    FROM (
        SELECT admission_id
        FROM admissions
        WHERE admission_date IS NULL
           OR discharge_date IS NULL
           OR CAST(admission_date AS CHAR) = '0000-00-00'
           OR CAST(admission_date AS CHAR) = ''
           OR CAST(discharge_date AS CHAR) = '0000-00-00'
           OR CAST(discharge_date AS CHAR) = ''
           OR (
                admission_date IS NOT NULL
                AND DATE_FORMAT(admission_date, '%Y-%m-%d') IS NULL
              )
           OR (
                discharge_date IS NOT NULL
                AND DATE_FORMAT(discharge_date, '%Y-%m-%d') IS NULL
              )
           OR discharge_date < admission_date
    ) AS invalid_admissions
);

DELETE FROM admissions
WHERE admission_date IS NULL
   OR discharge_date IS NULL
   OR CAST(admission_date AS CHAR) = '0000-00-00'
   OR CAST(admission_date AS CHAR) = ''
   OR CAST(discharge_date AS CHAR) = '0000-00-00'
   OR CAST(discharge_date AS CHAR) = ''
   OR (
        admission_date IS NOT NULL
        AND DATE_FORMAT(admission_date, '%Y-%m-%d') IS NULL
      )
   OR (
        discharge_date IS NOT NULL
        AND DATE_FORMAT(discharge_date, '%Y-%m-%d') IS NULL
      )
   OR discharge_date < admission_date;

COMMIT;

SELECT *
FROM admissions
WHERE admission_date IS NULL
   OR discharge_date IS NULL
   OR discharge_date < admission_date;


START TRANSACTION;

DELETE FROM billing
WHERE treatment_id IN (
    SELECT treatment_id
    FROM (
        SELECT treatment_id
        FROM treatments
        WHERE treatment_date > CURRENT_DATE
           OR treatment_date IS NULL
           OR CAST(treatment_date AS CHAR) = '0000-00-00'
           OR CAST(treatment_date AS CHAR) = ''
           OR (
                treatment_date IS NOT NULL
                AND DATE_FORMAT(treatment_date, '%Y-%m-%d') IS NULL
              )
    ) AS invalid_treatments
);

DELETE FROM treatments
WHERE treatment_date > CURRENT_DATE
   OR treatment_date IS NULL
   OR CAST(treatment_date AS CHAR) = '0000-00-00'
   OR CAST(treatment_date AS CHAR) = ''
   OR (
        treatment_date IS NOT NULL
        AND DATE_FORMAT(treatment_date, '%Y-%m-%d') IS NULL
      );

COMMIT;

DELETE FROM billing
WHERE bill_date > CURRENT_DATE
   OR bill_date IS NULL
   OR CAST(bill_date AS CHAR) = '0000-00-00'
   OR CAST(bill_date AS CHAR) = ''
   OR (
        bill_date IS NOT NULL
        AND DATE_FORMAT(bill_date, '%Y-%m-%d') IS NULL
      );


-- Check Unexpected Categories

SELECT DISTINCT gender FROM patients;
SELECT DISTINCT patient_type FROM patients;
SELECT DISTINCT shift FROM doctors;

SELECT DISTINCT appointment_type FROM appointments;
SELECT DISTINCT appointment_status FROM appointments;

SELECT DISTINCT visit_type FROM visits;

SELECT DISTINCT admission_type FROM admissions;
SELECT DISTINCT bed_type FROM admissions;

SELECT DISTINCT treatment_type FROM treatments;
SELECT DISTINCT treatment_status FROM treatments;

SELECT DISTINCT service_type FROM billing;
SELECT DISTINCT payment_status FROM billing;

SELECT DISTINCT department_type FROM departments;

-- Fix

UPDATE patients
SET gender = 'Male'
WHERE LOWER(gender) = 'male';

UPDATE patients
SET gender = NULL
WHERE gender NOT IN ('Male', 'Female', 'Other');

UPDATE patients
SET patient_type = 'Returning'
WHERE LOWER(patient_type) = 'returning';


UPDATE doctors
SET shift = 'Morning'
WHERE LOWER(shift) = 'morning';

UPDATE appointments
SET appointment_type = 'Follow-up'
WHERE LOWER(appointment_type) = 'follow up';

UPDATE appointments
SET appointment_status = 'Completed'
WHERE LOWER(appointment_status) = 'complete';

SELECT DISTINCT appointment_status
FROM appointments;

-- Check Invalid Foreign Keys

SELECT a.*
FROM appointments a
LEFT JOIN patients p
ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

SELECT v.*
FROM visits v
LEFT JOIN patients p
ON v.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

SELECT v.*
FROM visits v
LEFT JOIN patients p
ON v.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

SELECT v.*
FROM visits v
LEFT JOIN doctors d
ON v.doctor_id = d.doctor_id
WHERE d.doctor_id IS NULL;

SELECT v.*
FROM visits v
LEFT JOIN departments dp
ON v.department_id = dp.department_id
WHERE dp.department_id IS NULL;

SELECT a.*
FROM admissions a
LEFT JOIN patients p ON a.patient_id = p.patient_id
LEFT JOIN departments d ON a.department_id = d.department_id
WHERE p.patient_id IS NULL
   OR d.department_id IS NULL;
   
SELECT b.*
FROM billing b
LEFT JOIN patients p
ON b.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

SELECT b.*
FROM billing b
LEFT JOIN treatments t
ON b.treatment_id = t.treatment_id
WHERE t.treatment_id IS NULL;


-- Incorrect Length of Stay

SELECT *
FROM admissions
WHERE length_of_stay <>
      DATEDIFF(discharge_date, admission_date);
      
UPDATE admissions
SET length_of_stay =
    DATEDIFF(discharge_date, admission_date)
WHERE length_of_stay <>
      DATEDIFF(discharge_date, admission_date);

SELECT a.*
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
WHERE a.appointment_date < p.registration_date;

-- CHECK Appointment before Registration
SELECT a.*
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
WHERE a.appointment_date < p.registration_date;

-- Check Billing Rule Violations
-- Amount = Insurance Amount + Patient Amount

SELECT *
FROM billing
WHERE ROUND(amount, 2) <>
      ROUND(insurance_amount + patient_amount, 2);

-- Check impossible values:

SELECT *
FROM billing
WHERE insurance_amount > amount
   OR patient_amount > amount;
   
-- FIX First ensure insurance does not exceed total:

UPDATE billing
SET insurance_amount = amount
WHERE insurance_amount > amount;

-- calculate the patient amount:

UPDATE billing
SET patient_amount =
    ROUND(amount - insurance_amount, 2);

-- Re-check:

SELECT *
FROM billing
WHERE ROUND(amount, 2) <>
      ROUND(insurance_amount + patient_amount, 2);
      




