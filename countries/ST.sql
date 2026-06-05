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
(193, 'Sao Tome and Principe', 'Santo Tomé y Príncipe', 'ST', 'STP', 'Africa', 'África', 'Middle Africa', 'África Central', 'Sao Tome', 'STN', 1, 7, '🇸🇹');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5728, 'Água Grande', 'Água Grande', 193, 'ST', '01', 'district', 'distrito', 0.3301924, 6.733343),
(5729, 'Cantagalo', 'Cantagalo', 193, 'ST', '02', 'district', 'distrito', 0.21667, 6.7),
(5730, 'Caué', 'Caué', 193, 'ST', '03', 'district', 'distrito', 0.13415, 6.63825),
(5731, 'Lemba', 'Lemba', 193, 'ST', '04', 'district', 'distrito', 0.22, 6.58),
(5732, 'Lobata', 'Lobata', 193, 'ST', '05', 'district', 'distrito', 0.41, 6.61),
(5733, 'Mé-Zóchi', 'Mé-Zóchi', 193, 'ST', '06', 'district', 'distrito', 0.3, 6.6),
(5734, 'Príncipe', 'Príncipe', 193, 'ST', 'P', 'autonomous region', 'región autónoma', 1.6139381, 7.4056928);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(104838, 'São Tomé', 5728, 193, 0.33654, 6.72732),
(160117, 'Santana', 5729, 193, 0.25389, 6.73444),
(160118, 'São João dos Angolares', 5730, 193, 0.1372, 6.64972),
(160119, 'Neves', 5731, 193, 0.36667, 6.55),
(160120, 'Guadalupe', 5732, 193, 0.38333, 6.61667),
(160136, 'Trindade', 5733, 193, 0.29667, 6.68139),
(160137, 'Santo António', 5734, 193, 1.63943, 7.41951);
