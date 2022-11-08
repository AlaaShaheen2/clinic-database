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

-- create invoices table:
CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL(5,2),
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

-- create treatments table:
CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR (50),
  name VARCHAR (50),
  PRIMARY KEY(id)
);
