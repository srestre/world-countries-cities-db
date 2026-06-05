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
(134, 'Mali', 'ML', 'MLI', 'Africa', 'Western Africa', 'Bamako', 'XOF', 17, -4, '🇲🇱');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(253, 'Bamako', 134, 'ML', 'BKO', 'district', 12.649319, -8.000337),
(258, 'Gao', 134, 'ML', '7', 'region', 17.00244, -0.0991154),
(252, 'Kayes', 134, 'ML', '1', 'region', 13.8001844, -10.2245548),
(257, 'Kidal', 134, 'ML', '8', 'region', 18.4408358, 1.4075395),
(250, 'Koulikoro', 134, 'ML', '2', 'region', 13.4820706, -7.6096079),
(251, 'Ménaka', 134, 'ML', '9', 'region', 15.9156421, 2.396174),
(255, 'Mopti', 134, 'ML', '5', 'region', 14.514489, -3.6464581),
(249, 'Ségou', 134, 'ML', '4', 'region', 14.0487607, -6.0047091),
(254, 'Sikasso', 134, 'ML', '3', 'region', 11.529684, -6.8663259),
(256, 'Taoudénit', 134, 'ML', '10', 'region', 20.8582718, -3.39819),
(248, 'Tombouctou', 134, 'ML', '6', 'region', 16.7719091, -3.0087272);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(67587, 'Bamako', 253, 134, 12.65, -8),
(67584, 'Ansongo', 258, 134, 15.6597, 0.5022),
(67592, 'Cercle de Bourem', 258, 134, 17.71192, -0.34284),
(67601, 'Gao', 258, 134, 16.27167, -0.04472),
(67602, 'Gao Cercle', 258, 134, 16.72237, 0.43984),
(67605, 'Inékar', 258, 134, 15.95944, 3.14111),
(67586, 'Bafoulabé', 252, 134, 13.8065, -10.8321),
(67608, 'Kayes', 252, 134, 14.44693, -11.44448),
(67611, 'Kita', 252, 134, 13.0349, -9.4895),
(67612, 'Kokofata', 252, 134, 12.88333, -9.95),
(67623, 'Sagalo', 252, 134, 12.2, -10.7),
(67583, 'Abeïbara', 257, 134, 19.11667, 1.75),
(67595, 'Cercle d’Abeïbara', 257, 134, 19.48878, 2.20025),
(67609, 'Kidal', 257, 134, 18.44111, 1.40778),
(67588, 'Banamba', 250, 134, 13.54773, -7.44808),
(67606, 'Kangaba', 250, 134, 11.93333, -8.41667),
(67607, 'Kati', 250, 134, 12.74409, -8.07257),
(67613, 'Kolokani', 250, 134, 13.5728, -8.0339),
(67615, 'Koulikoro', 250, 134, 12.86273, -7.55985),
(67589, 'Bandiagara', 255, 134, 14.35005, -3.61038),
(67598, 'Djénné', 255, 134, 13.90608, -4.55332),
(67599, 'Douentza', 255, 134, 15.00155, -2.94978),
(67600, 'Douentza Cercle', 255, 134, 15.06947, -2.40875),
(67620, 'Mopti', 255, 134, 14.4843, -4.18296),
(67629, 'Ténenkou', 255, 134, 14.45722, -4.9169),
(67590, 'Baroueli', 249, 134, 13.07489, -6.57171),
(67594, 'Cercle de San', 249, 134, 13.17895, -5.01617),
(67618, 'Ké-Macina', 249, 134, 13.9641, -5.35791),
(67610, 'Kinmparana', 249, 134, 12.84217, -4.9245),
(67619, 'Markala', 249, 134, 13.7021, -6.0659),
(67624, 'San', 249, 134, 13.30335, -4.89562),
(67627, 'Ségou', 249, 134, 13.4317, -6.2157),
(67626, 'Sokolo', 249, 134, 14.7328, -6.1219),
(67591, 'Bougouni', 254, 134, 11.41769, -7.48323),
(67614, 'Kolondiéba', 254, 134, 11.08943, -6.8929),
(67616, 'Koutiala', 254, 134, 12.39173, -5.46421),
(67617, 'Koutiala Cercle', 254, 134, 12.35311, -5.5839),
(67622, 'Ntossoni', 254, 134, 12.5304, -5.77003),
(67625, 'Sikasso', 254, 134, 11.31755, -5.66654),
(67630, 'Yorosso', 254, 134, 12.35811, -4.77688),
(67585, 'Araouane', 248, 134, 18.90476, -3.52649),
(67593, 'Cercle de Goundam', 248, 134, 18.60035, -4.99306),
(67596, 'Dire', 248, 134, 16.28017, -3.31302),
(67603, 'Goundam', 248, 134, 16.41453, -3.67075),
(67604, 'Gourma-Rharous Cercle', 248, 134, 16.07979, -1.76981),
(67621, 'Niafunké', 248, 134, 15.9322, -3.9906),
(67628, 'Timbuktu', 248, 134, 16.77348, -3.00742);
