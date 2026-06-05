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
(60, 'Djibouti', 'Yibuti', 'DJ', 'DJI', 'Africa', 'África', 'Eastern Africa', 'África Oriental', 'Djibouti', 'DJF', 11.5, 43, '🇩🇯');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(2933, 'Ali Sabieh', 'Autrement l''a trouvé', 60, 'DJ', 'AS', 'region', 'región', 11.2133809, 42.8699249),
(2932, 'Arta', 'Art', 60, 'DJ', 'AR', 'region', 'región', 11.5219459, 42.8393629),
(2930, 'Dikhil', 'Dikhil', 60, 'DJ', 'DI', 'region', 'región', 11.1054336, 42.3704744),
(2929, 'Djibouti', 'Djibouti', 60, 'DJ', 'DJ', 'city', 'ciudad', 11.8145966, 42.8453061),
(2928, 'Obock', 'Obosek', 60, 'DJ', 'OB', 'region', 'región', 12.2111051, 43.1685809),
(2931, 'Tadjourah', 'Tadamand', 60, 'DJ', 'TA', 'region', 'región', 12.0358121, 42.5174505);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(30561, 'Ali Sabieh', 2933, 60, 11.15583, 42.7125),
(30567, 'Goubétto', 2933, 60, 11.42389, 43.00028),
(30569, 'Holhol', 2933, 60, 11.31028, 42.92944),
(30563, 'Arta', 2932, 60, 11.52639, 42.85194),
(30564, 'Dikhil', 2930, 60, 11.10454, 42.36971),
(30568, 'Gâlâfi', 2930, 60, 11.71583, 41.83611),
(30565, 'Djibouti', 2929, 60, 11.58901, 43.14503),
(30570, 'Loyada', 2929, 60, 11.46111, 43.25278),
(30562, 'Alaïli Ḏaḏḏa‘', 2928, 60, 12.42167, 42.89556),
(30571, 'Obock', 2928, 60, 11.96693, 43.28835),
(30566, 'Dorra', 2931, 60, 12.15028, 42.47624),
(30572, 'Tadjourah', 2931, 60, 11.78778, 42.88222);
