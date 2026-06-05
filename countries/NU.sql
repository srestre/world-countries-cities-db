CREATE TABLE IF NOT EXISTS countries (
  id INTEGER PRIMARY KEY, name VARCHAR(100), iso2 CHAR(2), iso3 CHAR(3),
  region VARCHAR(100), subregion VARCHAR(100), capital VARCHAR(100),
  currency VARCHAR(255), latitude DECIMAL(10,8), longitude DECIMAL(11,8), emoji VARCHAR(16)
);
CREATE TABLE IF NOT EXISTS states (
  id INTEGER PRIMARY KEY, name VARCHAR(255), country_id INTEGER, country_code CHAR(2),
  state_code VARCHAR(10), type VARCHAR(191), latitude DECIMAL(10,8), longitude DECIMAL(11,8)
);
CREATE TABLE IF NOT EXISTS cities (
  id INTEGER PRIMARY KEY, name VARCHAR(255), state_id INTEGER, country_id INTEGER,
  latitude DECIMAL(10,8), longitude DECIMAL(11,8)
);

INSERT INTO countries (id, name, iso2, iso3, region, subregion, capital, currency, latitude, longitude, emoji) VALUES
(162, 'Niue', 'NU', 'NIU', 'Oceania', 'Polynesia', 'Alofi', 'NZD', -19.03333333, -169.86666666, '🇳🇺');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5435, 'Alofi North', 162, 'NU', '14', 'village', -19.0488977, -169.9190905),
(5434, 'Alofi South', 162, 'NU', '13', 'village', -19.054836, -169.9198846),
(5432, 'Avatele', 162, 'NU', '11', 'village', -19.1237302, -169.9165678),
(5430, 'Hakupu', 162, 'NU', '09', 'village', -19.1287275, -169.8492123),
(5425, 'Hikutavake', 162, 'NU', '04', 'village', -18.9656326, -169.880636),
(5428, 'Lakepa', 162, 'NU', '07', 'village', -19.0096425, -169.8120046),
(5429, 'Liku', 162, 'NU', '08', 'village', -19.0536907, -169.7942591),
(5422, 'Makefu', 162, 'NU', '01', 'village', -19.0032618, -169.9204732),
(5427, 'Mutalau', 162, 'NU', '06', 'village', -18.9639385, -169.8327863),
(5424, 'Namukulu', 162, 'NU', '03', 'village', -18.9812275, -169.9029422),
(5433, 'Tamakautoga', 162, 'NU', '12', 'village', -19.104524, -169.917382),
(5426, 'Toi', 162, 'NU', '05', 'village', -18.97376, -169.8629774),
(5423, 'Tuapa', 162, 'NU', '02', 'village', -18.9912507, -169.9092078),
(5431, 'Vaiea', 162, 'NU', '10', 'village', -19.1308358, -169.8938012);

