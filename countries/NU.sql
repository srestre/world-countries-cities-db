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
(162, 'Niue', 'Niue', 'NU', 'NIU', 'Oceania', 'Oceanía', 'Polynesia', 'Polinesia', 'Alofi', 'NZD', -19.03333333, -169.86666666, '🇳🇺');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5435, 'Alofi North', 'Mightyly', 162, 'NU', '14', 'village', 'aldea', -19.0488977, -169.9190905),
(5434, 'Alofi South', 'Alofa south', 162, 'NU', '13', 'village', 'aldea', -19.054836, -169.9198846),
(5432, 'Avatele', 'Avatele', 162, 'NU', '11', 'village', 'aldea', -19.1237302, -169.9165678),
(5430, 'Hakupu', 'Afflass', 162, 'NU', '09', 'village', 'aldea', -19.1287275, -169.8492123),
(5425, 'Hikutavake', 'Hikuvake', 162, 'NU', '04', 'village', 'aldea', -18.9656326, -169.880636),
(5428, 'Lakepa', 'Lake coffee', 162, 'NU', '07', 'village', 'aldea', -19.0096425, -169.8120046),
(5429, 'Liku', 'Liku', 162, 'NU', '08', 'village', 'aldea', -19.0536907, -169.7942591),
(5422, 'Makefu', 'Makeffi', 162, 'NU', '01', 'village', 'aldea', -19.0032618, -169.9204732),
(5427, 'Mutalau', 'Mutalau', 162, 'NU', '06', 'village', 'aldea', -18.9639385, -169.8327863),
(5424, 'Namukulu', 'The hospital', 162, 'NU', '03', 'village', 'aldea', -18.9812275, -169.9029422),
(5433, 'Tamakautoga', 'Tamakautoga', 162, 'NU', '12', 'village', 'aldea', -19.104524, -169.917382),
(5426, 'Toi', 'Toi', 162, 'NU', '05', 'village', 'aldea', -18.97376, -169.8629774),
(5423, 'Tuapa', 'Backplaces', 162, 'NU', '02', 'village', 'aldea', -18.9912507, -169.9092078),
(5431, 'Vaiea', 'Woe', 162, 'NU', '10', 'village', 'aldea', -19.1308358, -169.8938012);

