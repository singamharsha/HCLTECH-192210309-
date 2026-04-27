-- =====================================================
-- HOSPITAL STAR SCHEMA DDL FOR DATA MODELER
-- =====================================================

CREATE TABLE DIM_PATIENT (
    patient_key NUMBER PRIMARY KEY,
    patient_id VARCHAR(20),
    name VARCHAR(100),
    gender VARCHAR(10),
    city VARCHAR(50),
    state VARCHAR(50),
    insurance_id VARCHAR(30)
);

CREATE TABLE DIM_DOCTOR (
    doctor_key NUMBER PRIMARY KEY,
    doctor_id VARCHAR(20),
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    department VARCHAR(100),
    status VARCHAR(20)
);

CREATE TABLE DIM_DATE (
    date_key NUMBER PRIMARY KEY,
    full_date DATE,
    day_num NUMBER,
    month_num NUMBER,
    year_num NUMBER
);

CREATE TABLE FACT_VISIT_RECORD (
    visit_id VARCHAR(30) PRIMARY KEY,
    patient_key NUMBER,
    doctor_key NUMBER,
    date_key NUMBER,
    amount NUMBER(12,2),
    stay_hours NUMBER,

    CONSTRAINT fk_fact_patient
        FOREIGN KEY (patient_key)
        REFERENCES DIM_PATIENT(patient_key),

    CONSTRAINT fk_fact_doctor
        FOREIGN KEY (doctor_key)
        REFERENCES DIM_DOCTOR(doctor_key),

    CONSTRAINT fk_fact_date
        FOREIGN KEY (date_key)
        REFERENCES DIM_DATE(date_key)
);