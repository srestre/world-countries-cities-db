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
(150, 'Mozambique', 'Mozambique', 'MZ', 'MOZ', 'Africa', 'África', 'Eastern Africa', 'África Oriental', 'Maputo', 'MZN', -18.25, 35, '🇲🇿');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(3327, 'Cabo Delgado', 'Cabo Delgado', 150, 'MZ', 'P', 'province', 'provincia', -12.4254942, 39.4168743),
(3329, 'Gaza', 'Gaza', 150, 'MZ', 'G', 'province', 'provincia', -23.328398, 32.8066057),
(3330, 'Inhambane', 'Inhambane', 150, 'MZ', 'I', 'province', 'provincia', -22.779116, 34.5661741),
(3337, 'Manica', 'Manga', 150, 'MZ', 'B', 'province', 'provincia', -19.0400995, 33.4318137),
(3332, 'Maputo', 'Maputo', 150, 'MZ', 'L', 'province', 'provincia', -25.5445167, 32.4578753),
(3335, 'Maputo', 'Maputo', 150, 'MZ', 'MPM', 'city', 'ciudad', -25.5445167, 32.4578753),
(3336, 'Nampula', 'Nampula', 150, 'MZ', 'N', 'province', 'provincia', -14.966969, 39.2707752),
(3333, 'Niassa', 'Niassa', 150, 'MZ', 'A', 'province', 'provincia', -13.0638577, 36.4669964),
(3331, 'Sofala', 'Sofala', 150, 'MZ', 'S', 'province', 'provincia', -19.0771666, 34.7164804),
(3334, 'Tete', 'Tete', 150, 'MZ', 'T', 'province', 'provincia', -15.5205193, 32.7682742),
(3328, 'Zambezia', 'Zambeze', 150, 'MZ', 'Q', 'province', 'provincia', -16.6460178, 36.991932);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(76595, 'Chiure', 3327, 150, -13.46665, 39.70317),
(76614, 'Mocímboa', 3327, 150, -11.31667, 40.35),
(76615, 'Montepuez', 3327, 150, -13.12556, 38.99972),
(76621, 'Pemba', 3327, 150, -12.97395, 40.51775),
(76592, 'Chibuto', 3329, 150, -24.68667, 33.53056),
(76596, 'Chokwé', 3329, 150, -24.53333, 32.98333),
(76604, 'Macia', 3329, 150, -25.02694, 33.09889),
(76625, 'Xai-Xai', 3329, 150, -25.05194, 33.64417),
(76601, 'Inhambane', 3330, 150, -23.865, 35.38333),
(76612, 'Maxixe', 3330, 150, -23.85972, 35.34722),
(76593, 'Chimoio', 3337, 150, -19.11639, 33.48333),
(76591, 'Boane', 3332, 150, -26.029, 32.389),
(76597, 'Concelho de Matola', 3332, 150, -25.83472, 32.49516),
(76605, 'Magude', 3332, 150, -25.02389, 32.6515),
(76607, 'Manhica', 3332, 150, -25.34035, 32.84234),
(76609, 'Marracuene', 3332, 150, -25.73938, 32.67436),
(76610, 'Matola', 3332, 150, -25.96222, 32.45889),
(76611, 'Matutiune', 3332, 150, -26.43418, 32.5882),
(76613, 'Moamba', 3332, 150, -25.60934, 32.24321),
(76618, 'Namaacha', 3332, 150, -26.109, 32.18),
(76623, 'Ressano Garcia', 3332, 150, -25.44278, 31.99528),
(76602, 'KaTembe', 3335, 150, -26.02985, 32.53204),
(76608, 'Maputo', 3335, 150, -25.96553, 32.58322),
(76589, 'António Enes', 3336, 150, -16.2325, 39.90861),
(76600, 'Ilha de Moçambique', 3336, 150, -15.03417, 40.73583),
(76616, 'Mutuáli', 3336, 150, -14.87056, 37.00444),
(76617, 'Nacala', 3336, 150, -14.56257, 40.68538),
(76619, 'Nampula', 3336, 150, -15.11646, 39.2666),
(76598, 'Cuamba', 3333, 150, -14.80306, 36.53722),
(76603, 'Lichinga', 3333, 150, -13.31278, 35.24056),
(76606, 'Mandimba', 3333, 150, -14.3525, 35.65056),
(76590, 'Beira', 3331, 150, -19.84361, 34.83889),
(76599, 'Dondo', 3331, 150, -19.60944, 34.74306),
(76620, 'Nhamatanda', 3331, 150, -19.349, 34.268),
(76624, 'Tete', 3334, 150, -16.15639, 33.58667),
(76588, 'Alto Molócuè', 3328, 150, -15.64932, 37.66384),
(76594, 'Chinde', 3328, 150, -18.58111, 36.45861),
(76622, 'Quelimane', 3328, 150, -17.87861, 36.88833);
