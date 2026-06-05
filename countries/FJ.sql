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
(73, 'Fiji Islands', 'FJ', 'FJI', 'Oceania', 'Melanesia', 'Suva', 'FJD', -18, 175, '🇫🇯');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(1917, 'Ba', 73, 'FJ', '01', 'province', 36.0613893, -95.8005872),
(1930, 'Bua', 73, 'FJ', '02', 'province', 43.0964584, -89.50088),
(1924, 'Cakaudrove', 73, 'FJ', '03', 'province', -16.8133648, 179.2868682),
(1929, 'Central', 73, 'FJ', 'C', 'division', 34.0440066, -118.2472738),
(1932, 'Eastern', 73, 'FJ', 'E', 'division', 32.8094305, -117.1289937),
(1934, 'Kadavu', 73, 'FJ', '04', 'province', -19.0127122, 178.1876676),
(1933, 'Lau', 73, 'FJ', '05', 'province', 31.6687015, -106.3955763),
(1916, 'Lomaiviti', 73, 'FJ', '06', 'province', -17.709, 179.091),
(1922, 'Macuata', 73, 'FJ', '07', 'province', -16.4864922, 179.2847251),
(1919, 'Nadroga-Navosa', 73, 'FJ', '08', 'province', -17.9865278, 177.658113),
(1927, 'Naitasiri', 73, 'FJ', '09', 'province', -17.8975754, 178.2071598),
(1928, 'Namosi', 73, 'FJ', '10', 'province', -18.0864176, 178.1291387),
(1921, 'Northern', 73, 'FJ', 'N', 'division', -16.8133648, 179.2868682),
(1926, 'Ra', 73, 'FJ', '11', 'province', 37.1003153, -95.6744246),
(1920, 'Rewa', 73, 'FJ', '12', 'province', 34.7923517, -82.3609264),
(1931, 'Rotuma', 73, 'FJ', 'R', 'dependency', -12.5025069, 177.0724164),
(1925, 'Serua', 73, 'FJ', '13', 'province', -18.1804749, 178.050979),
(1918, 'Tailevu', 73, 'FJ', '14', 'province', -17.8269111, 178.293248),
(1923, 'Western', 73, 'FJ', 'W', 'division', 42.9662198, -78.7021134);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(39145, 'Naitasiri', 1929, 73, -17.83333, 178.25),
(39146, 'Namosi', 1929, 73, -18.05, 178.13333),
(39149, 'Rewa', 1929, 73, -18.08333, 178.33333),
(39150, 'Serua', 1929, 73, -18.16667, 178),
(39151, 'Suva', 1929, 73, -18.14161, 178.44149),
(39152, 'Tailevu', 1929, 73, -17.83333, 178.5),
(39137, 'Kadavu', 1932, 73, -18.99331, 178.22021),
(39139, 'Lau', 1932, 73, -18.20488, -178.79251),
(39141, 'Levuka', 1932, 73, -18.06667, 179.31667),
(39142, 'Lomaiviti', 1932, 73, -17.66667, 178.8),
(39135, 'Bua', 1921, 73, -16.83333, 178.75),
(39136, 'Cakaudrove', 1921, 73, -16.66667, 179.41667),
(39138, 'Labasa', 1921, 73, -16.4332, 179.36451),
(39143, 'Macuata', 1921, 73, -16.5, 179.25),
(39133, 'Ba', 1923, 73, -17.5343, 177.67407),
(39134, 'Ba Province', 1923, 73, -17.66667, 177.66667),
(39140, 'Lautoka', 1923, 73, -17.61686, 177.45049),
(39144, 'Nadi', 1923, 73, -17.80309, 177.41617),
(39147, 'Nandronga and Navosa', 1923, 73, -18, 177.66667),
(39148, 'Ra', 1923, 73, -17.5, 178.16667);
