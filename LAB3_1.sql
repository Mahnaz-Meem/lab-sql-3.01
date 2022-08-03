USE sakila_demo;
CREATE DATABASE IF NOT EXISTS sakila_demo;
-- Drop column picture from staff.
ALTER TABLE staff
DROP picture;
-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
Select* FROM staff;
SELECT * from customer
where first_name='Tammy' AND last_name= 'Sanders';
-- Brainstorm: staff_id, first_name, last_name, address_id, email, store_id, active, username,password
-- customer: customer_id, store_id, first_name, last_name, email, address_id, active

INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, active, username)
SELECT 3, first_name, last_name, address_id, email, store_id, active, first_name
FROM customer
WHERE customer.first_name = 'Tammy' AND customer.last_name = 'Sanders';

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- customer_id: 130
select film_id from sakila.film
where title = "Academy Dinosaur";
-- film_id: 1
select inventory_id from sakila.inventory
where film_id = 1;
-- inventory_id: 1-8
-- Use similar method to get inventory_id, film_id, and staff_id.

INSERT INTO rental
VALUES
(16050,current_timestamp(),1,130,NULL,1,current_timestamp());
Select * from rental;
-- Activity 2
-- Use dbdiagram.io or draw.io to propose a new structure for the Sakila database.
-- Define primary keys and foreign keys for the new database.