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
(20, 'Barbados', 'BB', 'BRB', 'Americas', 'Caribbean', 'Bridgetown', 'BBD', 13.16666666, -59.53333333, '🇧🇧');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(1228, 'Christ Church', 20, 'BB', '01', 'parish', 13.082618, -59.5374451),
(1229, 'Saint Andrew', 20, 'BB', '02', 'parish', 13.2432904, -59.57317),
(1226, 'Saint George', 20, 'BB', '03', 'parish', 13.1384022, -59.5443721),
(1224, 'Saint James', 20, 'BB', '04', 'parish', 13.1863793, -59.625192),
(1227, 'Saint John', 20, 'BB', '05', 'parish', 13.1899463, -59.5592151),
(1223, 'Saint Joseph', 20, 'BB', '06', 'parish', 13.1899463, -59.5592151),
(1221, 'Saint Lucy', 20, 'BB', '07', 'parish', 13.3024068, -59.6129445),
(1230, 'Saint Michael', 20, 'BB', '08', 'parish', 13.1182985, -59.6015783),
(1222, 'Saint Peter', 20, 'BB', '09', 'parish', 13.2619779, -59.6207444),
(1220, 'Saint Philip', 20, 'BB', '10', 'parish', 13.129539, -59.4674102),
(1225, 'Saint Thomas', 20, 'BB', '11', 'parish', 13.177202, -59.5853833);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(8452, 'Oistins', 1228, 20, 13.07067, -59.54637),
(8450, 'Greenland', 1229, 20, 13.25808, -59.57763),
(8451, 'Holetown', 1224, 20, 13.18672, -59.63808),
(8447, 'Bathsheba', 1223, 20, 13.21133, -59.52596),
(8448, 'Bridgetown', 1230, 20, 13.10732, -59.62021),
(8453, 'Speightstown', 1222, 20, 13.25072, -59.64396),
(8449, 'Crane', 1220, 20, 13.10487, -59.44861);
