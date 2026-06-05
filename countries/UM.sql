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
(234, 'United States Minor Outlying Islands', 'UM', 'UMI', 'Americas', 'Northern America', NULL, 'USD', 0, 0, '🇺🇲');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5212, 'Baker Island', 234, 'UM', '81', 'island', 0.1936266, -176.476908),
(5213, 'Howland Island', 234, 'UM', '84', 'island', 0.8113219, -176.6182736),
(5214, 'Jarvis Island', 234, 'UM', '86', 'island', -0.3743503, -159.9967206),
(5215, 'Johnston Atoll', 234, 'UM', '67', 'island', 16.7295035, -169.5336477),
(5216, 'Kingman Reef', 234, 'UM', '89', 'island', 6.383333, -162.416667),
(5217, 'Midway Islands', 234, 'UM', '71', 'island', 28.2072168, -177.3734926),
(5218, 'Navassa Island', 234, 'UM', '76', 'island', 18.4100689, -75.0114612),
(5219, 'Palmyra Atoll', 234, 'UM', '95', 'island', 5.8885026, -162.0786656),
(5220, 'Wake Island', 234, 'UM', '79', 'island', 19.279619, 166.6499348);

