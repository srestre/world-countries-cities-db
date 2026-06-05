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
(222, 'Tonga', 'TO', 'TON', 'Oceania', 'Polynesia', 'Nuku''alofa', 'TOP', -20, -175, '🇹🇴');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3913, 'Haʻapai', 222, 'TO', '02', 'division', -20.0587404, -174.6229919),
(3915, 'ʻEua', 222, 'TO', '01', 'division', -21.3705828, -174.9388843),
(3914, 'Niuas', 222, 'TO', '03', 'division', -15.9594, -173.783),
(3912, 'Tongatapu', 222, 'TO', '04', 'division', -21.1678253, -175.2738691),
(3911, 'Vavaʻu', 222, 'TO', '05', 'division', -18.6231468, -174.002138);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(107049, 'Pangai', 3913, 222, -19.81468, -174.35423),
(107051, '‘Ohonua', 3915, 222, -21.33333, -174.95),
(107045, 'Hihifo', 3914, 222, -15.9544, -173.79616),
(107044, 'Haveluloto', 3912, 222, -21.15216, -175.21333),
(107046, 'Kolonga', 3912, 222, -21.13333, -175.06667),
(107048, 'Nuku‘alofa', 3912, 222, -21.13938, -175.2018),
(107050, 'Vaini', 3912, 222, -21.19292, -175.17678),
(107047, 'Neiafu', 3911, 222, -18.6506, -173.98404);
