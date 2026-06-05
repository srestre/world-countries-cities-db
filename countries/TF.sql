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
(78, 'French Southern Territories', 'TF', 'ATF', 'Africa', 'Southern Africa', 'Port-aux-Francais', 'EUR', -49.25, 69.167, '🇹🇫');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5822, 'Adélie Land', 78, 'TF', '01', 'district', -66.66277778, 140.00111111),
(5823, 'Crozet Islands', 78, 'TF', '02', 'district', -46.4325, 51.85763889),
(5824, 'Kerguelen Islands', 78, 'TF', '03', 'district', -49.35, 70.21888889),
(5825, 'Saint-Paul and Amsterdam Islands', 78, 'TF', '04', 'district', -37.79555556, 77.57333333),
(5826, 'Scattered Islands', 78, 'TF', '05', 'district', -15.89222222, 54.52083333);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(162135, 'Dumont d''Urville Station', 5822, 78, -66.66277778, 140.00111111),
(162134, 'Alfred Faure', 5823, 78, -46.4325, 51.85763889),
(162137, 'Port-aux-Français', 5824, 78, -49.35, 70.21888889),
(162136, 'Martin-de-Viviès', 5825, 78, -37.79555556, 77.57333333),
(162138, 'Tromelin', 5826, 78, -15.89222222, 54.52083333);
