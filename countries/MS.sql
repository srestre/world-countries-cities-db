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
(148, 'Montserrat', 'MS', 'MSR', 'Americas', 'Caribbean', 'Plymouth', 'XCD', 16.75, -62.2, '🇲🇸');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5421, 'Saint Anthony', 148, 'MS', '03', 'parish', 16.7056245, -62.1855304),
(5420, 'Saint Georges', 148, 'MS', '02', 'parish', 16.7484755, -62.1907472),
(5419, 'Saint Peter', 148, 'MS', '01', 'parish', 16.7765981, -62.2000786);

