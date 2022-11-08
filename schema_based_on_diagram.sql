CREATE Database clinic_db;

--create patients table:
CREATE TABLE patients(
        id INT GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(150),
        date_of_birth DATE,
        PRIMARY KEY(id));

--create medical_histories table:

CREATE TABLE medical_histories(
        id INT GENERATED ALWAYS AS IDENTITY,
        admitted_at  TIMESTAMP,
        patient_id INT,
        status VARCHAR(250),
        PRIMARY KEY(id),
        FOREIGN KEY(patient_id) REFERENCES patients(id));