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
(50, 'Congo', 'CG', 'COG', 'Africa', 'Middle Africa', 'Brazzaville', 'CDF', -1, 15, '🇨🇬');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(2866, 'Bouenza', 50, 'CG', '11', 'department', -4.2868653, 13.3972129),
(2870, 'Brazzaville', 50, 'CG', 'BZV', 'department', -4.2694407, 15.2712256),
(2864, 'Cuvette', 50, 'CG', '8', 'department', -0.4936855, 16.1602013),
(2869, 'Cuvette-Ouest', 50, 'CG', '15', 'department', 0.280252, 14.5292599),
(2867, 'Kouilou', 50, 'CG', '5', 'department', -4.1960964, 11.9104388),
(2868, 'Lékoumou', 50, 'CG', '2', 'department', -3.2315605, 13.5211721),
(2865, 'Likouala', 50, 'CG', '7', 'department', 1.6788828, 17.4747723),
(2872, 'Niari', 50, 'CG', '9', 'department', -2.9077055, 12.3298313),
(2862, 'Plateaux', 50, 'CG', '14', 'department', -2.1709644, 15.2286129),
(2863, 'Pointe-Noire', 50, 'CG', '16', 'department', -4.7975373, 11.8503297),
(2873, 'Pool', 50, 'CG', '12', 'department', -3.7298545, 15.053872),
(2871, 'Sangha', 50, 'CG', '13', 'department', 1.4284362, 15.4222522);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(17345, 'Kayes', 2866, 50, -4.20493, 13.28608),
(17348, 'Madingou', 2866, 50, -4.15361, 13.55),
(17339, 'Brazzaville', 2870, 50, -4.26613, 15.28318),
(17349, 'Makoua', 2864, 50, 0.00694, 15.63333),
(17352, 'Owando', 2864, 50, -0.48193, 15.89988),
(17342, 'Ewo', 2869, 50, -0.8725, 14.82056),
(17354, 'Sibiti', 2868, 50, -3.68192, 13.34985),
(17344, 'Impfondo', 2865, 50, 1.61804, 18.05981),
(17341, 'Dolisie', 2872, 50, -4.19834, 12.66664),
(17350, 'Mossendjo', 2872, 50, -2.94968, 12.70423),
(17340, 'Djambala', 2862, 50, -2.54472, 14.75333),
(17343, 'Gamboma', 2862, 50, -1.87639, 15.86444),
(17347, 'Loandjili', 2863, 50, -4.75611, 11.85778),
(17353, 'Pointe-Noire', 2863, 50, -4.77609, 11.86352),
(17346, 'Kinkala', 2873, 50, -4.36139, 14.76444),
(17351, 'Ouésso', 2871, 50, 1.61361, 16.05167),
(17355, 'Sémbé', 2871, 50, 1.64806, 14.58056);
