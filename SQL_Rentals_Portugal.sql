create schema portugal_rentals;

CREATE TABLE rentals (
   rental_id int DEFAULT NULL,
   title text,
   price double DEFAULT NULL,
   metros2 double DEFAULT NULL,
   location text,
   rooms int DEFAULT NULL,
   region text
  );

# Imported the Data using the import wizzard

# checking the data making sure everything looks good 
use portugal_rentals;
select * 
from rentals;

# The name of the first column came as MyKnownColumn so here im changing it the rental_id 
Alter table rentals rename column MyUnknownColumn to rental_id;

# I noticed that some of the listing were for sale instead of for rent. There were a total of 16 listing 
# for sale in the dataset. So here im deleting all the listing that has a price above 10,000.
SELECT *
FROM rentals 
WHERE price > 10000;

DELETE FROM rentals
WHERE price > 10000;

# Here im modifying the metros2 and price column to have 2 decimal places. Makes it look better. 
ALTER TABLE rentals MODIFY COLUMN metros2 DECIMAL(20,2);
ALTER TABLE rentals MODIFY COLUMN price DECIMAL(20,2);


#_________________________________________________________________________________________________________


# Here im creating a new table only for the rental properties in the Porto area. 
# Porto is where ive lived the most and i wanted to go more in depth for the Porto region. 

CREATE SCHEMA porto_rentals;
use porto_rentals;

Create table porto (
	rental_id int DEFAULT NULL,
    title text,
    price double DEFAULT NULL,
    metros2 double DEFAULT NULL,
    location text,
    rooms int DEFAULT NULL,
    region text
);


Insert into porto_rentals.porto (rental_id, title, price, metros2, location, rooms, region)
Select rental_id, title, price, metros2, location, rooms, region
FROM portugal_rentals.rentals
WHERE region = ' Porto';













