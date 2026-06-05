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
(117, 'Kuwait', 'KW', 'KWT', 'Asia', 'Western Asia', 'Kuwait City', 'KWD', 29.5, 45.75, '🇰🇼');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(977, 'Al Ahmadi', 117, 'KW', 'AH', 'governorate', 28.8538571, 48.1652377),
(976, 'Al Asimah', 117, 'KW', 'KU', 'governorate', 29.0926128, 48.513355),
(975, 'Al Farwaniyah', 117, 'KW', 'FA', 'governorate', 29.2482539, 47.9136755),
(972, 'Al Jahra', 117, 'KW', 'JA', 'governorate', 29.3474636, 47.6722054),
(973, 'Hawalli', 117, 'KW', 'HA', 'governorate', 29.3236609, 48.1153148),
(974, 'Mubarak Al-Kabeer', 117, 'KW', 'MU', 'governorate', 29.1870956, 48.0827589);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(65572, 'Al Aḩmadī', 977, 117, 29.07694, 48.08389),
(65574, 'Al Faḩāḩīl', 977, 117, 29.0825, 48.13028),
(65575, 'Al Finţās', 977, 117, 29.17389, 48.12111),
(65578, 'Al Mahbūlah', 977, 117, 29.145, 48.13028),
(65579, 'Al Manqaf', 977, 117, 29.09611, 48.13278),
(65580, 'Al Wafrah', 977, 117, 28.63917, 47.93056),
(65582, 'Ar Riqqah', 977, 117, 29.14583, 48.09472),
(65571, 'Ad Dasmah', 976, 117, 29.365, 48.00139),
(65584, 'Ar Rābiyah', 976, 117, 29.295, 47.93306),
(65586, 'Ash Shāmīyah', 976, 117, 29.34722, 47.96167),
(65587, 'Az Zawr', 976, 117, 29.4425, 48.27472),
(65590, 'Kuwait City', 976, 117, 29.36972, 47.97833),
(65573, 'Al Farwānīyah', 975, 117, 29.2775, 47.95861),
(65589, 'Janūb as Surrah', 975, 117, 29.26917, 47.97806),
(65577, 'Al Jahrā’', 972, 117, 29.3375, 47.65806),
(65583, 'Ar Rumaythīyah', 973, 117, 29.31167, 48.07417),
(65585, 'As Sālimīyah', 973, 117, 29.33389, 48.07611),
(65588, 'Bayān', 973, 117, 29.3032, 48.04881),
(65593, 'Ḩawallī', 973, 117, 29.33278, 48.02861),
(65591, 'Salwá', 973, 117, 29.29583, 48.07861),
(65569, 'Abu Al Hasaniya', 974, 117, 29.19076, 48.11355),
(65570, 'Abu Fatira', 974, 117, 29.19746, 48.10278),
(65576, 'Al Funayţīs', 974, 117, 29.22528, 48.10167),
(65581, 'Al-Masayel', 974, 117, 29.2393, 48.08862),
(65592, 'Şabāḩ as Sālim', 974, 117, 29.25722, 48.05722);
