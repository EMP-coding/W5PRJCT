
SELECT * FROM car
--Creating a stored procedure to add cars to car
CREATE OR REPLACE PROCEDURE add_car (vin VARCHAR, "year" INT, make VARCHAR, model VARCHAR, color VARCHAR, in_inventory BOOL, inventory_id INT, customer_id INT )
LANGUAGE plpgsql 
AS $$
BEGIN 
	INSERT INTO car(vin, "year", make, model, color, in_inventory, inventory_id, customer_id)
	VALUES (vin, "year", make, model, color, in_inventory, inventory_id, customer_id);
END;
$$;


--Adding data -- Using faker in python and found how to add a trigger so that a car will automatically be entered into the inventory unless it has a customer_id. 
-- That being said it created a mess so I ended up deleting it...I think I will just create a procedure to add all cars with customer_id NULL to inventory after the fact instead of trying to get the trigger to automatically do it. 


--Base reqs

CALL add_car(:vin, :year, :make, :model, :color, :in_inventory, :inventory_id, :customer_id) 
-- Adding Cars. Used faker in python to print out an f'string to easily past in call function. 

--										EXAMPLE:

--	(venv) PS C:\Users\ethan\Documents\codingtemple\week5\W5PRJCT> py data_generations 
-- 	33MFRS6TXBVKRBJVJ ['2006', 'Hyundai', 'Elantra'] Gold
--  CALL add_car('33MFRS6TXBVKRBJVJ', 2006, 'Hyundai', 'Elantra', 'Gold', TRUE, NULL, NULL)

CALL add_car('0ASNGG5M2CZU8Z3TX', 2006, 'Suzuki', 'Verona', 'Beige', TRUE, NULL, NULL)

CALL add_car('4SFH6TZWXK1RJYZW3', 2015, 'Ford', 'C-MAX', 'Olive', TRUE, NULL, NULL)

CALL add_car('E7YMKRCE4T93JRWM0', 2006, 'GMC', 'Canyon', 'DarkSlateBlue', TRUE, NULL, NULL)

CALL add_car('BEVU2PL05VF0P95EL', 1999, 'Mercury', 'Sable', 'MediumSlateBlue', TRUE, NULL, NULL)

CALL add_car('X01RJ6RF97AAC2AGW', 2010, 'Ford', 'F150', 'Pink', TRUE, NULL, NULL)

CALL add_car('LD71NV7S3H2BAFGSK', 2019, 'Nissan', 'NV3500', 'LightSkyBlue', TRUE, NULL, NULL)

CALL add_car('9MP0WECU9ZTNAR23P', 1998, 'Dodge', 'Neon', 'SandyBrown', TRUE, NULL, NULL)

CALL add_car('7AKKWG6FXUXVH4TEB', 2010, 'Honda', 'Ridgeline', 'DarkOrange', TRUE, NULL, NULL)

CALL add_car('GJ6RYBVJ4KCGHCR6F', 1999, 'Toyota', 'Camry', 'GhostWhite', TRUE, NULL, NULL) -
CALL add_car('6CGAY494XPVMTEKAX', 2013, 'Lexus', 'ES', 'AntiqueWhite', TRUE, NULL, NULL)

CALL add_car('SPJ235AF0Y713CLGP', 2001, 'Buick', 'Regal', 'LightBlue', TRUE, NULL, NULL)

CALL add_car('6F2BAKD6610KDVFDH', 2008, 'Chevrolet', 'Tahoe', 'DarkGoldenRod', TRUE, NULL, NULL)

CALL add_car('3JY29ZJ395GZTZ29G', 2014, 'Freightliner', 'Sprinter', 'LightSlateGray', TRUE, NULL, NULL)

CALL add_car('RT3SEVL085W8WM76J', 2005, 'Toyota', '4Runner', 'MediumTurquoise', TRUE, NULL, NULL)

SELECT * FROM car 


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
CALL add_car('RT3SEVL085W8WM76J', 2005, 'Toyota', '4Runner', 'MediumTurquoise', FALSE, NULL, 3)

CALL add_car('4M371SNZ9YDCZPV6R', 2009, 'Buick', 'LaCrosse', 'PaleGreen', FALSE, NULL, 6)

CALL add_car('3AD6BV9A1ALYA7N54', 2008, 'Saturn', 'SKY', 'DarkOliveGreen', FALSE, NULL, 7)


SELECT * FROM customer


SELECT * FROM car

-- Adding 2 departments 
SELECT * FROM department d 

INSERT INTO department (department_name)
VALUES ('Sales'), ('Service');

-- Creating procedure to add employee 

CREATE OR REPLACE PROCEDURE add_employee (first_name VARCHAR, last_name VARCHAR, department_id INT)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO employee(first_name, last_name, department_id)
	VALUES (first_name, last_name, department_id);
END;
$$;

-- Adding Employees

CALL add_employee('Jared', 'Gilbert', 2);
CALL add_employee('Christopher', 'Garcia', 2);
CALL add_employee('Kathryn', 'Jones', 1);
CALL add_employee('Lori', 'Beasley', 1);
CALL add_employee('Ronald', 'Doyle', 1); 
CALL add_employee('Austin', 'Rios', 2);
CALL add_employee('Steven', 'Reid', 2);
CALL add_employee('William', 'Jarvis', 1);

 --Verifying
SELECT * FROM employee e

-- Created stored procedure to add all cars that have a customer_id of NULL to inventory 
CREATE OR REPLACE PROCEDURE add_cars_to_inventory()
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO inventory (car_vin)
    SELECT vin
    FROM Car
    WHERE customer_id IS NULL;
END;
$$;

CALL add_cars_to_inventory();
--Verifying
SELECT * FROM inventory;
SELECT * FROM car;
SELECT * FROM customer;
SELECT * FROM employee e ;

--Need to add data to service_mechanic, service_ticket, invoice. 

SELECT * FROM service_ticket*
('RT3SEVL085W8WM76J', 2005, 'Toyota', '4Runner', 'MediumTurquoise', FALSE, NULL, 3)

('4M371SNZ9YDCZPV6R', 2009, 'Buick', 'LaCrosse', 'PaleGreen', FALSE, NULL, 6)

('3AD6BV9A1ALYA7N54', 2008, 'Saturn', 'SKY', 'DarkOliveGreen', FALSE, NULL, 7)

SELECT * FROM customer
JOIN car ON customer.id = car.customer_id ;


INSERT INTO service(service_type, rate)
VALUES ('oil change', 39.99);

INSERT INTO service_ticket (car_vin, customer_id, service_id, notes, date_completed)
VALUES ('RT3SEVL085W8WM76J', 3, 1, 'Oil drained and replaces. Breaks checked. Good to go.', '03/24/2024');

INSERT INTO service_mechanic(service_id, ticket_id, employee_id, hours, note)
VALUES (1, 3, 2, 1,'completed oil change');

INSERT INTO service(service_type, rate)
VALUES ('tire rotation and alignment', 99.99);

INSERT INTO service_ticket (car_vin, customer_id, service_id, notes, date_completed)
VALUES ('4M371SNZ9YDCZPV6R', 6, 2, 'passenger side showing excessive wear', '03/24/2024');




INSERT INTO service_mechanic(service_id, ticket_id, employee_id, hours, note)
VALUES (2, 4, 6, 2,'passenger side showing excessive wear');



SELECT * FROM service_mechanic sm 



















