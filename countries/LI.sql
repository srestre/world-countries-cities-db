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
(125, 'Liechtenstein', 'LI', 'LIE', 'Europe', 'Western Europe', 'Vaduz', 'CHF', 47.26666666, 9.53333333, '🇱🇮');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(458, 'Balzers', 125, 'LI', '01', 'commune', 47.0688822, 9.506159),
(451, 'Eschen', 125, 'LI', '02', 'commune', 47.2126274, 9.5233202),
(457, 'Gamprin', 125, 'LI', '03', 'commune', 47.213249, 9.5025195),
(455, 'Mauren', 125, 'LI', '04', 'commune', 47.2189285, 9.541735),
(454, 'Planken', 125, 'LI', '05', 'commune', 47.1858848, 9.5452211),
(453, 'Ruggell', 125, 'LI', '06', 'commune', 47.2397575, 9.5262871),
(450, 'Schaan', 125, 'LI', '07', 'commune', 47.1663397, 9.510312),
(449, 'Schellenberg', 125, 'LI', '08', 'commune', 47.230966, 9.5467843),
(459, 'Triesen', 125, 'LI', '09', 'commune', 47.1097988, 9.5248296),
(456, 'Triesenberg', 125, 'LI', '10', 'commune', 47.1186181, 9.5433663),
(452, 'Vaduz', 125, 'LI', '11', 'commune', 47.1410303, 9.5209277);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(66437, 'Balzers', 458, 125, 47.06665, 9.50251),
(66438, 'Eschen', 451, 125, 47.21071, 9.52223),
(66439, 'Gamprin', 457, 125, 47.22038, 9.50935),
(66440, 'Mauren', 455, 125, 47.21805, 9.5442),
(66441, 'Planken', 454, 125, 47.18516, 9.54437),
(66442, 'Ruggell', 453, 125, 47.23799, 9.5254),
(66443, 'Schaan', 450, 125, 47.16498, 9.50867),
(66444, 'Schellenberg', 449, 125, 47.23123, 9.54678),
(66445, 'Triesen', 459, 125, 47.10752, 9.52815),
(66446, 'Triesenberg', 456, 125, 47.11815, 9.54197),
(66447, 'Vaduz', 452, 125, 47.14151, 9.52154);
