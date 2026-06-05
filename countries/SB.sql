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
(202, 'Solomon Islands', 'Islas Salomón', 'SB', 'SLB', 'Oceania', 'Oceanía', 'Melanesia', 'Melanesia', 'Honiara', 'SBD', -8, 159, '🇸🇧');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(4784, 'Central', 'Central', 202, 'SB', 'CE', 'province', 'provincia', -8.9833335, 159.75),
(4781, 'Choiseul', 'Choiseul', 202, 'SB', 'CH', 'province', 'provincia', -7.0091756, 156.9239532),
(4785, 'Guadalcanal', 'Guadalcanal', 202, 'SB', 'GU', 'province', 'provincia', -9.5984209, 160.1485117),
(4778, 'Honiara', 'Honeycomb', 202, 'SB', 'CT', 'capital territory', 'territorio capital', -9.4377975, 159.9624175),
(4780, 'Isabel', 'Isabel', 202, 'SB', 'IS', 'province', 'provincia', -7.9999999, 158.9999999),
(4782, 'Makira-Ulawa', 'Missing up', 202, 'SB', 'MK', 'province', 'provincia', -10.2835257, 161.7280731),
(4783, 'Malaita', 'Malaita', 202, 'SB', 'ML', 'province', 'provincia', -8.9551687, 160.9514413),
(4787, 'Rennell and Bellona', 'Rennell and Bellona', 202, 'SB', 'RB', 'province', 'provincia', -12.1134266, 160.3170523),
(4779, 'Temotu', 'Temotu', 202, 'SB', 'TE', 'province', 'provincia', -10.8891322, 166.231035),
(4786, 'Western', 'Western', 202, 'SB', 'WE', 'province', 'provincia', -7.8166667, 156.683988);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(102905, 'Tulagi', 4784, 202, -9.10306, 160.15056),
(102902, 'Honiara', 4785, 202, -9.43333, 159.95),
(102900, 'Buala', 4780, 202, -8.14497, 159.59212),
(102903, 'Kirakira', 4782, 202, -10.45442, 161.92045),
(102899, 'Auki', 4783, 202, -8.76778, 160.69778),
(102904, 'Lata', 4779, 202, -10.725, 165.79722),
(102901, 'Gizo', 4786, 202, -8.10303, 156.84186);
