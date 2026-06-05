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
(153, 'Nauru', 'NR', 'NRU', 'Oceania', 'Micronesia', 'Yaren', 'AUD', -0.53333333, 166.91666666, '🇳🇷');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(4656, 'Aiwo', 153, 'NR', '01', 'district', -0.5340012, 166.9138873),
(4658, 'Anabar', 153, 'NR', '02', 'district', -0.5133517, 166.9484624),
(4667, 'Anetan', 153, 'NR', '03', 'district', -0.5064343, 166.9427006),
(4663, 'Anibare', 153, 'NR', '04', 'district', -0.5294758, 166.9513432),
(4660, 'Baiti', 153, 'NR', '05', 'district', -0.510431, 166.9275744),
(4665, 'Boe', 153, 'NR', '06', 'district', -0.5423003, 166.9160609),
(4662, 'Buada', 153, 'NR', '07', 'district', -0.5328777, 166.9268541),
(4666, 'Denigomodu', 153, 'NR', '08', 'district', -0.5247964, 166.9167689),
(4654, 'Ewa', 153, 'NR', '09', 'district', -0.5087241, 166.9369384),
(4661, 'Ijuw', 153, 'NR', '10', 'district', -0.5202767, 166.9571046),
(4657, 'Meneng', 153, 'NR', '11', 'district', -0.546724, 166.938379),
(4659, 'Nibok', 153, 'NR', '12', 'district', -0.5196208, 166.9189301),
(4655, 'Uaboe', 153, 'NR', '13', 'district', -0.5202222, 166.9311761),
(4664, 'Yaren', 153, 'NR', '14', 'district', -0.5466857, 166.9210913);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(79762, 'Arijejen', 4656, 153, -0.52545, 166.91247),
(79761, 'Anabar', 4658, 153, -0.50845, 166.95326),
(79763, 'Baiti', 4660, 153, -0.50803, 166.92945),
(79764, 'Ijuw', 4661, 153, -0.521, 166.95813),
(79765, 'Menen', 4657, 153, -0.54539, 166.94871),
(79766, 'Uaboe', 4655, 153, -0.51393, 166.92384),
(79767, 'Yaren', 4664, 153, -0.55085, 166.9252);
