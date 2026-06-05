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
(61, 'Dominica', 'DM', 'DMA', 'Americas', 'Caribbean', 'Roseau', 'XCD', 15.41666666, -61.33333333, '🇩🇲');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(4082, 'Saint Andrew', 61, 'DM', '02', 'parish', 15.4238539, -61.3416513),
(4078, 'Saint David', 61, 'DM', '03', 'parish', 15.4238539, -61.3416513),
(4079, 'Saint George', 61, 'DM', '04', 'parish', 15.3058849, -61.3477286),
(4076, 'Saint John', 61, 'DM', '05', 'parish', 15.5739158, -61.4369757),
(4085, 'Saint Joseph', 61, 'DM', '06', 'parish', 15.4063155, -61.4239093),
(4083, 'Saint Luke', 61, 'DM', '07', 'parish', 15.2526483, -61.3606848),
(4077, 'Saint Mark', 61, 'DM', '08', 'parish', 15.2285265, -61.3500041),
(4080, 'Saint Patrick', 61, 'DM', '09', 'parish', 15.2770426, -61.2964775),
(4084, 'Saint Paul', 61, 'DM', '10', 'parish', 15.3630184, -61.3613416),
(4081, 'Saint Peter', 61, 'DM', '11', 'parish', 15.4997591, -61.4403471);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(31003, 'Calibishie', 4082, 61, 15.59297, -61.34901),
(31008, 'Marigot', 4082, 61, 15.53886, -61.28375),
(31017, 'Wesley', 4082, 61, 15.56667, -61.31667),
(31018, 'Woodford Hill', 4082, 61, 15.58093, -61.33149),
(31004, 'Castle Bruce', 4078, 61, 15.44397, -61.25723),
(31012, 'Rosalie', 4078, 61, 15.36667, -61.26667),
(31013, 'Roseau', 4079, 61, 15.30174, -61.38808),
(31011, 'Portsmouth', 4076, 61, 15.58333, -61.46667),
(31014, 'Saint Joseph', 4085, 61, 15.4, -61.43333),
(31015, 'Salisbury', 4085, 61, 15.43689, -61.43637),
(31009, 'Pointe Michel', 4083, 61, 15.25976, -61.37452),
(31016, 'Soufrière', 4077, 61, 15.23374, -61.35881),
(31002, 'Berekua', 4080, 61, 15.23333, -61.31667),
(31006, 'La Plaine', 4080, 61, 15.32768, -61.24753),
(31007, 'Mahaut', 4084, 61, 15.36357, -61.39701),
(31010, 'Pont Cassé', 4084, 61, 15.36667, -61.35),
(31005, 'Colihaut', 4081, 61, 15.48478, -61.46215);
