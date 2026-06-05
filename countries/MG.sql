CREATE TABLE IF NOT EXISTS countries (
  id INTEGER PRIMARY KEY, name VARCHAR(100), name_es VARCHAR(100), iso2 CHAR(2), iso3 CHAR(3),
  region VARCHAR(100), region_es VARCHAR(100), subregion VARCHAR(100), subregion_es VARCHAR(100),
  capital VARCHAR(100), currency VARCHAR(255), latitude DECIMAL(10,8), longitude DECIMAL(11,8), emoji VARCHAR(16)
);
CREATE TABLE IF NOT EXISTS states (
  id INTEGER PRIMARY KEY, name VARCHAR(255), native VARCHAR(255), country_id INTEGER, country_code CHAR(2),
  state_code VARCHAR(10), type VARCHAR(191), type_es VARCHAR(191), latitude DECIMAL(10,8), longitude DECIMAL(11,8)
);
CREATE TABLE IF NOT EXISTS cities (
  id INTEGER PRIMARY KEY, name VARCHAR(255), state_id INTEGER, country_id INTEGER,
  latitude DECIMAL(10,8), longitude DECIMAL(11,8)
);

INSERT INTO countries (id, name, name_es, iso2, iso3, region, region_es, subregion, subregion_es, capital, currency, latitude, longitude, emoji) VALUES
(130, 'Madagascar', 'Madagascar', 'MG', 'MDG', 'Africa', 'África', 'Eastern Africa', 'África Oriental', 'Antananarivo', 'MGA', -20, 47, '🇲🇬');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(2951, 'Antananarivo', 'Antananarivo', 130, 'MG', 'T', 'province', 'provincia', -18.9100122, 47.5255809),
(2950, 'Antsiranana', 'Antsiranana', 130, 'MG', 'D', 'province', 'provincia', -13.7229722, 49.1801836),
(2948, 'Fianarantsoa', 'Fianarantsoa', 130, 'MG', 'F', 'province', 'provincia', -21.91742, 46.8709851),
(2953, 'Mahajanga', 'Mahajanga', 130, 'MG', 'M', 'province', 'provincia', -16.5944104, 46.1719796),
(2952, 'Toamasina', 'Toamasina', 130, 'MG', 'A', 'province', 'provincia', -18.1553985, 49.4098352),
(2949, 'Toliara', 'Toliara', 130, 'MG', 'U', 'province', 'provincia', -23.354173, 43.66966);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(67377, 'Ampasimanolotra', 2950, 130, -18.81667, 49.06667),
(67378, 'Andovoranto', 2950, 130, -18.95443, 49.1094),
(67379, 'Mahanoro', 2950, 130, -19.9, 48.8),
(67380, 'Mahavelona', 2950, 130, -17.68475, 49.50869),
(67381, 'Marolambo', 2950, 130, -20.05, 48.11667),
(67382, 'Toamasina', 2950, 130, -18.1492, 49.40234),
(67383, 'Toamasina I', 2950, 130, -18.13863, 49.39203),
(67384, 'Toamasina II', 2950, 130, -17.94053, 49.14608),
(67385, 'Vohibinany', 2950, 130, -17.35, 49.03333);
