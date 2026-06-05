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
(243, 'Wallis and Futuna Islands', 'Wallis y Futuna', 'WF', 'WLF', 'Oceania', 'Oceanía', 'Polynesia', 'Polinesia', 'Mata Utu', 'XPF', -13.3, -176.2, '🇼🇫');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5709, 'Alo', 'Alo', 243, 'WF', 'AL', 'administrative precinct', 'distrito administrativo', -14.30938056, -178.12355),
(5708, 'Sigave', 'Sigavé', 243, 'WF', 'SG', 'administrative precinct', 'distrito administrativo', -14.2961, -178.1585),
(5707, 'Uvea', 'ʻUvea', 243, 'WF', 'UV', 'administrative precinct', 'distrito administrativo', -13.28333333, -176.2);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(160134, 'Ono', 5709, 243, -14.31055556, -178.105),
(160133, 'Leava', 5708, 243, -14.2961, -178.1585),
(160132, 'Mata Utu', 5707, 243, -13.28333333, -176.18333333);
