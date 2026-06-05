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
(227, 'Turks and Caicos Islands', 'TC', 'TCA', 'Americas', 'Caribbean', 'Cockburn Town', 'USD', 21.75, -71.58333333, '🇹🇨');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5367, 'Grand Turk', 227, 'TC', '05', 'district', 21.467964, -71.1387218),
(5365, 'Middle Caicos', 227, 'TC', '03', 'district', 21.795955, -71.7602595),
(5364, 'North Caicos', 227, 'TC', '02', 'district', 21.8909119, -71.9505749),
(5363, 'Providenciales', 227, 'TC', '01', 'district', 21.8020614, -72.3004456),
(5368, 'Salt Cay', 227, 'TC', '06', 'district', 21.3228395, -71.2077909),
(5366, 'South Caicos', 227, 'TC', '04', 'district', 21.5144654, -71.5379344);

