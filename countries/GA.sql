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
(79, 'Gabon', 'Gabón', 'GA', 'GAB', 'Africa', 'África', 'Middle Africa', 'África Central', 'Libreville', 'XAF', -1, 11.75, '🇬🇦');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(2727, 'Estuaire', 'Estuaire', 79, 'GA', '1', 'province', 'provincia', 0.4302639, 9.4655189),
(2726, 'Haut-Ogooué', 'Haut-Ogooué', 79, 'GA', '2', 'province', 'provincia', -1.231544, 13.8309713),
(2730, 'Moyen-Ogooué', 'Moyen-Ogooué', 79, 'GA', '3', 'province', 'provincia', -0.5003495, 10.4991063),
(2731, 'Ngounié', 'Ngounié', 79, 'GA', '4', 'province', 'provincia', -1.5910727, 10.978503),
(2725, 'Nyanga', 'Lune', 79, 'GA', '5', 'province', 'provincia', -3.0080415, 10.9964746),
(2724, 'Ogooué-Ivindo', 'Ogooué-Ivindo', 79, 'GA', '6', 'province', 'provincia', 0.60082, 12.6887911),
(2729, 'Ogooué-Lolo', 'Ogooué-lolo', 79, 'GA', '7', 'province', 'provincia', -1.0002904, 12.4952424),
(2728, 'Ogooué-Maritime', 'Ogooué-Maritime', 79, 'GA', '8', 'province', 'provincia', -1.4958157, 9.5060896),
(2723, 'Woleu-Ntem', 'Woleu-Ntem', 79, 'GA', '9', 'province', 'provincia', 1.2950125, 11.8218827);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(48131, 'Cocobeach', 2727, 79, 1.00019, 9.58229),
(48138, 'Libreville', 2727, 79, 0.39241, 9.45356),
(48150, 'Ntoum', 2727, 79, 0.39051, 9.76096),
(48133, 'Franceville', 2726, 79, -1.63333, 13.58357),
(48139, 'Lékoni', 2726, 79, -1.58431, 14.25905),
(48145, 'Moanda', 2726, 79, -1.56652, 13.1987),
(48147, 'Mounana', 2726, 79, -1.4085, 13.15857),
(48151, 'Okondja', 2726, 79, -0.65487, 13.67533),
(48136, 'Lambaréné', 2730, 79, -0.7001, 10.24055),
(48149, 'Ndjolé', 2730, 79, -0.17827, 10.76488),
(48132, 'Fougamou', 2731, 79, -1.21544, 10.58378),
(48142, 'Mbigou', 2731, 79, -1.90046, 11.906),
(48143, 'Mimongo', 2731, 79, -1.61952, 11.60675),
(48146, 'Mouila', 2731, 79, -1.86846, 11.05594),
(48148, 'Ndendé', 2731, 79, -2.40077, 11.35813),
(48141, 'Mayumba', 2725, 79, -3.43198, 10.6554),
(48155, 'Tchibanga', 2725, 79, -2.93323, 10.98178),
(48130, 'Booué', 2724, 79, -0.09207, 11.93846),
(48140, 'Makokou', 2724, 79, 0.57381, 12.86419),
(48156, 'Zadie', 2724, 79, 0.92582, 13.90813),
(48135, 'Koulamoutou', 2729, 79, -1.13667, 12.46399),
(48137, 'Lastoursville', 2729, 79, -0.81742, 12.70818),
(48134, 'Gamba', 2728, 79, -2.65, 10),
(48152, 'Omboué', 2728, 79, -1.57464, 9.26184),
(48154, 'Port-Gentil', 2728, 79, -0.71933, 8.78151),
(48129, 'Bitam', 2723, 79, 2.07597, 11.50065),
(48144, 'Mitzic', 2723, 79, 0.78205, 11.54904),
(48153, 'Oyem', 2723, 79, 1.5995, 11.57933);
