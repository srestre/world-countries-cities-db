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
(23, 'Belize', 'Belice', 'BZ', 'BLZ', 'Americas', 'América', 'Central America', 'Centroamérica', 'Belmopan', 'BZD', 17.25, -88.75, '🇧🇿');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(264, 'Belize', 'Belize', 23, 'BZ', 'BZ', 'district', 'distrito', 17.5002768, -88.1988737),
(269, 'Cayo', 'Cayo', 23, 'BZ', 'CY', 'district', 'distrito', 17.1582776, -89.0681672),
(266, 'Corozal', 'Corozal', 23, 'BZ', 'CZL', 'district', 'distrito', 18.2276324, -88.2921257),
(268, 'Orange Walk', 'Orange Walk', 23, 'BZ', 'OW', 'district', 'distrito', 17.7831833, -88.8620283),
(265, 'Stann Creek', 'Stann Creek', 23, 'BZ', 'SC', 'district', 'distrito', 16.9666599, -88.2247368),
(267, 'Toledo', 'Toledo', 23, 'BZ', 'TOL', 'district', 'distrito', 16.1345572, -88.8219041);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(16133, 'Belize City', 264, 23, 17.49952, -88.19756),
(16143, 'San Pedro', 264, 23, 17.91598, -87.9659),
(16134, 'Belmopan', 269, 23, 17.25, -88.76667),
(16135, 'Benque Viejo el Carmen', 269, 23, 17.075, -89.13917),
(16142, 'San Ignacio', 269, 23, 17.1588, -89.0696),
(16145, 'Valley of Peace', 269, 23, 17.33472, -88.83472),
(16136, 'Corozal', 266, 23, 18.39375, -88.38849),
(16138, 'Hopelchén', 268, 23, 17.8, -89.1),
(16139, 'Orange Walk', 268, 23, 18.08124, -88.56328),
(16144, 'Shipyard', 268, 23, 17.89382, -88.65452),
(16137, 'Dangriga', 265, 23, 16.9697, -88.23313),
(16140, 'Placencia', 265, 23, 16.51419, -88.36647),
(16141, 'Punta Gorda', 267, 23, 16.09835, -88.8097);
