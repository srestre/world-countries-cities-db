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
(17, 'The Bahamas', 'BS', 'BHS', 'Americas', 'Caribbean', 'Nassau', 'BSD', 24.25, -76, '🇧🇸');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3601, 'Acklins', 17, 'BS', 'AK', 'district', 22.4145, -74.0606831),
(3593, 'Berry Islands', 17, 'BS', 'BY', 'district', 25.5905, -77.7261006),
(3629, 'Bimini', 17, 'BS', 'BI', 'district', 25.7032538, -79.2733449),
(3605, 'Black Point', 17, 'BS', 'BP', 'district', 24.0962598, -76.4022591),
(3611, 'Cat Island', 17, 'BS', 'CI', 'district', 24.3385, -75.6149932),
(3603, 'Central Abaco', 17, 'BS', 'CO', 'district', 26.5255105, -77.2838118),
(3631, 'Central Andros', 17, 'BS', 'CS', 'district', 24.4343749, -77.7934077),
(3596, 'Central Eleuthera', 17, 'BS', 'CE', 'district', 25.239, -76.3291621),
(3621, 'Crooked Island', 17, 'BS', 'CK', 'district', 22.7486959, -74.2386163),
(3614, 'East Grand Bahama', 17, 'BS', 'EG', 'district', 26.6772229, -78.0134521),
(3612, 'Exuma', 17, 'BS', 'EX', 'district', 23.9685, -76.1799049),
(3626, 'Freeport', 17, 'BS', 'FP', 'district', 26.535681, -78.6953623),
(3632, 'Grand Cay', 17, 'BS', 'GC', 'district', 27.2287191, -78.3324366),
(3613, 'Harbour Island', 17, 'BS', 'HI', 'district', 25.50011, -76.6340511),
(3624, 'Hope Town', 17, 'BS', 'HT', 'district', 26.5407116, -76.9594379),
(3609, 'Inagua', 17, 'BS', 'IN', 'district', 21.2325, -73.3096213),
(3610, 'Long Island', 17, 'BS', 'LI', 'district', 23.303, -75.1058782),
(3625, 'Mangrove Cay', 17, 'BS', 'MC', 'district', 24.2188205, -77.7176145),
(3633, 'Mayaguana', 17, 'BS', 'MG', 'district', 22.3698426, -72.8876816),
(5717, 'Moore''s Island', 17, 'BS', 'MI', 'district', 25.866667, -77.966667),
(4881, 'New Providence', 17, 'BS', 'NP', 'island', 25.1943588, -77.2953297),
(3616, 'North Abaco', 17, 'BS', 'NO', 'district', 26.9383943, -77.6838221),
(3617, 'North Andros', 17, 'BS', 'NS', 'district', 24.8875, -78.0811619),
(3602, 'North Eleuthera', 17, 'BS', 'NE', 'district', 25.3776694, -76.7842655),
(3615, 'Ragged Island', 17, 'BS', 'RI', 'district', 22.4765594, -75.8020934),
(3600, 'Rum Cay', 17, 'BS', 'RC', 'district', 23.8263065, -74.9326829),
(3627, 'San Salvador Island', 17, 'BS', 'SS', 'district', 24.0343816, -74.4851373),
(3608, 'South Abaco', 17, 'BS', 'SO', 'district', 26.004, -77.3567072),
(3622, 'South Andros', 17, 'BS', 'SA', 'district', 23.8985, -77.4565404),
(3607, 'South Eleuthera', 17, 'BS', 'SE', 'district', 24.7310794, -76.2926928),
(3630, 'Spanish Wells', 17, 'BS', 'SW', 'district', 25.5402336, -76.9606233),
(3599, 'West Grand Bahama', 17, 'BS', 'WG', 'district', 26.744, -78.8788685);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(15686, 'Alice Town', 3629, 17, 25.728, -79.29721),
(15688, 'Arthur’s Town', 3611, 17, 24.6224, -75.67151),
(15699, 'Marsh Harbour', 3603, 17, 26.54124, -77.0636),
(15691, 'Colonel Hill', 3621, 17, 22.7545, -74.20415),
(15697, 'High Rock', 3614, 17, 26.60999, -78.27863),
(15696, 'George Town', 3612, 17, 23.51616, -75.78665),
(15695, 'Freeport', 3626, 17, 26.53333, -78.7),
(15698, 'Lucaya', 3626, 17, 26.53333, -78.66667),
(15694, 'Dunmore Town', 3613, 17, 25.50216, -76.63633),
(15700, 'Matthew Town', 3609, 17, 20.94982, -73.67346),
(15689, 'Clarence Town', 3610, 17, 23.1, -74.98333),
(15685, 'Abraham’s Bay', 3633, 17, 22.36667, -72.96667),
(143913, 'Nassau', 4881, 17, 25.06666667, -77.33333333),
(15692, 'Cooper’s Town', 3616, 17, 26.87137, -77.51131),
(15687, 'Andros Town', 3617, 17, 24.70502, -77.76912),
(15702, 'San Andros', 3617, 17, 25.06667, -78.05),
(15693, 'Duncan Town', 3615, 17, 22.19083, -75.72583),
(15701, 'Port Nelson', 3600, 17, 23.64967, -74.84157),
(15690, 'Cockburn Town', 3627, 17, 24.05179, -74.53138),
(15703, 'Spanish Wells', 3630, 17, 25.54717, -76.76405),
(15704, 'West End', 3599, 17, 26.68711, -78.97702);
