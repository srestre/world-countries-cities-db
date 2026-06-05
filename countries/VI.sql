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
(242, 'Virgin Islands (US)', 'VI', 'VIR', 'Americas', 'Caribbean', 'Charlotte Amalie', 'USD', 18.34, -64.93, '🇻🇮');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5074, 'Saint Croix', 242, 'VI', 'SC', 'district', 17.729124, -64.7589156),
(5073, 'Saint John', 242, 'VI', 'SJ', 'district', 18.3356013, -64.7550406),
(5072, 'Saint Thomas', 242, 'VI', 'ST', 'district', 18.3429081, -64.9188997);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(149573, 'Christiansted', 5074, 242, 17.7440364, -64.7106086),
(149574, 'East End', 5074, 242, 17.7523882, -64.670301),
(149575, 'Frederiksted', 5074, 242, 17.7124691, -64.8867192),
(149572, 'Good Hope', 5074, 242, 17.7223442, -64.7172494),
(149576, 'Northcentral', 5074, 242, 17.7501145, -64.8238491),
(149577, 'Northwest', 5074, 242, 17.7382782, -64.8906347),
(149578, 'Sion Farm', 5074, 242, 17.7543276, -64.7794611),
(149579, 'Southcentral', 5074, 242, 17.7064917, -64.8144865),
(149580, 'Southwest', 5074, 242, 17.6917787, -64.9355939),
(149568, 'Central', 5073, 242, 18.3356838, -64.7947078),
(149569, 'Coral Bay', 5073, 242, 18.3480089, -64.7219682),
(149570, 'Cruz Bay', 5073, 242, 18.3182037, -64.8024211),
(149571, 'East End', 5073, 242, 18.3403647, -64.6806266),
(149561, 'Charlotte Amalie', 5072, 242, 18.3412761, -64.9483869),
(149562, 'East End', 5072, 242, 18.3290162, -64.8704731),
(149563, 'Northside', 5072, 242, 18.3738081, -64.9558909),
(149564, 'Southside', 5072, 242, 18.3052912, -64.9172445),
(149565, 'Tutu', 5072, 242, 18.3388427, -64.8953072),
(149566, 'Water Island', 5072, 242, 18.3208653, -64.9693263),
(149567, 'West End', 5072, 242, 18.3724367, -65.0649013);
