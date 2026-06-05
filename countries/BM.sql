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
(25, 'Bermuda', 'Bermudas', 'BM', 'BMU', 'Americas', 'América', 'Northern America', 'Norteamérica', 'Hamilton', 'BMD', 32.33333333, -64.75, '🇧🇲');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(4860, 'Devonshire', 'Devonshire', 25, 'BM', 'DEV', 'municipality', 'municipio', 32.3038062, -64.7606954),
(4861, 'Hamilton', 'Hamilton', 25, 'BM', 'HA', 'municipality', 'municipio', 32.3379906, -64.7357556),
(4863, 'Paget', 'Paget', 25, 'BM', 'PAG', 'municipality', 'municipio', 32.281074, -64.7784787),
(4864, 'Pembroke', 'Pembroke', 25, 'BM', 'PEM', 'municipality', 'municipio', 32.3007672, -64.796263),
(4866, 'Saint George''s', 'Saint George''s', 25, 'BM', 'SGE', 'municipality', 'municipio', 32.3722689, -64.698502),
(4867, 'Sandys', 'Sandys', 25, 'BM', 'SAN', 'municipality', 'municipio', 32.2999528, -64.8674103),
(4868, 'Smith''s', 'Smith''s', 25, 'BM', 'SMI', 'municipality', 'municipio', 32.3133966, -64.7310588),
(4869, 'Southampton', 'Southampton', 25, 'BM', 'SOU', 'municipality', 'municipio', 32.2517959, -64.8496989),
(4870, 'Warwick', 'Warwick', 25, 'BM', 'WAR', 'municipality', 'municipio', 32.2661534, -64.8081198);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(153518, 'Devonshire', 4860, 25, 32.293, -64.8),
(153515, 'Hamilton', 4861, 25, 32.294, -64.783),
(153516, 'Paget', 4863, 25, 32.278, -64.769),
(153514, 'St. George''s', 4866, 25, 32.381, -64.674),
(153517, 'Tucker’s Town', 4866, 25, 32.3328, -64.6881),
(153513, 'Somerset', 4867, 25, 32.282, -64.844),
(153512, 'Flatts', 4868, 25, 32.328, -64.736),
(153511, 'Southampton', 4869, 25, 32.249, -64.861),
(153510, 'Warwick', 4870, 25, 32.267, -64.806);
