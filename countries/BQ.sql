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
(155, 'Bonaire, Sint Eustatius and Saba', 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 'Americas', 'América', 'Caribbean', 'Caribe', 'Kralendijk', 'USD', 12.15, -68.266667, '🇧🇶');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5086, 'Bonaire', 'Bonaire', 155, 'BQ', 'BQ1', 'special municipality', 'municipio especial', 12.2018902, -68.2623822),
(5087, 'Saba', 'Saba', 155, 'BQ', 'BQ2', 'special municipality', 'municipio especial', 17.6354642, -63.2326763),
(5088, 'Sint Eustatius', 'Sint Eustatius', 155, 'BQ', 'BQ3', 'special municipality', 'municipio especial', 17.4890306, -62.973555);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(150058, 'Boven Bolivia', 5086, 155, 12.1819, -68.2181),
(150059, 'Dorp Tera Kora', 5086, 155, 12.13333, -68.26667),
(150060, 'Oranjestad', 5086, 155, 17.48333333, -62.98333333),
(150061, 'Rincon', 5086, 155, 12.23833333, -68.3325),
(150062, 'St. Johns', 5086, 155, 17.6210075, -63.2431683),
(150063, 'The Bottom', 5086, 155, 17.62611111, -63.24916667),
(150064, 'Windwardside', 5086, 155, 17.62864, -63.23136),
(150065, 'Zion''s Hill', 5086, 155, 17.643, -63.22649);
