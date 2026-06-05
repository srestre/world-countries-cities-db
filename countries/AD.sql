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
(6, 'Andorra', 'Andorra', 'AD', 'AND', 'Europe', 'Europa', 'Southern Europe', 'Europa del Sur', 'Andorra la Vella', 'EUR', 42.5, 1.5, '🇦🇩');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(488, 'Andorra la Vella', 'Andorra la Vella', 6, 'AD', '07', 'parish', 'parroquia', 42.5063174, 1.5218355),
(489, 'Canillo', 'Canillo', 6, 'AD', '02', 'parish', 'parroquia', 42.5868092, 1.6574431),
(487, 'Encamp', 'Encamp', 6, 'AD', '03', 'parish', 'parroquia', 42.5359764, 1.5836773),
(492, 'Escaldes-Engordany', 'Escaldes-Engordany', 6, 'AD', '08', 'parish', 'parroquia', 42.486196, 1.6037711),
(493, 'La Massana', 'La Massana', 6, 'AD', '04', 'parish', 'parroquia', 42.545625, 1.5147392),
(491, 'Ordino', 'Ordino', 6, 'AD', '05', 'parish', 'parroquia', 42.5994433, 1.5402327),
(490, 'Sant Julià de Lòria', 'Sant Julià de Lòria', 6, 'AD', '06', 'parish', 'parroquia', 42.4668541, 1.4923277);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(1, 'Andorra la Vella', 488, 6, 42.50779, 1.52109),
(3, 'Canillo', 489, 6, 42.5676, 1.59756),
(4, 'El Tarter', 489, 6, 42.57952, 1.65362),
(5, 'Encamp', 487, 6, 42.53474, 1.58014),
(7, 'Pas de la Casa', 487, 6, 42.54277, 1.73361),
(10, 'les Escaldes', 492, 6, 42.50729, 1.53414),
(2, 'Arinsal', 493, 6, 42.57205, 1.48453),
(9, 'la Massana', 493, 6, 42.54499, 1.51483),
(6, 'Ordino', 491, 6, 42.55623, 1.53319),
(8, 'Sant Julià de Lòria', 490, 6, 42.46372, 1.49129);
