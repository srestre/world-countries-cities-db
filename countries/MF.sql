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
(190, 'Saint-Martin (French part)', 'MF', 'MAF', 'Americas', 'Caribbean', 'Marigot', 'EUR', 18.08333333, -63.95, '🇲🇫');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5820, 'Saint-Martin', 190, 'MF', '01', 'overseas collectivity', 18.0731, -63.0822);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(162131, 'Marigot', 5820, 190, 18.0731, -63.0822);
