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
(24, 'Benin', 'BJ', 'BEN', 'Africa', 'Western Africa', 'Porto-Novo', 'XOF', 9.5, 2.25, '🇧🇯');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3077, 'Alibori', 24, 'BJ', 'AL', 'department', 11.4649482, 2.7938798),
(3076, 'Atakora', 24, 'BJ', 'AK', 'department', 10.7160515, 1.5331527),
(3079, 'Atlantique', 24, 'BJ', 'AQ', 'department', 6.540829, 2.223095),
(3078, 'Borgou', 24, 'BJ', 'BO', 'department', 9.7097453, 2.7422648),
(3070, 'Collines', 24, 'BJ', 'CO', 'department', 8.1085479, 2.1853101),
(3072, 'Donga', 24, 'BJ', 'DO', 'department', 9.2679806, 1.7170684),
(3071, 'Kouffo', 24, 'BJ', 'KO', 'department', 7.1312662, 1.7567394),
(3081, 'Littoral', 24, 'BJ', 'LI', 'department', 6.3663195, 2.4170608),
(3075, 'Mono', 24, 'BJ', 'MO', 'department', 6.457624, 1.867408),
(3080, 'Ouémé', 24, 'BJ', 'OU', 'department', 6.6013531, 2.550566),
(3074, 'Plateau', 24, 'BJ', 'PL', 'department', 7.1002602, 2.6409144),
(3073, 'Zou', 24, 'BJ', 'ZO', 'department', 7.2834335, 2.1227604);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(9782, 'Banikoara', 3077, 24, 11.29845, 2.43856),
(9800, 'Kandi', 3077, 24, 11.13417, 2.93861),
(9803, 'Malanville', 3077, 24, 11.86819, 3.38327),
(9797, 'Guilmaro', 3076, 24, 10.56583, 1.72444),
(9804, 'Natitingou', 3076, 24, 10.30416, 1.37962),
(9813, 'Tanguieta', 3076, 24, 11.03621, 1.41757),
(9780, 'Abomey-Calavi', 3079, 24, 6.44852, 2.35566),
(9781, 'Allada', 3079, 24, 6.66547, 2.15138),
(9799, 'Hévié', 3079, 24, 6.41667, 2.25),
(9798, 'Hinvi', 3079, 24, 6.76667, 2.16667),
(9806, 'Ouidah', 3079, 24, 6.36307, 2.08506),
(9784, 'Bembèrèkè', 3078, 24, 10.22827, 2.66335),
(9786, 'Bétérou', 3078, 24, 9.19916, 2.25855),
(9805, 'Nikki', 3078, 24, 9.94009, 3.21075),
(9807, 'Parakou', 3078, 24, 9.33716, 2.63031),
(9815, 'Tchaourou', 3078, 24, 8.88649, 2.59753),
(9790, 'Comé', 3070, 24, 6.40764, 1.88198),
(9793, 'Dassa-Zoumé', 3070, 24, 7.75, 2.18333),
(9811, 'Savalou', 3070, 24, 7.92807, 1.97558),
(9812, 'Savé', 3070, 24, 8.03424, 2.4866),
(9783, 'Bassila', 3072, 24, 9.00814, 1.6654),
(9789, 'Commune of Djougou', 3072, 24, 9.643, 1.896),
(9795, 'Djougou', 3072, 24, 9.70853, 1.66598),
(9794, 'Djakotomey', 3071, 24, 6.9, 1.71667),
(9796, 'Dogbo', 3071, 24, 6.79911, 1.78073),
(9791, 'Cotonou', 3081, 24, 6.36536, 2.41833),
(9788, 'Commune of Athieme', 3075, 24, 6.56924, 1.70259),
(9802, 'Lokossa', 3075, 24, 6.63869, 1.71674),
(9809, 'Porto-Novo', 3080, 24, 6.49646, 2.60359),
(9801, 'Kétou', 3074, 24, 7.36332, 2.59978),
(9808, 'Pobé', 3074, 24, 6.98008, 2.6649),
(9810, 'Sakété', 3074, 24, 6.73618, 2.65866),
(9779, 'Abomey', 3073, 24, 7.18286, 1.99119),
(9785, 'Bohicon', 3073, 24, 7.17826, 2.0667),
(9787, 'Commune of Agbangnizoun', 3073, 24, 7.076, 1.961),
(9792, 'Cové', 3073, 24, 7.22097, 2.34017);
