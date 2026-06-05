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
(122, 'Lesotho', 'LS', 'LSO', 'Africa', 'Southern Africa', 'Maseru', 'LSL', -29.5, 28.5, '🇱🇸');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3030, 'Berea', 122, 'LS', 'D', 'district', -29.1963971, 27.9175581),
(3029, 'Butha-Buthe', 122, 'LS', 'B', 'district', -28.7653754, 28.2468148),
(3026, 'Leribe', 122, 'LS', 'C', 'district', -28.866891, 28.0579408),
(3022, 'Mafeteng', 122, 'LS', 'E', 'district', -29.7893049, 27.4423193),
(3028, 'Maseru', 122, 'LS', 'A', 'district', -29.5816942, 27.8243208),
(3023, 'Mohale''s Hoek', 122, 'LS', 'F', 'district', -30.1516305, 27.4770113),
(3024, 'Mokhotlong', 122, 'LS', 'J', 'district', -29.2190697, 29.0351369),
(3025, 'Qacha''s Nek', 122, 'LS', 'H', 'district', -30.1114565, 28.678979),
(3027, 'Quthing', 122, 'LS', 'G', 'district', -30.4015687, 27.7080133),
(3031, 'Thaba-Tseka', 122, 'LS', 'K', 'district', -29.5151832, 28.6036179);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(66574, 'Teyateyaneng', 3030, 122, -29.14719, 27.74895),
(66564, 'Butha-Buthe', 3029, 122, -28.76659, 28.24937),
(66565, 'Leribe', 3026, 122, -28.87185, 28.04501),
(66567, 'Maputsoe', 3026, 122, -28.8866, 27.89915),
(66566, 'Mafeteng', 3022, 122, -29.82299, 27.23744),
(66568, 'Maseru', 3028, 122, -29.31667, 27.48333),
(66571, 'Nako', 3028, 122, -29.61667, 27.76667),
(66569, 'Mohale’s Hoek', 3023, 122, -30.15137, 27.47691),
(66570, 'Mokhotlong', 3024, 122, -29.28939, 29.06751),
(66572, 'Qacha’s Nek', 3025, 122, -30.11537, 28.68936),
(66573, 'Quthing', 3027, 122, -30.40001, 27.70027),
(66575, 'Thaba-Tseka', 3031, 122, -29.52204, 28.6084);
