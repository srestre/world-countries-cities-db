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
(91, 'Guernsey', 'Guernsey', 'GG', 'GGY', 'Europe', 'Europa', 'Northern Europe', 'Europa del Norte', 'St Peter Port', 'GBP', 49.46666666, -2.58333333, '🇬🇬');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5389, 'Alderney', 'Alderney', 91, 'GG', '04', 'parish', 'parroquia', 49.7168911, -2.1971694),
(5386, 'Castel', 'Castel', 91, 'GG', '01', 'parish', 'parroquia', 49.4677402, -2.5913459),
(5387, 'Forest', 'Forest', 91, 'GG', '02', 'parish', 'parroquia', 49.4312917, -2.5927968),
(5392, 'Sark', 'Sark', 91, 'GG', '07', 'parish', 'parroquia', 49.4283373, -2.3599394),
(5388, 'St Andrew', 'St Andrew', 91, 'GG', '03', 'parish', 'parroquia', 49.4499006, -2.5688225),
(5390, 'St Martin', 'St Martin', 91, 'GG', '05', 'parish', 'parroquia', 49.4373488, -2.555524),
(5391, 'St Peter Port', 'St Peter Port', 91, 'GG', '06', 'parish', 'parroquia', 49.4568142, -2.5389979),
(5393, 'St Pierre du Bois', 'St Pierre du Bois', 91, 'GG', '08', 'parish', 'parroquia', 49.4395995, -2.6408963),
(5394, 'St Sampson', 'St Sampson', 91, 'GG', '09', 'parish', 'parroquia', 49.4817273, -2.5388395),
(5395, 'St Saviour', 'St Saviour', 91, 'GG', '10', 'parish', 'parroquia', 49.4491648, -2.6213557),
(5396, 'Torteval', 'Torteval', 91, 'GG', '11', 'parish', 'parroquia', 49.4302321, -2.6638621),
(5397, 'Vale', 'Vale', 91, 'GG', '12', 'parish', 'parroquia', 49.495456, -2.5225087);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(160552, 'Forest Parish', 5387, 91, 49.42983, -2.60168),
(160553, 'Saint Peter Port', 5391, 91, 49.45981, -2.53527),
(160555, 'Saint Pierre du Bois Parish', 5393, 91, 49.45399, -2.63808),
(160554, 'Vale Parish', 5393, 91, 49.4944, -2.5179),
(160556, 'Saint Sampson', 5394, 91, 49.48389, -2.52333);
