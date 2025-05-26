-- Active: 1747404131005@@127.0.0.1@5432@conservation_db


-- create rangers table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    region VARCHAR(50) NOT NULL
);    

-- create species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(20) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE,
    conservation_status TEXT CHECK(conservation_status IN ('Endangered', 'Vulnerable', 'Historic'))
);

-- create sightings table
CREATE TABLE sightings (
     sighting_id SERIAL PRIMARY KEY,
     species_id INT REFERENCES species(species_id),
     ranger_id INT REFERENCES rangers(ranger_id),
     location VARCHAR(30) NOT NULL,
    --  sighting_time TIMESTAMP,
     sighting_time TIMESTAMP without time zone,
     notes TEXT
);

-- insert data in rangers table
INSERT INTO rangers(name, region)
VALUES
    ('Alice Green', 'Northern Hills'),
    ('Bob White', 'River Delta'),
    ('Carol King', 'Mountain Range');

-- insert data in species table
INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status)
VALUES
    ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
    ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
    ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
    ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

-- insert data in sightings table
INSERT INTO sightings(species_id, ranger_id, location, sighting_time, notes)
VALUES
    (1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
    (2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
    (3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
    (1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL );


-- Display data from all tables
SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;


-- Problem 1
INSERT INTO rangers (name, region) VALUES('Derek Fox', 'Coastal Plains');

-- Problem 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;

-- Problem 3
SELECT * from sightings WHERE LOCATION ILIKE '%Pass';

-- Problem 4
SELECT name, count(ranger_id) as total_sightings from sightings
    JOIN rangers USING(ranger_id)
    GROUP BY name;

-- Problem 5
SELECT common_name FROM species
    WHERE species_id NOT in(SELECT species_id from sightings);

-- Problem 6
SELECT Common_name, sighting_time, name FROM sightings
    JOIN rangers USING(ranger_id)
    JOIN species USING(species_id)
    ORDER BY sighting_time DESC
    LIMIT 2;

-- Problem 7
UPDATE species
    SET conservation_status = 'Historic'
    WHERE EXTRACT(YEAR FROM discovery_date) < 1800;

-- Problem 8
SELECT sighting_id,
CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
END AS time_of_day
FROM sightings;

-- Problem 9
DELETE FROM rangers
    WHERE ranger_id NOT IN(SELECT ranger_id FROM sightings); 


