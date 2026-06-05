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
(18, 'Bahrain', 'BH', 'BHR', 'Asia', 'Western Asia', 'Manama', 'BHD', 26, 50.55, '🇧🇭');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(1992, 'Capital', 18, 'BH', '13', 'governorate', 26.4243233, 50.4747251),
(1995, 'Muharraq', 18, 'BH', '15', 'governorate', 26.2465946, 50.6164127),
(1994, 'Northern', 18, 'BH', '17', 'governorate', 26.2778477, 50.4181123),
(1993, 'Southern', 18, 'BH', '14', 'governorate', 25.8400069, 50.5902693);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(9757, 'Jidd Ḩafş', 1992, 18, 26.21861, 50.54778),
(9760, 'Manama', 1992, 18, 26.22787, 50.58565),
(9761, 'Sitrah', 1992, 18, 26.15472, 50.62056),
(9754, 'Al Ḩadd', 1995, 18, 26.24556, 50.65417),
(9753, 'Al Muharraq', 1995, 18, 26.25722, 50.61194),
(9758, 'Madīnat Ḩamad', 1994, 18, 26.11528, 50.50694),
(9755, 'Ar Rifā‘', 1993, 18, 26.13, 50.555),
(9756, 'Dār Kulayb', 1993, 18, 26.06861, 50.50389),
(9759, 'Madīnat ‘Īsá', 1993, 18, 26.17361, 50.54778);
