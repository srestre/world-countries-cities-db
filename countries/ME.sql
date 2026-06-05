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
(147, 'Montenegro', 'ME', 'MNE', 'Europe', 'Southern Europe', 'Podgorica', 'EUR', 42.5, 19.3, '🇲🇪');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(23, 'Andrijevica', 147, 'ME', '01', 'municipality', 42.7362477, 19.7859556),
(13, 'Bar', 147, 'ME', '02', 'municipality', 42.0979745, 19.0954528),
(21, 'Berane', 147, 'ME', '03', 'municipality', 42.8435792, 19.8728701),
(25, 'Bijelo Polje', 147, 'ME', '04', 'municipality', 43.0341595, 19.7473559),
(30, 'Budva', 147, 'ME', '05', 'municipality', 42.2885656, 18.8419505),
(14, 'Danilovgrad', 147, 'ME', '07', 'municipality', 42.5524049, 19.1052289),
(24, 'Gusinje', 147, 'ME', '22', 'municipality', 42.5563455, 19.8306051),
(5682, 'Herceg-Novi', 147, 'ME', '08', 'municipality', 42.45306, 18.53722),
(31, 'Kolašin', 147, 'ME', '09', 'municipality', 42.8238387, 19.5218005),
(26, 'Kotor', 147, 'ME', '10', 'municipality', 42.4249205, 18.7713332),
(22, 'Mojkovac', 147, 'ME', '11', 'municipality', 42.9624908, 19.5799899),
(17, 'Nikšić', 147, 'ME', '12', 'municipality', 42.7739388, 18.9488097),
(28, 'Old Royal Capital Cetinje', 147, 'ME', '06', 'municipality', 42.4783057, 18.8980059),
(12, 'Petnjica', 147, 'ME', '23', 'municipality', 42.925657, 19.9829219),
(19, 'Plav', 147, 'ME', '13', 'municipality', 42.6001337, 19.9407541),
(20, 'Pljevlja', 147, 'ME', '14', 'municipality', 43.3565611, 19.3584715),
(16, 'Plužine', 147, 'ME', '15', 'municipality', 43.1593384, 18.8551484),
(27, 'Podgorica', 147, 'ME', '16', 'municipality', 42.4415238, 19.2621081),
(15, 'Rožaje', 147, 'ME', '17', 'municipality', 42.8408389, 20.1670628),
(18, 'Šavnik', 147, 'ME', '18', 'municipality', 42.957197, 19.0946043),
(29, 'Tivat', 147, 'ME', '19', 'municipality', 42.4303762, 18.6988104),
(5683, 'Tuzi', 147, 'ME', '24', 'municipality', 42.36667, 19.4),
(33, 'Ulcinj', 147, 'ME', '20', 'municipality', 41.926012, 19.2055563),
(32, 'Žabljak', 147, 'ME', '21', 'municipality', 43.1555152, 19.1226018),
(5684, 'Zeta', 147, 'ME', '25', 'municipality', 42.4, 19.25);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(67343, 'Andrijevica', 23, 147, 42.73389, 19.79194),
(67344, 'Bar', 13, 147, 42.09306, 19.10028),
(67369, 'Stari Bar', 13, 147, 42.097, 19.136),
(67375, 'Šušanj', 13, 147, 42.11556, 19.08833),
(67370, 'Sutomore', 13, 147, 42.14278, 19.04667),
(67345, 'Berane', 21, 147, 42.8425, 19.87333),
(67346, 'Bijelo Polje', 25, 147, 43.03834, 19.74758),
(67347, 'Budva', 30, 147, 42.28639, 18.84),
(67360, 'Petrovac na Moru', 30, 147, 42.20556, 18.9425),
(67349, 'Danilovgrad', 14, 147, 42.55384, 19.14608),
(67368, 'Spuž', 14, 147, 42.515, 19.195),
(67353, 'Gusinje', 24, 147, 42.56194, 19.83389),
(160067, 'Bijela', 5682, 147, 42.44778, 18.65972),
(160064, 'Herceg Novi', 5682, 147, 42.45306, 18.53722),
(160065, 'Igalo', 5682, 147, 42.45583, 18.51667),
(160066, 'Kamenari', 5682, 147, 42.46167, 18.68806),
(67354, 'Kolašin', 31, 147, 42.82229, 19.51653),
(67350, 'Dobrota', 26, 147, 42.45417, 18.76833),
(67355, 'Kotor', 26, 147, 42.42067, 18.76825),
(67365, 'Prčanj', 26, 147, 42.4575, 18.74222),
(67366, 'Risan', 26, 147, 42.515, 18.69556),
(67358, 'Mojkovac', 22, 147, 42.96044, 19.5833),
(67359, 'Nikšić', 17, 147, 42.7731, 18.94446),
(67348, 'Cetinje', 28, 147, 42.39063, 18.91417),
(67361, 'Plav', 19, 147, 42.59694, 19.94556),
(67362, 'Pljevlja', 20, 147, 43.3567, 19.35843),
(67363, 'Plužine', 16, 147, 43.15278, 18.83944),
(67352, 'Goričani', 27, 147, 42.33222, 19.21194),
(67357, 'Mojanovići', 27, 147, 42.34167, 19.22139),
(67364, 'Podgorica', 27, 147, 42.44111, 19.26361),
(67367, 'Rožaje', 15, 147, 42.83299, 20.16652),
(67374, 'Šavnik', 18, 147, 42.95639, 19.09667),
(67371, 'Tivat', 29, 147, 42.43639, 18.69611),
(160068, 'Dinoša', 5683, 147, 42.38333, 19.38333),
(67356, 'Mataguži', 5683, 147, 42.35, 19.41667),
(67372, 'Tuzi', 5683, 147, 42.36667, 19.4),
(67373, 'Ulcinj', 33, 147, 41.92936, 19.22436),
(67376, 'Žabljak', 32, 147, 43.15423, 19.12325),
(67351, 'Golubovci', 5684, 147, 42.36667, 19.23333),
(160069, 'Ponari', 5684, 147, 42.4, 19.28333);
