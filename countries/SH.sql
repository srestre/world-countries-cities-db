CREATE TABLE IF NOT EXISTS countries (
  id INTEGER PRIMARY KEY, name VARCHAR(100), name_es VARCHAR(100), iso2 CHAR(2), iso3 CHAR(3),
  region VARCHAR(100), region_es VARCHAR(100), subregion VARCHAR(100), subregion_es VARCHAR(100),
  capital VARCHAR(100), currency VARCHAR(255), latitude DECIMAL(10,8), longitude DECIMAL(11,8), emoji VARCHAR(16)
);
CREATE TABLE IF NOT EXISTS states (
  id INTEGER PRIMARY KEY, name VARCHAR(255), native VARCHAR(255), country_id INTEGER, country_code CHAR(2),
  state_code VARCHAR(10), type VARCHAR(191), type_es VARCHAR(191), latitude DECIMAL(10,8), longitude DECIMAL(11,8)
);
CREATE TABLE IF NOT EXISTS cities (
  id INTEGER PRIMARY KEY, name VARCHAR(255), state_id INTEGER, country_id INTEGER,
  latitude DECIMAL(10,8), longitude DECIMAL(11,8)
);

INSERT INTO countries (id, name, name_es, iso2, iso3, region, region_es, subregion, subregion_es, capital, currency, latitude, longitude, emoji) VALUES
(184, 'Saint Helena', 'Santa Helena', 'SH', 'SHN', 'Africa', 'África', 'Western Africa', 'África Occidental', 'Jamestown', 'SHP', -15.95, -5.7, '🇸🇭');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5440, 'Alarm Forest', 'Alarm Forest', 184, 'SH', '01', 'district', 'distrito', -15.9485043, -5.7028194),
(5441, 'Blue Hill', 'Blue Hill', 184, 'SH', '02', 'district', 'distrito', -15.9801303, -5.7489856),
(5442, 'Half Tree Hollow', 'Half Tree Hollow', 184, 'SH', '03', 'district', 'distrito', -15.9346328, -5.7194732),
(5443, 'Jamestown', 'Jamestown', 184, 'SH', '04', 'district', 'distrito', -15.9288308, -5.7203338),
(5444, 'Levelwood', 'Levelwood', 184, 'SH', '05', 'district', 'distrito', -15.9743129, -5.6805785),
(5445, 'Longwood', 'Longwood', 184, 'SH', '06', 'district', 'distrito', -15.9493288, -5.6858605),
(5447, 'Saint Paul''s', 'Saint Paul''s', 184, 'SH', '08', 'district', 'distrito', -15.9851267, -5.7380986),
(5446, 'Sandy Bay', 'Sandy Bay', 184, 'SH', '07', 'district', 'distrito', -16.0060601, -5.7127075);

