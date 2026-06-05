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
(157, 'New Caledonia', 'Nueva Caledonia', 'NC', 'NCL', 'Oceania', 'Oceanía', 'Melanesia', 'Melanesia', 'Noumea', 'XPF', -21.5, 165.5, '🇳🇨');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5227, 'Loyalty Islands Province', 'Loyalty Islands Province', 157, 'NC', '03', 'province', 'provincia', -20.972966, 167.2884295),
(5226, 'North Province', 'Province du Nord', 157, 'NC', '02', 'province', 'provincia', -20.1472512, 164.1237568),
(5225, 'South Province', 'Province du sud', 157, 'NC', '01', 'province', 'provincia', -22.2758421, 166.6417946);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(153638, 'Lifou', 5227, 157, -20.9667, 167.2333),
(153639, 'Maré', 5227, 157, -21.5167, 167.9833),
(153637, 'Houaïlou', 5226, 157, -21.2909, 165.6217),
(153635, 'Koné', 5226, 157, -21.059, 164.8518),
(153636, 'Poindimié', 5226, 157, -20.9496, 165.3293),
(153634, 'Bourail', 5225, 157, -21.5701, 165.4804),
(153632, 'Dumbéa', 5225, 157, -22.15, 166.45),
(153631, 'Le Mont-Dore', 5225, 157, -22.2157, 166.4665),
(153630, 'Nouméa', 5225, 157, -22.2758, 166.458),
(153633, 'Païta', 5225, 157, -22.1337, 166.3505);
