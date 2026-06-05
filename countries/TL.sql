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
(63, 'Timor-Leste', 'Timor Oriental', 'TL', 'TLS', 'Asia', 'Asia', 'South-Eastern Asia', 'Sudeste Asiático', 'Dili', 'USD', -8.83333333, 125.91666666, '🇹🇱');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(4520, 'Aileu', 'Aileu', 63, 'TL', 'AL', 'municipality', 'municipio', -8.7049799, 125.6625518),
(4518, 'Ainaro', 'Ainaro', 63, 'TL', 'AN', 'municipality', 'municipio', -8.9969021, 125.50482),
(4521, 'Baucau', 'Bauau', 63, 'TL', 'BA', 'municipality', 'municipio', -8.4714308, 126.4575991),
(4525, 'Bobonaro', 'Ver', 63, 'TL', 'BO', 'municipality', 'municipio', -8.974555, 125.2306505),
(4522, 'Cova Lima', 'Cova Lima', 63, 'TL', 'CO', 'municipality', 'municipio', -9.2352985, 125.2329359),
(4524, 'Dili', 'Dili', 63, 'TL', 'DI', 'municipality', 'municipio', -8.5536809, 125.5784093),
(4516, 'Ermera', 'Hermera', 63, 'TL', 'ER', 'municipality', 'municipio', -8.765625, 125.4215713),
(4523, 'Lautém', 'Lautem', 63, 'TL', 'LA', 'municipality', 'municipio', -8.4335127, 126.8258738),
(4515, 'Liquiçá', 'Liquiçá', 63, 'TL', 'LI', 'municipality', 'municipio', -8.655061, 125.2751452),
(4517, 'Manatuto', 'Manatsuto', 63, 'TL', 'MT', 'municipality', 'municipio', -8.5155608, 126.0159255),
(4519, 'Manufahi', 'Fabricante', 63, 'TL', 'MF', 'municipality', 'municipio', -8.96666, 125.7810921),
(5550, 'Oecusse', 'Oé-Cusse Ambeno', 63, 'TL', 'OE', 'special administrative region', 'región administrativa especial', -9.35, 124.3),
(4514, 'Viqueque', 'Viqueque', 63, 'TL', 'VI', 'municipality', 'municipio', -8.8597918, 126.3633516);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(106830, 'Aileu', 4520, 63, -8.72806, 125.56639),
(106854, 'Lequidoe', 4520, 63, -8.69139, 125.63611),
(106868, 'Remexio', 4520, 63, -8.61667, 125.66667),
(106831, 'Ainaro', 4518, 63, -8.99241, 125.50816),
(106846, 'Hato-Udo', 4518, 63, -9.12036, 125.58935),
(106834, 'Baguia', 4521, 63, -8.62787, 126.65743),
(106836, 'Baucau', 4521, 63, -8.46667, 126.45),
(106837, 'Baukau', 4521, 63, -8.47572, 126.45633),
(106852, 'Laga', 4521, 63, -8.47411, 126.59228),
(106866, 'Quelicai', 4521, 63, -8.60135, 126.55904),
(106877, 'Vemasse', 4521, 63, -8.51036, 126.20823),
(106878, 'Venilale', 4521, 63, -8.64306, 126.37833),
(106859, 'Maliana', 4525, 63, -8.99167, 125.21972),
(106843, 'Fatumean', 4522, 63, -9.22917, 125.03583),
(106844, 'Fohorem', 4522, 63, -9.28361, 125.08944),
(106863, 'Maucatar', 4522, 63, -9.21772, 125.22981),
(106871, 'Suai', 4522, 63, -9.3, 125.25),
(106872, 'Tilomar', 4522, 63, -9.34182, 125.10887),
(106833, 'Atauro Island', 4524, 63, -8.26785, 125.59699),
(106839, 'Cristo Rei', 4524, 63, -8.52047, 125.60837),
(106840, 'Dili', 4524, 63, -8.55861, 125.57361),
(106864, 'Metinaro', 4524, 63, -8.53007, 125.74163),
(106841, 'Ermera Villa', 4516, 63, -8.75222, 125.39694),
(106845, 'Gleno', 4516, 63, -8.72389, 125.43611),
(106847, 'Hatulia', 4516, 63, -8.81667, 125.31667),
(106855, 'Letefoho', 4516, 63, -8.83444, 125.42639),
(106867, 'Railaco', 4516, 63, -8.67237, 125.42546),
(106848, 'Iliomar', 4523, 63, -8.70917, 126.82833),
(106853, 'Lautem', 4523, 63, -8.36514, 126.90389),
(106857, 'Lospalos', 4523, 63, -8.52167, 126.99833),
(106858, 'Luro', 4523, 63, -8.54359, 126.83003),
(106874, 'Tutuala', 4523, 63, -8.39597, 127.25923),
(106838, 'Bazartete', 4515, 63, -8.62464, 125.38168),
(106856, 'Likisá', 4515, 63, -8.5875, 125.34194),
(106862, 'Maubara', 4515, 63, -8.61194, 125.20611),
(106835, 'Barique', 4517, 63, -8.85472, 126.06556),
(106849, 'Laclo', 4517, 63, -8.55, 125.91667),
(106850, 'Laclubar', 4517, 63, -8.74975, 125.91186),
(106860, 'Manatuto', 4517, 63, -8.52207, 126.01516),
(106861, 'Manatutu', 4517, 63, -8.51139, 126.01306),
(106870, 'Soibada', 4517, 63, -8.86, 125.94),
(106832, 'Alas', 4519, 63, -9.0273, 125.7868),
(106842, 'Fatuberliu', 4519, 63, -8.9479, 125.86633),
(106869, 'Same', 4519, 63, -9, 125.65),
(106873, 'Turiscai', 4519, 63, -8.82371, 125.70454),
(160123, 'Citrana', 5550, 63, -9.33333333, 124.08333333),
(160124, 'Nitibe', 5550, 63, -9.35, 124.23333333),
(160126, 'Oe Silo', 5550, 63, -9.3, 124.5),
(160122, 'Pante Macassar', 5550, 63, -9.2, 124.38333333),
(160125, 'Passabe', 5550, 63, -9.36416667, 124.34333333),
(106851, 'Lacluta', 4514, 63, -8.8, 126.13333),
(106865, 'Ossu', 4514, 63, -8.73477, 126.38324),
(106875, 'Uatocarabau', 4514, 63, -8.75658, 126.6806),
(106876, 'Uatolari', 4514, 63, -8.76277, 126.57353),
(106879, 'Viqueque', 4514, 63, -8.85908, 126.36972);
