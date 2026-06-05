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
(10, 'Antigua and Barbuda', 'AG', 'ATG', 'Americas', 'Caribbean', 'St. John''s', 'XCD', 17.05, -61.8, '🇦🇬');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3708, 'Barbuda', 10, 'AG', '10', 'dependency', 17.6219203, -61.7839588),
(3703, 'Redonda', 10, 'AG', '11', 'dependency', 16.938416, -62.3455148),
(3709, 'Saint George', 10, 'AG', '03', 'parish', 17.1218022, -61.78123),
(3706, 'Saint John', 10, 'AG', '04', 'parish', 17.1151502, -61.8583488),
(3707, 'Saint Mary', 10, 'AG', '05', 'parish', 17.054815, -61.8602368),
(3705, 'Saint Paul', 10, 'AG', '06', 'parish', 17.0325831, -61.7706567),
(3704, 'Saint Peter', 10, 'AG', '07', 'parish', 17.1070239, -61.7502143),
(3710, 'Saint Philip', 10, 'AG', '08', 'parish', 17.066357, -61.7061957);

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
