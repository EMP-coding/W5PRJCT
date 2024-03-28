
--Creating a stored procedure to add cars to car
CREATE OR REPLACE PROCEDURE add_car ("year" INT, make VARCHAR, model VARCHAR, color VARCHAR, in_inventory BOOL, customer_id INT)
LANGUAGE plpgsql 
AS $$
BEGIN 
	INSERT INTO car( "year", make, model, color, in_inventory, customer_id)
	VALUES ("year", make, model, color, in_inventory, customer_id);
END;
$$;

--Base reqs
--CALL add_car(:year, :make, :model, :color, :in_inventory, :inventory_id, :customer_id) 


CALL add_car(2006, 'Suzuki', 'Verona', 'Beige', TRUE, NULL);

CALL add_car(2015, 'Ford', 'C-MAX', 'Olive', TRUE, NULL);

CALL add_car(2006, 'GMC', 'Canyon', 'DarkSlateBlue', TRUE, NULL);

CALL add_car(1999, 'Mercury', 'Sable', 'MediumSlateBlue', TRUE, NULL);

CALL add_car(2010, 'Ford', 'F150', 'Pink', TRUE, NULL);

CALL add_car(2019, 'Nissan', 'NV3500', 'LightSkyBlue', TRUE, NULL);

CALL add_car(1998, 'Dodge', 'Neon', 'SandyBrown', TRUE, NULL);

CALL add_car(2010, 'Honda', 'Ridgeline', 'DarkOrange', TRUE, NULL);

CALL add_car(1999, 'Toyota', 'Camry', 'GhostWhite', TRUE, NULL);

CALL add_car(2013, 'Lexus', 'ES', 'AntiqueWhite', TRUE, NULL);

CALL add_car( 2001, 'Buick', 'Regal', 'LightBlue', TRUE, NULL);

CALL add_car(2008, 'Chevrolet', 'Tahoe', 'DarkGoldenRod', TRUE, NULL);

CALL add_car(2014, 'Freightliner', 'Sprinter', 'LightSlateGray', TRUE, NULL);


-- Adding a few customers 
INSERT INTO customer (first_name, last_name, email, phone)
VALUES ('Taylor', 'Clark', 'tedwards@example.org', '630-256-2695');

INSERT INTO customer (first_name, last_name, email, phone)
VALUES ('Valerie', 'Lee', 'christinawilliams@example.net', '405-800-5993'), 
('Paul', 'Thomas', 'shannonjensen@example.org', '706-225-6346'),
('Jennifer', 'Miles', 'emmabaker@example.net', '939-354-4908'),
('Ann', 'Hicks', 'tony94@example.net', '933-388-0833'),
('Dawn', 'Raymond', 'fcarey@example.com', '380-667-0689'),
('Sarah', 'Huber', 'jasongrant@example.org', '708-251-7748');

-- Adding some customer vehicles 
CALL add_car(2005, 'Toyota', '4Runner', 'MediumTurquoise', FALSE, 3);

CALL add_car(2009, 'Buick', 'LaCrosse', 'PaleGreen', FALSE, 6);

CALL add_car(2008, 'Saturn', 'SKY', 'DarkOliveGreen', FALSE, 7);


--Procedure to add sales employee

CREATE OR REPLACE PROCEDURE add_sales (first_name VARCHAR, last_name VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO sales(first_name, last_name)
	VALUES (first_name, last_name);
END;
$$;

--Procedure to add mechanic employee 

CREATE OR REPLACE PROCEDURE add_mechanic(first_name VARCHAR, last_name VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO mechanic(first_name, last_name)
	VALUES (first_name, last_name);
END;
$$;

-- Adding Employees

CALL add_mechanic('Jared', 'Gilber');
CALL add_mechanic('Christopher', 'Garcia');
CALL add_sales('Kathryn', 'Jones');
CALL add_sales('Lori', 'Beasley');
CALL add_mechanic('Ronald', 'Doyle'); 
CALL add_mechanic('Austin', 'Rios');
CALL add_sales('Steven', 'Reid');
CALL add_sales('William', 'Jarvis');


INSERT INTO service(service_type, rate)
VALUES ('oil change', 39.99);

INSERT INTO service_ticket (car_id, customer_id, service_id, mechanic_id, notes, date_completed)
VALUES (2, 3, 1, 2, 'Oil drained and replacd. Breaks checked. Good to go.', '03/24/2024');

INSERT INTO service(service_type, rate)
VALUES ('tire rotation and alignment', 99.99);

INSERT INTO service_ticket (car_id, customer_id, service_id, mechanic_id, notes, date_completed)
VALUES (3, 6, 2, 4, 'passenger side showing excessive wear', '03/24/2024');

INSERT INTO invoice ("date", customer_id, sales_id, car_id)
VALUES ('3/26/24', 5, 2, 5);

INSERT INTO invoice ("date", customer_id, sales_id, car_id)
VALUES ('3/25/24', 4, 1, 13);



-- Verifying data in each table

SELECT * FROM car;
SELECT * FROM customer;
SELECT * FROM invoice;
SELECT * FROM mechanic; -- Works but red, underlined, and italicized???? Maybe just a dbeaver error? 
SELECT * FROM sales;    -- 						//
SELECT * FROM service;
SELECT * FROM service_ticket;


















