
CREATE TABLE sales (
id SERIAL PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30)
);

CREATE TABLE mechanic (
id SERIAL PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR (30)
);


CREATE TABLE service (
id SERIAL PRIMARY KEY, 
service_type VARCHAR(30),
rate NUMERIC(5,2)
);

CREATE TABLE car( 
id SERIAL PRIMARY KEY,
"year" INT,
make VARCHAR(25), 
model VARCHAR(25),
color VARCHAR(25),
in_inventory BOOL,
customer_id INT
--FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer ( 
id SERIAL PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(30),
email VARCHAR(100),
phone VARCHAR(13),
car_id INT
--FOREIGN KEY (car_id) REFERENCES car(id)
);


CREATE TABLE invoice ( 
id SERIAL PRIMARY KEY,
"date" VARCHAR(10),
customer_id INT,
sales_id INT,
car_id INT,
FOREIGN KEY (customer_id) REFERENCES customer(id),
FOREIGN KEY (sales_id) REFERENCES sales(id),
FOREIGN KEY (car_id) REFERENCES car(id)
);

CREATE TABLE service_ticket ( 
id SERIAL PRIMARY KEY, 
car_id INT,
customer_id INT,
service_id INT,
mechanic_id INT,
notes TEXT,
date_completed VARCHAR(10),
FOREIGN KEY (mechanic_id) REFERENCES mechanic(id),
FOREIGN KEY (car_id) REFERENCES car(id),
FOREIGN KEY (customer_id) REFERENCES customer(id),
FOREIGN KEY (service_id) REFERENCES service(id)
);


ALTER TABLE customer 
ADD FOREIGN KEY (car_id) REFERENCES car(id);

ALTER TABLE car 
ADD FOREIGN KEY (customer_id) REFERENCES customer(id); 
