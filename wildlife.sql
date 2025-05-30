--Creating Raners Table
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(100) NOT NULL
);

--Creating Species Table
CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) CHECK (conservation_status IN('Endangered', 'Vulnerable', 'Historic'))
);

-- Creating Sightings
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(150) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT
);

--Rangers table data insert
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');


--Species data add
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


--Sightings data add
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);




--Problem:1 Adding New Ranger
INSERT INTO rangers(name, region) VALUES(
    'Derek Fox', 'Coastal Plains'
);

--Problem:2 Unique Species Counting
SELECT count(DISTINCT(species_id)) AS unique_species_count FROM sightings;

--Problem:3 Select * sightings where the location includes "Pass".
SELECT * FROM sightings
    WHERE LOCATION LIKE '%Pass%';

--Problem: 4 List each ranger's name and their total number of sightings.
SELECT r.name, count(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name;

-- Problem: 5 List species that have never been sighted.
SELECT common_name FROM species
    WHERE species_id NOT IN (SELECT DISTINCT species_id FROM sightings);

-- Problem: 6 Most recent 2 sightings
SELECT sp.common_name, s.sighting_time, r.name
FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;

--Problem: 7 Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
    set conservation_status = 'Historic'
    WHERE
    discovery_date < '1800-01-01';

--Problem: 8 Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) <12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) <17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

--Problem: 9 Delete rangers who have never sighted any species
DELETE FROM rangers
    WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);
