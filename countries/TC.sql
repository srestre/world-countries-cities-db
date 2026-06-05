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
(227, 'Turks and Caicos Islands', 'Islas Turks y Caicos', 'TC', 'TCA', 'Americas', 'América', 'Caribbean', 'Caribe', 'Cockburn Town', 'USD', 21.75, -71.58333333, '🇹🇨');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5367, 'Grand Turk', 'Grand Turk', 227, 'TC', '05', 'district', 'distrito', 21.467964, -71.1387218),
(5365, 'Middle Caicos', 'Middle Caicos', 227, 'TC', '03', 'district', 'distrito', 21.795955, -71.7602595),
(5364, 'North Caicos', 'North Caicos', 227, 'TC', '02', 'district', 'distrito', 21.8909119, -71.9505749),
(5363, 'Providenciales', 'Providenciales', 227, 'TC', '01', 'district', 'distrito', 21.8020614, -72.3004456),
(5368, 'Salt Cay', 'Salt Cay', 227, 'TC', '06', 'district', 'distrito', 21.3228395, -71.2077909),
(5366, 'South Caicos', 'South Caicos', 227, 'TC', '04', 'district', 'distrito', 21.5144654, -71.5379344);

