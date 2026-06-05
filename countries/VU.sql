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
(237, 'Vanuatu', 'Vanuatu', 'VU', 'VUT', 'Oceania', 'Oceanía', 'Melanesia', 'Melanesia', 'Port Vila', 'VUV', -16, 167, '🇻🇺');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(4775, 'Malampa', 'Malampa', 237, 'VU', 'MAP', 'province', 'provincia', -16.2975, 167.8103716),
(4773, 'Penama', 'Penama', 237, 'VU', 'PAM', 'province', 'provincia', -15.2116666, 167.9360319),
(4776, 'Sanma', 'Sanma', 237, 'VU', 'SAM', 'province', 'provincia', -15.158134, 166.9393865),
(4774, 'Shefa', 'Shefa', 237, 'VU', 'SEE', 'province', 'provincia', -17.3283967, 168.2547316),
(4777, 'Tafea', 'Tafea', 237, 'VU', 'TAE', 'province', 'provincia', -19.3706034, 169.6752428),
(4772, 'Torba', 'Torba', 237, 'VU', 'TOB', 'province', 'provincia', -13.6644135, 167.1741636);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(130637, 'Lakatoro', 4775, 237, -16.09992, 167.41636),
(130639, 'Norsup', 4775, 237, -16.06536, 167.39714),
(130638, 'Luganville', 4776, 237, -15.51989, 167.16235),
(130640, 'Port-Olry', 4776, 237, -15.04175, 167.07265),
(130641, 'Port-Vila', 4774, 237, -17.73648, 168.31366),
(130636, 'Isangel', 4777, 237, -19.54167, 169.28167),
(130642, 'Sola', 4772, 237, -13.87611, 167.55167);
