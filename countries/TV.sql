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
(228, 'Tuvalu', 'TV', 'TUV', 'Oceania', 'Polynesia', 'Funafuti', 'AUD', -8, 178, '🇹🇻');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3951, 'Funafuti', 228, 'TV', 'FUN', 'town council', -8.5211471, 179.1961926),
(3947, 'Nanumanga', 228, 'TV', 'NMG', 'island council', -6.2858019, 176.319928),
(3949, 'Nanumea', 228, 'TV', 'NMA', 'island council', -5.6817338, 176.1271787),
(3946, 'Niutao Island Council', 228, 'TV', 'NIT', 'island council', -6.1064258, 177.3438429),
(3948, 'Nui', 228, 'TV', 'NUI', 'island council', -7.2207599, 177.1461122),
(3952, 'Nukufetau', 228, 'TV', 'NKF', 'island council', -8.1159264, 178.4798165),
(3953, 'Nukulaelae', 228, 'TV', 'NKL', 'island council', -9.1754173, 179.6367792),
(3950, 'Vaitupu', 228, 'TV', 'VAI', 'island council', -7.4767327, 178.6747675);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(108993, 'Alapi Village', 3951, 228, -8.52074, 179.1968),
(108995, 'Fakaifou Village', 3951, 228, -8.51758, 179.20094),
(108996, 'Funafuti', 3951, 228, -8.52425, 179.19417),
(109001, 'Toga Village', 3947, 228, -6.28764, 176.31472),
(108997, 'Kulia Village', 3946, 228, -6.10819, 177.33393),
(108998, 'Niulakita', 3946, 228, -10.788, 179.466),
(109000, 'Tanrake Village', 3948, 228, -7.24562, 177.14511),
(108999, 'Savave Village', 3952, 228, -8.02731, 178.31351),
(108994, 'Asau Village', 3950, 228, -7.49026, 178.68016);
