DROP TABLE toppings;
CREATE TABLE toppings (
	toppings TEXT PRIMARY KEY,
	num_total INT,
	num_male INT,
	num_female INT
);

DROP TABLE restaurant_chains;
CREATE TABLE restaurant_chains (
	restaurant_id INT PRIMARY KEY,
	restaurant_name VARCHAR,
	count INT
);

DROP TABLE restaurant_location;
CREATE TABLE restaurant_location (
	restaurant_id INT PRIMARY KEY,
	restaurant_name VARCHAR,
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
	restaurant_id INT PRIMARY KEY,
	restaurant_name VARCHAR,
	price_range_min FLOAT,
	price_range_max FLOAT
);

-- SELECT * FROM restaurant_location
-- JOIN price_range
-- ON restaurant_location.restaurant_name = price_range.restaurant_name;

ALTER TABLE restaurant_location 
ADD CONSTRAINT restaurant_name FOREIGN KEY(restaurant_name)
REFERENCES restaurant_chains(restaurant_name);

ALTER TABLE price_range
ADD CONSTRAINT restaurant_name FOREIGN KEY (restaurant_name)
REFERENCES restaurant_chains (restaurant_name);

ALTER TABLE restaurant_location
ADD CONSTRAINT restaurant_id FOREIGN KEY (restaurant_id)
REFERENCES price_range(restaurant_id);

