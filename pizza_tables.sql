DROP TABLE toppings;
CREATE TABLE toppings (
	toppings TEXT PRIMARY KEY,
	num_total INT,
	num_male INT,
	num_female INT
);

DROP TABLE restaurant_chains;
CREATE TABLE restaurant_chains (
	chain_id INT PRIMARY KEY,
	restaurant_name VARCHAR,
	count INT
);

DROP TABLE restaurant_location;
CREATE TABLE restaurant_location (
	location_id INT PRIMARY KEY,
	restaurant_id INT,
	restaurant_address VARCHAR,
	city VARCHAR,
	country VARCHAR,
	latitude FLOAT,
	longitude FLOAT,
	postal_code VARCHAR,
	province VARCHAR
);

DROP TABLE price_range;
CREATE TABLE price_range(
	location_id INT PRIMARY KEY,
	price_range_min FLOAT,
	price_range_max FLOAT
);

ALTER TABLE restaurant_location 
ADD CONSTRAINT restaurant_id FOREIGN KEY(restaurant_id)
REFERENCES restaurant_chains(chain_id);

ALTER TABLE restaurant_location
ADD CONSTRAINT location_id FOREIGN KEY (location_id)
REFERENCES price_range(location_id);



