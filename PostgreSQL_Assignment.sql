
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    region VARCHAR(50) NOT NULL
);    
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(20) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE,
    conservation_status TEXT CHECK(conservation_status IN ('Endangered', 'Vulnerable', 'Historic'))
);
CREATE TABLE sightings (
     sighting_id SERIAL PRIMARY KEY,
     species_id INT REFERENCES species(species_id),
     ranger_id INT REFERENCES rangers(ranger_id),
     location VARCHAR(30) NOT NULL,
    --  sighting_time TIMESTAMP,
     sighting_time TIMESTAMP without time zone,
     notes TEXT
);
INSERT INTO rangers(name, region)
VALUES
    ('Alice Green', 'Northern Hills'),
    ('Bob White', 'River Delta'),
    ('Carol King', 'Mountain Range');
SELECT * FROM rangers;
INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status)
VALUES
    ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
    ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
    ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
    ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
SELECT * FROM species;
INSERT INTO sightings(species_id, ranger_id, location, sighting_time, notes)
VALUES
    (1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
    (2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
    (3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
    (1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL );
SELECT * FROM sightings;
DROP TABLE sightings;

-- Problem1 1
-- Problem1 1


ALTER TABLE species
    DROP COLUMN conservation_status;
ALTER TABLE species
    ADD COLUMN conservation_status TEXT CHECK(conservation_status IN ('Endangered', 'Vulnerable', 'Historic'));
TRUNCATE TABLE species;
TRUNCATE TABLE sightings;
SELECT * FROM species;
SELECT * FROM sightings;


-- 🐆 1. Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (name, region) VALUES('Derek Fox', 'Coastal Plains');

-- 2. Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;

-- 🐆 3. Find all sightings where the location includes "Pass".
SELECT * from sightings WHERE LOCATION ILIKE '%Pass';

-- 🐆 4. List each ranger's name and their total number of sightings
SELECT name, count(ranger_id) from sightings
    JOIN rangers USING(ranger_id)
    GROUP BY name;

-- 🐆 5. List species that have never been sighted
SELECT common_name FROM species
    WHERE species_id NOT in(SELECT species_id from sightings);

-- 🐆 6. Show the most recent 2 sightings 
SELECT Common_name, sighting_time, name FROM sightings
    JOIN rangers USING(ranger_id)
    JOIN species USING(species_id)
    ORDER BY sighting_time DESC
    LIMIT 2;

-- 🐆 7. Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
    SET conservation_status = 'Historic'
    WHERE EXTRACT(YEAR FROM discovery_date) < 1800;

--  8. Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT sighting_id,
CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
END AS time_of_day
FROM sightings;

-- 🐆 9. Delete rangers who have never sighted any species
DELETE FROM rangers
    WHERE ranger_id NOT IN(SELECT ranger_id FROM sightings); 


