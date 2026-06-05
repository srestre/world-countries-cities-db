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
(123, 'Liberia', 'Liberia', 'LR', 'LBR', 'Africa', 'África', 'Western Africa', 'África Occidental', 'Monrovia', 'LRD', 6.5, -9.5, '🇱🇷');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(3041, 'Bomi', 'Bomi', 123, 'LR', 'BM', 'county', 'condado', 6.7177856, -10.7881766),
(3034, 'Bong', 'Bong', 123, 'LR', 'BG', 'county', 'condado', 6.9622195, -9.7134459),
(3044, 'Gbarpolu', 'Gbarpolu', 123, 'LR', 'GP', 'county', 'condado', 7.2681564, -10.3814771),
(3040, 'Grand Bassa', 'Grand Bassa', 123, 'LR', 'GB', 'county', 'condado', 6.1640621, -9.895669),
(3036, 'Grand Cape Mount', 'Grand Cape Mount', 123, 'LR', 'CM', 'county', 'condado', 7.0496206, -11.129843),
(3039, 'Grand Gedeh', 'Grand Gedeh', 123, 'LR', 'GG', 'county', 'condado', 5.8161533, -8.0995537),
(3045, 'Grand Kru', 'Grand crew', 123, 'LR', 'GK', 'county', 'condado', 4.84932, -8.3308845),
(3037, 'Lofa', 'Applaud', 123, 'LR', 'LO', 'county', 'condado', 7.8824046, -9.9760297),
(3043, 'Margibi', 'Margibi', 123, 'LR', 'MG', 'county', 'condado', 6.6053676, -10.1758429),
(3042, 'Maryland', 'Maryland', 123, 'LR', 'MY', 'county', 'condado', 4.6355376, -7.7281669),
(3032, 'Montserrado', 'Montserrado', 123, 'LR', 'MO', 'county', 'condado', 6.4095537, -10.6059403),
(3046, 'Nimba', 'If', 123, 'LR', 'NI', 'county', 'condado', 6.8088813, -8.7461448),
(3033, 'River Cess', 'River Cess', 123, 'LR', 'RI', 'county', 'condado', 5.9087331, -9.3938267),
(3038, 'River Gee', 'River Gee', 123, 'LR', 'RG', 'county', 'condado', 5.2653903, -7.8856203),
(3035, 'Sinoe', 'SINOIE', 123, 'LR', 'SI', 'county', 'condado', 5.3232693, -8.8435955);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(66561, 'Tubmanburg', 3041, 123, 6.87064, -10.8211),
(66553, 'Gbarnga', 3034, 123, 6.99543, -9.47122),
(66548, 'Bopolu', 3044, 123, 7.06667, -10.4875),
(66549, 'Buchanan', 3040, 123, 5.87693, -10.04964),
(66559, 'Robertsport', 3036, 123, 6.75329, -11.3671),
(66563, 'Zwedru', 3039, 123, 6.06846, -8.13559),
(66546, 'Barclayville', 3045, 123, 4.67443, -8.23306),
(66562, 'Voinjama', 3037, 123, 8.42194, -9.74778),
(66556, 'Kakata', 3043, 123, 6.53104, -10.35368),
(66555, 'Harper', 3042, 123, 4.3782, -7.71081),
(66547, 'Bensonville', 3032, 123, 6.44716, -10.61283),
(66557, 'Monrovia', 3032, 123, 6.30054, -10.7969),
(66552, 'Ganta', 3046, 123, 7.30222, -8.53083),
(66558, 'New Yekepa', 3046, 123, 7.57944, -8.53778),
(66560, 'Sanniquellie', 3046, 123, 7.36215, -8.71326),
(66550, 'Cestos City', 3033, 123, 5.45683, -9.58167),
(66551, 'Fish Town', 3038, 123, 5.19739, -7.87579),
(66554, 'Greenville', 3035, 123, 5.01133, -9.0388);
