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
(8, 'Anguilla', 'Anguilla', 'AI', 'AIA', 'Americas', 'América', 'Caribbean', 'Caribe', 'The Valley', 'XCD', 18.25, -63.16666666, '🇦🇮');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5273, 'Blowing Point', 'Blowing Point', 8, 'AI', '01', 'district', 'distrito', 18.1765553, -63.1021296),
(5274, 'East End', 'East End', 8, 'AI', '02', 'district', 'distrito', 18.2342629, -62.997374),
(5275, 'George Hill', 'George Hill', 8, 'AI', '03', 'district', 'distrito', 18.2036599, -63.0648112),
(5276, 'Island Harbour', 'Island Harbour', 8, 'AI', '04', 'district', 'distrito', 18.2556888, -63.0012814),
(5277, 'North Hill', 'North Hill', 8, 'AI', '05', 'district', 'distrito', 18.2050863, -63.0858457),
(5278, 'North Side', 'North Side', 8, 'AI', '06', 'district', 'distrito', 18.2300544, -63.051889),
(5279, 'Sandy Ground', 'Sandy Ground', 8, 'AI', '07', 'district', 'distrito', 18.2018551, -63.0973471),
(5280, 'Sandy Hill', 'Sandy Hill', 8, 'AI', '08', 'district', 'distrito', 18.218921, -63.0129916),
(5281, 'South Hill', 'South Hill', 8, 'AI', '09', 'district', 'distrito', 18.1892475, -63.0976367),
(5282, 'Stoney Ground', 'Stoney Ground', 8, 'AI', '10', 'district', 'distrito', 18.2179997, -63.0400727),
(5283, 'The Farrington', 'The Farrington', 8, 'AI', '11', 'district', 'distrito', 18.2134701, -63.0272162),
(5284, 'The Quarter', 'The Quarter', 8, 'AI', '12', 'district', 'distrito', 18.2145334, -63.0564489),
(5285, 'The Valley', 'The Valley', 8, 'AI', '13', 'district', 'distrito', 18.2145861, -63.0517759),
(5286, 'West End', 'West End', 8, 'AI', '14', 'district', 'distrito', 18.1721666, -63.1567037);

