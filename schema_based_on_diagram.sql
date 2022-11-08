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

CREATE TABLE medical_hitories_treatments(
  treatments_id INT,
  medical_hitories_id INT,
  PRIMARY KEY(treatments_id,medical_hitories_id),
  FOREIGN key (treatments_id) REFERENCES treatments(id),
  FOREIGN key (medical_hitories_id) REFERENCES medical_histories(id)
);
CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL(5,2),
  quantity INT,
  total_price DECIMAL(3,4),
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY(id),
  FOREIGN key (invoice_id) REFERENCES invoices(id),
  FOREIGN key (treatment_id) REFERENCES treatments(id)
);
