
CREATE TABLE department (
id SERIAL PRIMARY KEY,
department_name VARCHAR(30)
);

CREATE TABLE employee (
id SERIAL PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
department_id INT,
FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE service (
id SERIAL PRIMARY KEY, 
service_type VARCHAR(30),
rate NUMERIC(5,2)
);

CREATE TABLE car( 
vin VARCHAR(17) PRIMARY KEY,
"year" INT,
make VARCHAR(25), 
model VARCHAR(25),
color VARCHAR(25),
in_inventory BOOL,
inventory_id INT,
customer_id INT
--FOREIGN KEY (inventory_id) REFERENCES inventory(id)
--FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer ( 
id SERIAL PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(30),
email VARCHAR(100),
phone VARCHAR(13),
car_vin VARCHAR(17)
--FOREIGN KEY (car_vin) REFERENCES car(vin)
);

CREATE TABLE inventory ( 
id SERIAL PRIMARY KEY, 
is_used BOOL,
car_vin VARCHAR(17),
FOREIGN KEY (car_vin) REFERENCES car(vin)
);

CREATE TABLE invoice ( 
id SERIAL PRIMARY KEY,
"total" NUMERIC(9,2),
"date" VARCHAR(10),
customer_id INT,
employee_id INT,
FOREIGN KEY (customer_id) REFERENCES customer(id),
FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE service_ticket ( 
id SERIAL PRIMARY KEY, 
car_vin VARCHAR(17),
customer_id INT,
service_id INT,
notes TEXT,
date_completed VARCHAR(10),
FOREIGN KEY (car_vin) REFERENCES car(vin),
FOREIGN KEY (customer_id) REFERENCES customer(id),
FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_mechanic (
id SERIAL PRIMARY KEY,
service_id INT,
ticket_id INT,
employee_id INT,
hours INT,
note TEXT,
FOREIGN KEY (service_id) REFERENCES service(id),
FOREIGN KEY (ticket_id) REFERENCES service_ticket(id),
FOREIGN KEY (employee_id) REFERENCES employee(id)
);

ALTER TABLE customer 
ADD FOREIGN KEY (car_vin) REFERENCES car(vin);

ALTER TABLE car 
ADD FOREIGN KEY (inventory_id) REFERENCES inventory(id),
ADD FOREIGN KEY (customer_id) REFERENCES customer(id); 
