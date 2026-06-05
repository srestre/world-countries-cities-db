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
(86, 'Greenland', 'Groenlandia', 'GL', 'GRL', 'Americas', 'América', 'Northern America', 'Norteamérica', 'Nuuk', 'DKK', 72, -40, '🇬🇱');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5379, 'Avannaata', 'Avannaata', 86, 'GL', 'AV', 'municipality', 'municipio', 76.5049265, -56.2911976),
(5380, 'Kujalleq', 'Kujalleq', 86, 'GL', 'KU', 'municipality', 'municipio', 61, -45),
(5381, 'Qeqertalik', 'Qeqertalik', 86, 'GL', 'QT', 'municipality', 'municipio', 68.8249553, -54.7622472),
(5382, 'Qeqqata', 'Qeqqata', 86, 'GL', 'QE', 'municipality', 'municipio', 66.5, -48),
(5383, 'Sermersooq', 'Sermersooq', 86, 'GL', 'SM', 'municipality', 'municipio', 66, -40);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(154930, 'Ilulissat', 5379, 86, 69.2279488, -51.1280539),
(154931, 'Qaanaaq', 5379, 86, 77.4674009, -69.2483711),
(154933, 'Upernavik', 5379, 86, 72.7868603, -56.1623671),
(154932, 'Uummannaq', 5379, 86, 70.6786897, -52.1497824),
(154934, 'Nanortalik', 5380, 86, 60.1430825, -45.2562905),
(154935, 'Narsaq', 5380, 86, 60.9114078, -46.0685708),
(154936, 'Qaqortoq', 5380, 86, 60.719596, -46.0548163),
(154937, 'Aasiaat', 5381, 86, 68.707628, -52.8995136),
(154938, 'Kangaatsiaq', 5381, 86, 68.3081845, -53.4768533),
(154939, 'Qasigiannguit', 5381, 86, 68.8198632, -51.2091637),
(154940, 'Qeqertarsuaq', 5381, 86, 69.2443037, -53.5644006),
(154941, 'Maniitsoq', 5382, 86, 65.4065799, -52.9422573),
(154942, 'Sisimiut', 5382, 86, 66.9394574, -53.7456766),
(154943, 'Ammassalik', 5383, 86, 65.6145267, -37.6501466),
(154944, 'Ittoqqortoormiit', 5383, 86, 70.4863421, -21.979866),
(154945, 'Ivittuut', 5383, 86, 61.2065184, -48.1819851),
(154946, 'Nuuk', 5383, 86, 64.1791009, -51.7480091),
(154947, 'Paamiut', 5383, 86, 62.0025962, -49.7051959);
