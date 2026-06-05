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
(87, 'Grenada', 'GD', 'GRD', 'Americas', 'Caribbean', 'St. George''s', 'XCD', 12.11666666, -61.66666666, '🇬🇩');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3867, 'Carriacou', 87, 'GD', '10', 'dependency', 12.4829985, -61.4448436),
(3865, 'Saint Andrew', 87, 'GD', '01', 'parish', 12.1111935, -61.6865971),
(3869, 'Saint David', 87, 'GD', '02', 'parish', 12.0428069, -61.6778988),
(3864, 'Saint George', 87, 'GD', '03', 'parish', 12.0535331, -61.751805),
(3868, 'Saint John', 87, 'GD', '04', 'parish', 12.1444029, -61.7121841),
(3866, 'Saint Mark', 87, 'GD', '05', 'parish', 12.1886437, -61.6954355),
(3863, 'Saint Patrick', 87, 'GD', '06', 'parish', 12.2102986, -61.6350539);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(52030, 'Hillsborough', 3867, 87, 12.48292, -61.45597),
(52029, 'Grenville', 3865, 87, 12.12278, -61.62498),
(52031, 'Saint David’s', 3869, 87, 12.04903, -61.66875),
(52032, 'Saint George''s', 3864, 87, 12.05288, -61.75226),
(52028, 'Gouyave', 3868, 87, 12.16462, -61.72965),
(52034, 'Victoria', 3866, 87, 12.19021, -61.70677),
(52033, 'Sauteurs', 3863, 87, 12.21833, -61.63917);
