CREATE TABLE data (
    data_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    value NUMERIC,
    description TEXT,
    is_valid BOOLEAN
);

INSERT INTO data (name, value, description, is_valid)
VALUES
('Data1', 10.5, 'First data record', TRUE),
('Data2', 25.8, 'Second data record', FALSE),
('Data3', 18.2, 'Third data record', TRUE);

-- Create the "universe" database
CREATE DATABASE universe;

-- Connect to the "universe" database
\c universe

-- Create the "galaxy" table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    size INT,
    age_in_millions_of_years INT,
    has_black_hole BOOLEAN
);

-- Insert data into the "galaxy" table
INSERT INTO galaxy (name, size, age_in_millions_of_years, has_black_hole) VALUES
('Milky Way', 100000, 13000, TRUE),
('Andromeda', 120000, 14000, FALSE),
('Triangulum', 50000, 10000, FALSE),
('Sombrero', 8000, 12000, TRUE),
('Whirlpool', 6000, 9000, FALSE),
('Pinwheel', 7000, 11000, FALSE);

-- Create the "star" table with a foreign key referencing "galaxy"
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    temperature INT,
    mass NUMERIC,
    is_supernova BOOLEAN,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

-- Insert data into the "star" table
INSERT INTO star (name, temperature, mass, is_supernova, galaxy_id) VALUES
('Sun', 5778, 1.989 * 10^30, FALSE, 1),
('Alpha Centauri', 5790, 2.18 * 10^30, FALSE, 1),
('Sirius', 9940, 2.02 * 10^30, FALSE, 1),
('Betelgeuse', 3500, 1.8 * 10^31, FALSE, 4),
('Vega', 9600, 2.45 * 10^30, FALSE, 1),
('Antares', 3600, 1.35 * 10^31, FALSE, 6);

-- Create the "planet" table with a foreign key referencing "star"
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    type TEXT,
    distance_from_star NUMERIC,
    has_water BOOLEAN,
    star_id INT REFERENCES star(star_id)
);

-- Insert data into the "planet" table
INSERT INTO planet (name, type, distance_from_star, has_water, star_id) VALUES
('Earth', 'Terrestrial', 147.3 * 10^6, TRUE, 1),
('Mars', 'Terrestrial', 227.9 * 10^6, FALSE, 1),
('Jupiter', 'Gas Giant', 778.3 * 10^6, FALSE, 1),
('Saturn', 'Gas Giant', 1.4 * 10^9, FALSE, 1),
('Neptune', 'Ice Giant', 4.5 * 10^9, FALSE, 1),
('Uranus', 'Ice Giant', 2.9 * 10^9, FALSE, 1),
('Proxima Centauri b', 'Terrestrial', 4.24, TRUE, 2),
('Alpha Centauri Bb', 'Gas Giant', 0.04, FALSE, 2),
('Gliese 581g', 'Terrestrial', 20.3, TRUE, 2),
('55 Cancri e', 'Terrestrial', 0.015, FALSE, 3),
('HD 209458 b', 'Gas Giant', 0.047, FALSE, 3),
('Kepler-22b', 'Terrestrial', 587, TRUE, 3);

-- Create the "moon" table with a foreign key referencing "planet"
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    radius INT,
    has_atmosphere BOOLEAN,
    planet_id INT REFERENCES planet(planet_id)
);

-- Insert data into the "moon" table
INSERT INTO moon (name, radius, has_atmosphere, planet_id) VALUES
('Luna', 1737, FALSE, 1),
('Phobos', 11, FALSE, 2),
('Ganymede', 2634, FALSE, 3),
('Titan', 2576, TRUE, 4),
('Triton', 1353, TRUE, 5),
('Europa', 1560, TRUE, 1),
('Deimos', 6, FALSE, 2),
('Enceladus', 252, TRUE, 4),
('Io', 1821, TRUE, 3),
('Callisto', 2400, FALSE, 3),
('Oberon', 761, FALSE, 6),
('Charon', 606, FALSE, 5),
('Miranda', 235, FALSE, 6),
('Phoebe', 106, FALSE, 5),
('Dione', 561, FALSE, 4),
('Rhea', 764, FALSE, 4),
('Mimas', 198, FALSE, 4),
('Ariel', 578, FALSE, 6),
('Umbriel', 584, FALSE, 6),
('Titania', 788, FALSE, 6),
('Iapetus', 734, FALSE, 4);
