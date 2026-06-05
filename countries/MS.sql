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
(148, 'Montserrat', 'Montserrat', 'MS', 'MSR', 'Americas', 'América', 'Caribbean', 'Caribe', 'Plymouth', 'XCD', 16.75, -62.2, '🇲🇸');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5421, 'Saint Anthony', 'Saint Anthony', 148, 'MS', '03', 'parish', 'parroquia', 16.7056245, -62.1855304),
(5420, 'Saint Georges', 'Saint Georges', 148, 'MS', '02', 'parish', 'parroquia', 16.7484755, -62.1907472),
(5419, 'Saint Peter', 'Saint Peter', 148, 'MS', '01', 'parish', 'parroquia', 16.7765981, -62.2000786);

