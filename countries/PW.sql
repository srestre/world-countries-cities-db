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
(168, 'Palau', 'Palau', 'PW', 'PLW', 'Oceania', 'Oceanía', 'Micronesia', 'Micronesia', 'Melekeok', 'USD', 7.5, 134.5, '🇵🇼');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(4540, 'Aimeliik', 'Ameliikik', 168, 'PW', '002', 'state', 'estado', 7.5651497, 134.1469665),
(4528, 'Airai', 'Airai', 168, 'PW', '004', 'state', 'estado', 7.3599342, 134.5601154),
(4538, 'Angaur', 'Angaur', 168, 'PW', '010', 'state', 'estado', 6.909223, 134.1387934),
(4529, 'Hatohobei', 'Hatohobei', 168, 'PW', '050', 'state', 'estado', 3.0070658, 131.1237781),
(4539, 'Kayangel', 'Kayael', 168, 'PW', '100', 'state', 'estado', 8.0822491, 134.7189633),
(4532, 'Koror', 'Increase', 168, 'PW', '150', 'state', 'estado', 7.3337487, 134.4762806),
(4530, 'Melekeok', 'Melekeok', 168, 'PW', '212', 'state', 'estado', 7.4726013, 134.7548743),
(4537, 'Ngaraard', 'To eat', 168, 'PW', '214', 'state', 'estado', 7.6424529, 134.7328064),
(4533, 'Ngarchelong', 'Ngarchelong', 168, 'PW', '218', 'state', 'estado', 7.8467235, 134.4733014),
(4527, 'Ngardmau', 'Kerdown', 168, 'PW', '222', 'state', 'estado', 7.726789, 134.2765486),
(4531, 'Ngatpang', 'Ngatpang', 168, 'PW', '224', 'state', 'estado', 7.6117591, 134.1799732),
(4536, 'Ngchesar', 'Nkchesar', 168, 'PW', '226', 'state', 'estado', 7.417716, 134.7114947),
(4541, 'Ngeremlengui', 'Ngeremlengui', 168, 'PW', '227', 'state', 'estado', 7.6590207, 134.2120044),
(4534, 'Ngiwal', 'Ngiwal', 168, 'PW', '228', 'state', 'estado', 7.5407316, 134.7298202),
(4526, 'Peleliu', 'Turn over', 168, 'PW', '350', 'state', 'estado', 7.0113797, 134.246065),
(4535, 'Sonsorol', 'Sonsorol', 168, 'PW', '370', 'state', 'estado', 5.3268119, 132.2239117);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(89709, 'Ngchemiangel', 4540, 168, 7.44613, 134.47678),
(89712, 'Ngetkib', 4528, 168, 7.36451, 134.51484),
(89700, 'Angaur State', 4538, 168, 6.90601, 134.12997),
(89714, 'Tobi Village', 4529, 168, 3.00488, 131.12168),
(89702, 'Kayangel', 4539, 168, 8.08228, 134.71725),
(89704, 'Koror', 4532, 168, 7.33978, 134.47326),
(89706, 'Melekeok Village', 4530, 168, 7.49567, 134.63671),
(89715, 'Ulimang', 4537, 168, 7.62416, 134.64208),
(89707, 'Mengellang', 4533, 168, 7.6957, 134.63054),
(89708, 'Ngardmau', 4527, 168, 7.60986, 134.5744),
(89710, 'Ngchesar Hamlet', 4536, 168, 7.46932, 134.60991),
(89701, 'Imeong Hamlet', 4541, 168, 7.53134, 134.52713),
(89711, 'Ngerkeai', 4534, 168, 7.55456, 134.63612),
(89703, 'Kloulklubed', 4526, 168, 7.04192, 134.25561),
(89713, 'Sonsorol Village', 4535, 168, 5.32608, 132.21943);
