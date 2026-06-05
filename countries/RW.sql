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
(183, 'Rwanda', 'RW', 'RWA', 'Africa', 'Eastern Africa', 'Kigali', 'RWF', -2, 30, '🇷🇼');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(261, 'Eastern', 183, 'RW', '02', 'province', -1.7415136, 30.5404282),
(262, 'Kigali', 183, 'RW', '01', 'city', -1.950851, 30.061507),
(263, 'Northern', 183, 'RW', '03', 'province', -1.5809699, 29.9269776),
(259, 'Southern', 183, 'RW', '05', 'province', -2.6272137, 29.6063049),
(260, 'Western', 183, 'RW', '04', 'province', -0.7727891, 30.0884324);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(102798, 'Kibungo', 261, 183, -2.1597, 30.5427),
(102803, 'Rwamagana', 261, 183, -1.9487, 30.4347),
(102800, 'Kigali', 262, 183, -1.94995, 30.05885),
(102793, 'Byumba', 263, 183, -1.5763, 30.0675),
(102801, 'Musanze', 263, 183, -1.49984, 29.63497),
(102792, 'Butare', 259, 183, -2.59667, 29.73944),
(102795, 'Eglise Catholique Centrale GIKO', 259, 183, -1.93653, 29.8061),
(102797, 'Gitarama', 259, 183, -2.07444, 29.75667),
(102802, 'Nzega', 259, 183, -2.479, 29.5564),
(102794, 'Cyangugu', 260, 183, -2.4846, 28.9075),
(102796, 'Gisenyi', 260, 183, -1.70278, 29.25639),
(102799, 'Kibuye', 260, 183, -2.06028, 29.34778);
