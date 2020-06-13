-- Creating toppings table

DROP TABLE toppings_df

CREATE TABLE toppings_df(
	toppings VARCHAR,
	male_total INT,
	female_total INT,
	grand_total INT
);

-- Creating "restaraunt_chains_df" table

DROP TABLE restaurant_chains_df

CREATE TABLE restaurant_chains_df(
	restaurant_name VARCHAR,
	count INT
);

-- Creating "location_df" table

DROP TABLE location_df

CREATE TABLE location_df(
		location_id	INT,
		restaurant_name VARCHAR,
		restaurant_address VARCHAR,	
		latitude DECIMAL,
		longitude DECIMAL,
		city VARCHAR,
		postal_code	VARCHAR,
		country	VARCHAR	
);

-- Creating "price_range_df" table

CREATE TABLE price_range_df(
	location_id INT,
	price_range_min INT,
	price_range_max INT
);
-- Review data to ensure import was successful. 

SELECT * FROM toppings_df
SELECT * FROM restaurant_chains_df
SELECT * FROM location_df
SELECT * FROM price_range_df

-- Join tables to create database and create view once complete.
DROP VIEW final_pizza_db

CREATE VIEW final_pizza_db AS
SELECT ldf.location_id AS "Location ID" , rcdf.restaurant_name AS "Restaurant Name", 
ldf.restaurant_address AS "Restaurant Address", rcdf.count AS "Rest. Chain Count", 
ldf.latitude AS "Latitude", ldf.longitude AS "Longitude", ldf.city AS "City", 
ldf.postal_code	as "Postal Code", country AS "Country", 
prdf.price_range_min AS "Min Price Range" , prdf.price_range_max AS "Max Price Range"
FROM restaurant_chains_df AS rcdf
JOIN location_df AS ldf ON
ldf.restaurant_name = rcdf.restaurant_name
JOIN price_range_df AS prdf ON
ldf.location_id = prdf.location_id

-- Convert view to table. 
DROP TABLE final_pizza_database

CREATE TABLE final_pizza_database AS 
SELECT * FROM final_pizza_db

-- Review final database before importing to Pandas. 
SELECT * FROM final_pizza_database
