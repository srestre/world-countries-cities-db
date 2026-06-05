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
(206, 'South Sudan', 'Sudán del Sur', 'SS', 'SSD', 'Africa', 'África', 'Middle Africa', 'África Central', 'Juba', 'SSP', 7, 30, '🇸🇸');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(2092, 'Central Equatoria', 'Central Equatoria', 206, 'SS', 'EC', 'state', 'estado', 5, 31.5),
(2093, 'Eastern Equatoria', 'Eastern Equatoria', 206, 'SS', 'EE', 'state', 'estado', 5.283932, 33.5912329),
(2094, 'Jonglei State', 'Jonglei State', 206, 'SS', 'JG', 'state', 'estado', 8, 32),
(2090, 'Lakes', 'Lakes', 206, 'SS', 'LK', 'state', 'estado', 6.7526716, 30.0948429),
(2088, 'Northern Bahr el Ghazal', 'Northern Bahr el Ghazal', 206, 'SS', 'BN', 'state', 'estado', 9, 27),
(2085, 'Unity', 'Unity', 206, 'SS', 'UY', 'state', 'estado', 8.4582525, 29.9560547),
(2086, 'Upper Nile', 'Upper Nile', 206, 'SS', 'NU', 'state', 'estado', 9, 33),
(2087, 'Warrap', 'Warrap', 206, 'SS', 'WR', 'state', 'estado', 7.9132688, 28.9588141),
(2091, 'Western Bahr el Ghazal', 'Western bahr el ghazal', 206, 'SS', 'BW', 'state', 'estado', 8.5455555, 25.2224504),
(2089, 'Western Equatoria', 'Western Equatoria', 206, 'SS', 'EW', 'state', 'estado', 5.5381215, 29.1495118);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(104834, 'Yirol', 2090, 206, 6.5525, 30.49806);
