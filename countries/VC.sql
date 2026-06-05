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
(188, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 'Americas', 'Caribbean', 'Kingstown', 'XCD', 13.25, -61.2, '🇻🇨');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3389, 'Charlotte', 188, 'VC', '01', 'parish', 13.2750872, -61.1462327),
(3388, 'Grenadines', 188, 'VC', '06', 'parish', 12.90447, -61.2765569),
(3386, 'Saint Andrew', 188, 'VC', '02', 'parish', 13.1942695, -61.2399866),
(3387, 'Saint David', 188, 'VC', '03', 'parish', 13.318364, -61.2008786),
(3384, 'Saint George', 188, 'VC', '04', 'parish', 13.166295, -61.1878512),
(3385, 'Saint Patrick', 188, 'VC', '05', 'parish', 13.2380793, -61.2364184);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(130030, 'Biabou', 3389, 188, 13.1943, -61.13904),
(130031, 'Byera Village', 3389, 188, 13.25636, -61.11954),
(130033, 'Georgetown', 3389, 188, 13.28054, -61.1185),
(130037, 'Port Elizabeth', 3388, 188, 13.01102, -61.23548),
(130036, 'Layou', 3386, 188, 13.20175, -61.27014),
(130032, 'Chateaubelair', 3387, 188, 13.29069, -61.24043),
(130034, 'Kingstown', 3384, 188, 13.15527, -61.22742),
(130035, 'Kingstown Park', 3384, 188, 13.15924, -61.23161),
(130029, 'Barrouallie', 3385, 188, 13.23676, -61.27275);
