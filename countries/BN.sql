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
(33, 'Brunei', 'BN', 'BRN', 'Asia', 'South-Eastern Asia', 'Bandar Seri Begawan', 'BND', 4.5, 114.66666666, '🇧🇳');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(1217, 'Belait', 33, 'BN', 'BE', 'district', 4.4349938, 114.4946524),
(1216, 'Brunei-Muara', 33, 'BN', 'BM', 'district', 4.9752098, 114.9367663),
(1218, 'Temburong', 33, 'BN', 'TE', 'district', 4.629184, 115.1634408),
(1219, 'Tutong', 33, 'BN', 'TU', 'district', 4.682681, 114.6562706);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(9820, 'Kuala Belait', 1217, 33, 4.58361, 114.2312),
(9823, 'Seria', 1217, 33, 4.60637, 114.32476),
(9816, 'Bandar Seri Begawan', 1216, 33, 4.89035, 114.94006),
(9818, 'Berakas A', 1216, 33, 4.97032, 114.92989),
(9819, 'Kapok', 1216, 33, 5.02447, 115.04664),
(9821, 'Mentiri', 1216, 33, 4.97058, 115.02078),
(9822, 'Serasa', 1216, 33, 5.01718, 115.05841),
(9817, 'Bangar', 1218, 33, 4.70861, 115.07167),
(9824, 'Tutong', 1219, 33, 4.80278, 114.64917);
