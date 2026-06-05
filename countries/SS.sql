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
(206, 'South Sudan', 'SS', 'SSD', 'Africa', 'Middle Africa', 'Juba', 'SSP', 7, 30, '🇸🇸');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(2092, 'Central Equatoria', 206, 'SS', 'EC', 'state', 5, 31.5),
(2093, 'Eastern Equatoria', 206, 'SS', 'EE', 'state', 5.283932, 33.5912329),
(2094, 'Jonglei State', 206, 'SS', 'JG', 'state', 8, 32),
(2090, 'Lakes', 206, 'SS', 'LK', 'state', 6.7526716, 30.0948429),
(2088, 'Northern Bahr el Ghazal', 206, 'SS', 'BN', 'state', 9, 27),
(2085, 'Unity', 206, 'SS', 'UY', 'state', 8.4582525, 29.9560547),
(2086, 'Upper Nile', 206, 'SS', 'NU', 'state', 9, 33),
(2087, 'Warrap', 206, 'SS', 'WR', 'state', 7.9132688, 28.9588141),
(2091, 'Western Bahr el Ghazal', 206, 'SS', 'BW', 'state', 8.5455555, 25.2224504),
(2089, 'Western Equatoria', 206, 'SS', 'EW', 'state', 5.5381215, 29.1495118);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(104834, 'Yirol', 2090, 206, 6.5525, 30.49806);
