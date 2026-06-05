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
(136, 'Man (Isle of)', 'Isla de Man', 'IM', 'IMN', 'Europe', 'Europa', 'Northern Europe', 'Europa del Norte', 'Douglas, Isle of Man', 'GBP', 54.25, -4.5, '🇮🇲');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5303, 'Ayre', 'Ayre', 136, 'IM', '01', 'sheadings', 'sheadings', 54.2359207, -4.5147669),
(5304, 'Garff', 'Garff', 136, 'IM', '02', 'sheadings', 'sheadings', 54.2359207, -4.5147669),
(5305, 'Glenfaba', 'Glenfaba', 136, 'IM', '03', 'sheadings', 'sheadings', 54.2359207, -4.5147669),
(5306, 'Michael', 'Michael', 136, 'IM', '04', 'sheadings', 'sheadings', 54.2359207, -4.5147669),
(5307, 'Middle', 'Middle', 136, 'IM', '05', 'sheadings', 'sheadings', 54.2359207, -4.5147669),
(5308, 'Rushen', 'Rush', 136, 'IM', '06', 'sheadings', 'sheadings', 54.2359207, -4.5147669);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(154082, 'Andreas', 5303, 136, 54.368414, -4.5211463),
(154083, 'Bride', 5303, 136, 54.3831657, -4.4080356),
(154084, 'Lezayre', 5303, 136, 54.2962193, -4.5311015),
(154085, 'Lonan', 5304, 136, 54.2210452, -4.5010306),
(154086, 'Maughold', 5304, 136, 54.2549454, -4.5122349),
(154087, 'Onchan', 5304, 136, 54.1981508, -4.5490898),
(154088, 'German', 5305, 136, 54.2187145, -4.7065273),
(154089, 'Ballaugh', 5306, 136, 54.3048121, -4.6207526),
(154090, 'Jurby', 5306, 136, 54.3590528, -4.5406586),
(154091, 'Michael', 5306, 136, 54.2742778, -4.6427325),
(154092, 'Braddan', 5307, 136, 54.1632828, -4.5258506),
(154093, 'Marown', 5307, 136, 54.1846242, -4.6495218),
(154094, 'Santon', 5307, 136, 54.1205489, -4.6493775),
(154095, 'Arbory', 5308, 136, 54.1087807, -4.8356454),
(154097, 'Malew', 5308, 136, 54.1118049, -4.8013827),
(154096, 'Rushen', 5308, 136, 54.0908492, -4.8414982);
