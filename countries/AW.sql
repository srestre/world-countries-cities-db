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
(13, 'Aruba', 'Aruba', 'AW', 'ABW', 'Americas', 'América', 'Caribbean', 'Caribe', 'Oranjestad', 'AWG', 12.5, -69.96666666, '🇦🇼');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5243, 'Noord', 'Noord', 13, 'AW', '01', 'region', 'región', 12.5636805, -70.0329869),
(5341, 'Oranjestad', 'Oranjestad', 13, 'AW', '09', 'capital city', 'ciudad capital', 12.5201024, -70.0371329),
(5245, 'Oranjestad East', 'Oranjestad East', 13, 'AW', '03', 'region', 'región', 12.5022696, -70.0149586),
(5244, 'Oranjestad West', 'Oranjestad West', 13, 'AW', '02', 'region', 'región', 12.5361486, -70.0430597),
(5246, 'Paradera', 'Paradera', 13, 'AW', '04', 'region', 'región', 12.5362871, -70.0148511),
(5247, 'San Nicolaas Noord', 'San Nicolaas Noord', 13, 'AW', '05', 'region', 'región', 12.4642717, -69.9434939),
(5248, 'San Nicolaas Zuid', 'San Nicolaas Zuid', 13, 'AW', '06', 'region', 'región', 12.4278558, -69.9381079),
(5249, 'Santa Cruz', 'Santa Cruz', 13, 'AW', '07', 'region', 'región', 12.5112836, -69.9876966),
(5250, 'Savaneta', 'Savaneta', 13, 'AW', '08', 'region', 'región', 12.4526385, -69.9496521);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(160400, 'Alto Vista', 5341, 13, 12.5705, -70.01912),
(160398, 'Moco', 5341, 13, 12.55134, -70.00843),
(160395, 'Noord', 5341, 13, 12.56596, -70.03198),
(160396, 'Oranjestad', 5341, 13, 12.52398, -70.02703),
(160399, 'Palm Beach', 5341, 13, 12.56847, -70.03887),
(160397, 'Paradera', 5341, 13, 12.5351, -70.00688),
(160394, 'Pos Chiquito', 5341, 13, 12.46497, -69.96233),
(160401, 'San Nicolas', 5341, 13, 12.43624, -69.90713),
(160404, 'Santa Cruz', 5341, 13, 12.50953, -69.98094),
(160405, 'Savaneta', 5341, 13, 12.45026, -69.93811),
(160402, 'Tanki Leendert', 5341, 13, 12.53914, -70.02004),
(160403, 'Washington', 5341, 13, 12.55837, -70.03816);
