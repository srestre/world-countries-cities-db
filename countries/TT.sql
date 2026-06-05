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
(223, 'Trinidad and Tobago', 'TT', 'TTO', 'Americas', 'Caribbean', 'Port of Spain', 'TTD', 11, -61, '🇹🇹');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3362, 'Arima', 223, 'TT', 'ARI', 'borough', 10.6372057, -61.2829762),
(3366, 'Chaguanas', 223, 'TT', 'CHA', 'borough', 10.5168387, -61.4114482),
(3354, 'Couva-Tabaquite-Talparo', 223, 'TT', 'CTT', 'region', 10.4497669, -61.3443881),
(3367, 'Diego Martin', 223, 'TT', 'DMN', 'region', 10.7138596, -61.5793555),
(3355, 'Eastern Tobago', 223, 'TT', 'ETO', 'region', 11.2832232, -60.6925066),
(3365, 'Penal-Debe', 223, 'TT', 'PED', 'region', 10.1649187, -61.4286325),
(3360, 'Point Fortin', 223, 'TT', 'PTF', 'borough', 10.1759283, -61.6827286),
(3363, 'Port of Spain', 223, 'TT', 'POS', 'city', 10.6572678, -61.5180173),
(3368, 'Princes Town', 223, 'TT', 'PRT', 'region', 10.2048003, -61.2806186),
(3356, 'Rio Claro-Mayaro', 223, 'TT', 'MRC', 'region', 10.2597016, -61.0923503),
(3359, 'San Fernando', 223, 'TT', 'SFO', 'region', 10.2807069, -61.4645896),
(3357, 'San Juan-Laventille', 223, 'TT', 'SJL', 'region', 10.6756066, -61.4710154),
(3361, 'Sangre Grande', 223, 'TT', 'SGE', 'region', 10.6375402, -61.1177499),
(3364, 'Siparia', 223, 'TT', 'SIP', 'region', 10.1471607, -61.5787032),
(5735, 'Tobago', 223, 'TT', 'TOB', 'ward', 11.25, -60.6833333),
(3358, 'Tunapuna-Piarco', 223, 'TT', 'TUP', 'region', 10.6854333, -61.3205274),
(3353, 'Western Tobago', 223, 'TT', 'WTO', 'region', 11.1572885, -60.8165013);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(108968, 'Arima', 3362, 223, 10.63737, -61.28228),
(108970, 'Chaguanas', 3366, 223, 10.51667, -61.41667),
(108990, 'Ward of Chaguanas', 3366, 223, 10.5, -61.38333),
(108971, 'Couva', 3354, 223, 10.42248, -61.46748),
(108988, 'Tabaquite', 3354, 223, 10.38824, -61.29704),
(108978, 'Petit Valley', 3367, 223, 10.69974, -61.54717),
(108991, 'Ward of Diego Martin', 3367, 223, 10.7, -61.58333),
(108972, 'Debe', 3365, 223, 10.20846, -61.45273),
(108979, 'Peñal', 3365, 223, 10.16667, -61.46667),
(108980, 'Point Fortin', 3360, 223, 10.17411, -61.68407),
(108976, 'Mucurapo', 3363, 223, 10.66253, -61.53697),
(108981, 'Port of Spain', 3363, 223, 10.66668, -61.51889),
(108982, 'Princes Town', 3368, 223, 10.27184, -61.37103),
(108983, 'Rio Claro', 3356, 223, 10.30594, -61.17556),
(108974, 'Marabella', 3359, 223, 10.30618, -61.44671),
(108975, 'Mon Repos', 3359, 223, 10.27979, -61.4459),
(108984, 'San Fernando', 3359, 223, 10.27969, -61.46835),
(108973, 'Laventille', 3357, 223, 10.64917, -61.49889),
(108985, 'Sangre Grande', 3361, 223, 10.58705, -61.13008),
(108987, 'Siparia', 3364, 223, 10.14525, -61.5074),
(108992, 'Ward of Siparia', 3364, 223, 10.15, -61.46667),
(108986, 'Scarborough', 5735, 223, 11.18229, -60.73525),
(108969, 'Arouca', 3358, 223, 10.62877, -61.33487),
(108977, 'Paradise', 3358, 223, 10.65298, -61.36298),
(108989, 'Tunapuna', 3358, 223, 10.65245, -61.38878);
