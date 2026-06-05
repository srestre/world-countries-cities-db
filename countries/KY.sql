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
(41, 'Cayman Islands', 'KY', 'CYM', 'Americas', 'Caribbean', 'George Town', 'KYD', 19.5, -80.5, '🇰🇾');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5252, 'Cayman Brac', 41, 'KY', '02', NULL, 19.7198862, -79.79314),
(5251, 'Grand Cayman', 41, 'KY', '01', NULL, 19.3298471, -81.1712216),
(5253, 'Little Cayman', 41, 'KY', '03', NULL, 19.6853346, -80.0477824);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(153943, 'Cayman Brac', 5252, 41, 19.719997, -79.8907266),
(153938, 'Bodden Town', 5251, 41, 19.2796693, -81.2777999),
(153939, 'East End', 5251, 41, 19.2995898, -81.1196138),
(153940, 'George Town', 5251, 41, 19.2902326, -81.4433372),
(153941, 'North Side', 5251, 41, 19.3362047, -81.5139813),
(153942, 'West Bay', 5251, 41, 19.3665153, -81.4317026),
(153944, 'Little Cayman', 5253, 41, 19.6856739, -80.1183019);
