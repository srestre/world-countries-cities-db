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
(94, 'Guyana', 'Guyana', 'GY', 'GUY', 'Americas', 'América', 'South America', 'Sudamérica', 'Georgetown', 'GYD', 5, -59, '🇬🇾');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(2764, 'Barima-Waini', 'Barima-Waini', 94, 'GY', 'BA', 'region', 'región', 7.7559147, -59.7179022),
(2760, 'Cuyuni-Mazaruni', 'The Cunyi-Pieces', 94, 'GY', 'CU', 'region', 'región', 6.188854, -59.849737),
(2767, 'Demerara-Mahaica', 'Demerara-Mahaica', 94, 'GY', 'DE', 'region', 'región', 6.4547883, -58.1280676),
(2766, 'East Berbice-Corentyne', 'East Berbice-Corentyne', 94, 'GY', 'EB', 'region', 'región', 3.8972611, -58.1383925),
(2768, 'Essequibo Islands-West Demerara', 'Overcome Islands-West Demerara', 94, 'GY', 'ES', 'region', 'región', 6.8777848, -58.3114218),
(2762, 'Mahaica-Berbice', 'Mahaica-Berbice', 94, 'GY', 'MA', 'region', 'región', 6.2766898, -57.82391),
(2765, 'Pomeroon-Supenaam', 'Pomerone superconame', 94, 'GY', 'PM', 'region', 'región', 7.2049548, -58.8295641),
(2761, 'Potaro-Siparuni', 'Potaro-saiparuni', 94, 'GY', 'PT', 'region', 'región', 4.8622287, -59.4193612),
(2763, 'Upper Demerara-Berbice', 'Upper Demerara-Berbice', 94, 'GY', 'UD', 'region', 'región', 5.5612677, -58.154152),
(2769, 'Upper Takutu-Upper Essequibo', 'Upper Takutu-Upper Essequibo', 94, 'GY', 'UT', 'region', 'región', 2.8449628, -58.9784823);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(53826, 'Mabaruma', 2764, 94, 8.2, -59.78333),
(53822, 'Bartica', 2760, 94, 6.40799, -58.62192),
(53823, 'Georgetown', 2767, 94, 6.80448, -58.15527),
(53827, 'Mahaica Village', 2767, 94, 6.68405, -57.92181),
(53830, 'New Amsterdam', 2766, 94, 6.24793, -57.5171),
(53833, 'Skeldon', 2766, 94, 5.88333, -57.13333),
(53831, 'Parika', 2768, 94, 6.83712, -58.42941),
(53834, 'Vreed-en-Hoop', 2768, 94, 6.80927, -58.19798),
(53828, 'Mahaicony Village', 2762, 94, 6.57633, -57.80486),
(53832, 'Rosignol', 2762, 94, 6.27095, -57.53697),
(53821, 'Anna Regina', 2765, 94, 7.26439, -58.50769),
(53829, 'Mahdia', 2761, 94, 5.26667, -59.15),
(53825, 'Linden', 2763, 94, 6.00809, -58.30714),
(53824, 'Lethem', 2769, 94, 3.38333, -59.8);
