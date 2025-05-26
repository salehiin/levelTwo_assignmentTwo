CREATE TABLE test (
    id SERIAL PRIMARY KEY,
    roll UUID DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL,
    age INT check(age >= 18),
    department VARCHAR(20),
    score FLOAT4 check(score >= 0 and score <= 100),
    status BOOLEAN,
    last_login DATE
);
SELECT * FROM test;

DROP TABLE test;




-- 🐆 1. Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (name, region) VALUES('Derek Fox', 'Coastal Plains');
-- UPDATE rangers
--     SET  name = 'Derek Fox', region = 'Coastal Plains'
--         WHERE ranger_id = 4;
SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;

-- 2. Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;
SELECT DISTINCT COUNT(species_id) as unique_species_count FROM sightings
    GROUP BY species_id;
SELECT DISTINCT count(species_id) from sightings
    JOIN species USING(species_id)
    GROUP BY sightings.species_id;   

SELECT species_id, sum(species_id) as unique_species_count FROM sightings GROUP BY species_id;     

-- 🐆 3. Find all sightings where the location includes "Pass".
SELECT * from sightings WHERE LOCATION ILIKE '%Pass';

-- 🐆 4. List each ranger's name and their total number of sightings

SELECT name, count(ranger_id) from sightings
    JOIN rangers USING(ranger_id)
    GROUP BY name;
-- SELECT ranger_id, count(*) from sightings
--     GROUP BY ranger_id;
-- SELECT * from sightings
--     JOIN rangers on sightings.ranger_id = rangers.ranger_id;
-- SELECT * from sightings
--     FULL JOIN rangers on sightings.ranger_id = rangers.ranger_id;

-- 🐆 5. List species that have never been sighted
SELECT common_name FROM species
    WHERE species_id NOT in(SELECT species_id from sightings);

-- 🐆 6. Show the most recent 2 sightings 
SELECT Common_name, sighting_time, name FROM sightings
    JOIN rangers USING(ranger_id)
    JOIN species USING(species_id)
    ORDER BY sighting_time DESC
    LIMIT 2;
--  (CURRENT_DATE - INTERVAL '2 years')
-- NOW() - INTERVAL '2 years'  
SELECT extract(DAY FROM sighting_time) as sighted FROM sightings
    GROUP BY sighted
    limit 2; 

-- 🐆 7. Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
    SET conservation_status = 'Historic'
    WHERE EXTRACT(YEAR FROM discovery_date) < 1800;
    -- WHERE discovery_date < '1800-01-01'::TIMESTAMP;

--  8. Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT sighting_id,
CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
END AS time_of_day
FROM sightings;

-- CASE 
--     WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
--     WHEN EXTRACT(HOUR from sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon' 
--     ELSE  'Evening'
-- END AS time_of_day;
select extract(TIME FROM sighting_time) as time_of_day, count(*)
    FROM sightings
    GROUP BY time_of_day;

-- 🐆 9. Delete rangers who have never sighted any species
DELETE FROM rangers
    WHERE ranger_id NOT IN(SELECT ranger_id FROM sightings); 