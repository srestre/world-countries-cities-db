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
(10, 'Antigua and Barbuda', 'Antigua y Barbuda', 'AG', 'ATG', 'Americas', 'América', 'Caribbean', 'Caribe', 'St. John''s', 'XCD', 17.05, -61.8, '🇦🇬');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(3708, 'Barbuda', 'Barbuda', 10, 'AG', '10', 'dependency', 'dependencia', 17.6219203, -61.7839588),
(3703, 'Redonda', 'Round', 10, 'AG', '11', 'dependency', 'dependencia', 16.938416, -62.3455148),
(3709, 'Saint George', 'Saint George', 10, 'AG', '03', 'parish', 'parroquia', 17.1218022, -61.78123),
(3706, 'Saint John', 'Saint John', 10, 'AG', '04', 'parish', 'parroquia', 17.1151502, -61.8583488),
(3707, 'Saint Mary', 'Saint Mary', 10, 'AG', '05', 'parish', 'parroquia', 17.054815, -61.8602368),
(3705, 'Saint Paul', 'Saint Paul', 10, 'AG', '06', 'parish', 'parroquia', 17.0325831, -61.7706567),
(3704, 'Saint Peter', 'Saint Peter', 10, 'AG', '07', 'parish', 'parroquia', 17.1070239, -61.7502143),
(3710, 'Saint Philip', 'Saint Philip', 10, 'AG', '08', 'parish', 'parroquia', 17.066357, -61.7061957);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(144, 'Codrington', 3708, 10, 17.63333, -61.83333),
(148, 'Piggotts', 3709, 10, 17.11667, -61.8),
(149, 'Potters Village', 3706, 10, 17.11337, -61.81962),
(150, 'Saint John’s', 3706, 10, 17.12096, -61.84329),
(143, 'Bolands', 3707, 10, 17.06565, -61.87466),
(145, 'Falmouth', 3705, 10, 17.02741, -61.78136),
(146, 'Liberta', 3705, 10, 17.04141, -61.79052),
(142, 'All Saints', 3704, 10, 17.06671, -61.79303),
(147, 'Parham', 3704, 10, 17.09682, -61.77046);
