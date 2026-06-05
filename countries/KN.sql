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
(185, 'Saint Kitts and Nevis', 'KN', 'KNA', 'Americas', 'Caribbean', 'Basseterre', 'XCD', 17.33333333, -62.75, '🇰🇳');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3833, 'Christ Church Nichola Town', 185, 'KN', '01', 'parish', 17.3604812, -62.7617837),
(3832, 'Nevis', 185, 'KN', 'N', 'state', 17.1553558, -62.5796026),
(3836, 'Saint Anne Sandy Point', 185, 'KN', '02', 'parish', 17.3725333, -62.8441133),
(5348, 'Saint George Basseterre', 185, 'KN', '03', 'parish', 17.2391544, -62.6424082),
(3837, 'Saint George Gingerland', 185, 'KN', '04', 'parish', 17.1257759, -62.5619811),
(3835, 'Saint James Windward', 185, 'KN', '05', 'parish', 17.1769633, -62.5796026),
(3845, 'Saint John Capisterre', 185, 'KN', '06', 'parish', 17.3872567, -62.7992132),
(3840, 'Saint John Figtree', 185, 'KN', '07', 'parish', 17.1155748, -62.6031004),
(3841, 'Saint Kitts', 185, 'KN', 'K', 'state', 17.3156929, -62.7446806),
(3844, 'Saint Mary Cayon', 185, 'KN', '08', 'parish', 17.3462071, -62.7382671),
(3834, 'Saint Paul Capisterre', 185, 'KN', '09', 'parish', 17.3949059, -62.835829),
(3838, 'Saint Paul Charlestown', 185, 'KN', '10', 'parish', 17.1346297, -62.6133816),
(3831, 'Saint Peter Basseterre', 185, 'KN', '11', 'parish', 17.3255653, -62.7217779),
(3839, 'Saint Thomas Lowland', 185, 'KN', '12', 'parish', 17.1650513, -62.6089753),
(3842, 'Saint Thomas Middle Island', 185, 'KN', '13', 'parish', 17.3348813, -62.8088251),
(3843, 'Trinity Palmetto Point', 185, 'KN', '15', 'parish', 17.3145143, -62.7685145);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(65176, 'Nicola Town', 3833, 185, 17.37956, -62.75318),
(65178, 'Sandy Point Town', 3836, 185, 17.35908, -62.84858),
(65172, 'Market Shop', 3837, 185, 17.13218, -62.57267),
(65175, 'Newcastle', 3835, 185, 17.2, -62.58333),
(65170, 'Dieppe Bay Town', 3845, 185, 17.41473, -62.8139),
(65171, 'Fig Tree', 3840, 185, 17.12623, -62.60265),
(65167, 'Cayon', 3844, 185, 17.35, -62.73333),
(65177, 'Saint Paul’s', 3834, 185, 17.40605, -62.83562),
(65168, 'Charlestown', 3838, 185, 17.13333, -62.61667),
(65174, 'Monkey Hill', 3831, 185, 17.32327, -62.72914),
(65169, 'Cotton Ground', 3839, 185, 17.16667, -62.61667),
(65173, 'Middle Island', 3842, 185, 17.3259, -62.81055),
(65179, 'Trinity', 3843, 185, 17.30037, -62.77584);
