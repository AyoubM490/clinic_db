create table patients (
  id int primary key,
  name varchar(20),
  date_of_birth date
);

create table medical_histories (
  id int primary key,
  admitted_at timestamp,
  patient_id int references patients(id),
  status varchar(20)
);

create table treatments (
  id int primary key,
  type varchar(20),
  name varchar(20)
);

create table invoices (
  id int primary key,
  total_amount decimal(10, 2),
  generate_at timestamp,
  payed_at timestamp,
  medical_history_id int references medical_histories(id)
);

create table invoice_terms (
  id int,
  unit_price decimal(10, 2),
  quantity int,
  total_price decimal(10, 2),
  invoice_id int references invoices(id),
  treatment_id int references treatments(id)
);