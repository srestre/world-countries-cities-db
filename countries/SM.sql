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
(192, 'San Marino', 'San Marino', 'SM', 'SMR', 'Europe', 'Europa', 'Southern Europe', 'Europa del Sur', 'San Marino', 'EUR', 43.76666666, 12.41666666, '🇸🇲');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(59, 'Acquaviva', 'Acquaviva', 192, 'SM', '01', 'municipality', 'municipio', 43.9464246, 12.4191909),
(61, 'Borgo Maggiore', 'Borgo Maggiore', 192, 'SM', '06', 'municipality', 'municipio', 43.9411865, 12.447422),
(60, 'Chiesanuova', 'Chiesanuova', 192, 'SM', '02', 'municipality', 'municipio', 43.9053382, 12.4220187),
(64, 'Domagnano', 'Domagnano', 192, 'SM', '03', 'municipality', 'municipio', 43.9501929, 12.4681537),
(62, 'Faetano', 'Condizione', 192, 'SM', '04', 'municipality', 'municipio', 43.9269122, 12.4974633),
(66, 'Fiorentino', 'Fiorentino', 192, 'SM', '05', 'municipality', 'municipio', 43.9078337, 12.4581209),
(63, 'Montegiardino', 'Montegiardino', 192, 'SM', '08', 'municipality', 'municipio', 43.9052999, 12.4810542),
(58, 'San Marino', 'San Marino', 192, 'SM', '07', 'municipality', 'municipio', 43.94236, 12.457777),
(65, 'Serravalle', 'Serravalle', 192, 'SM', '09', 'municipality', 'municipio', 43.9699026, 12.4802946);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(104693, 'Acquaviva', 59, 192, 43.94593, 12.4185),
(104694, 'Borgo Maggiore', 61, 192, 43.94193, 12.44738),
(104699, 'Poggio di Chiesanuova', 60, 192, 43.90451, 12.42142),
(104695, 'Domagnano', 64, 192, 43.94961, 12.46828),
(104696, 'Faetano', 62, 192, 43.92831, 12.49798),
(104697, 'Fiorentino', 66, 192, 43.91001, 12.45738),
(104698, 'Monte Giardino', 63, 192, 43.90878, 12.48201),
(104700, 'San Marino', 58, 192, 43.93667, 12.44639),
(104701, 'Serravalle', 65, 192, 43.96897, 12.48167);
