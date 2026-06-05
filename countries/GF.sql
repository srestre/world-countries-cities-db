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
(76, 'French Guiana', 'GF', 'GUF', 'Americas', 'South America', 'Cayenne', 'EUR', 4, -53, '🇬🇫');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5818, 'Guyane', 76, 'GF', '01', 'overseas region', 4, -53);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(162109, 'Apatou', 5818, 76, 5.15666667, -54.34305556),
(162110, 'Awala-Yalimapo', 5818, 76, 5.73611111, -53.90805556),
(162111, 'Camopi', 5818, 76, 3.16694444, -52.33111111),
(162112, 'Cayenne', 5818, 76, 4.93861111, -52.335),
(162113, 'Grand-Santi', 5818, 76, 4.27333333, -54.38166667),
(162114, 'Iracoubo', 5818, 76, 5.48, -53.20555556),
(162115, 'Kourou', 5818, 76, 5.15833333, -52.64277778),
(162116, 'Macouria', 5818, 76, 5.01361111, -52.47388889),
(162117, 'Mana', 5818, 76, 5.66722222, -53.77694444),
(162118, 'Maripasoula', 5818, 76, 3.64111111, -54.02777778),
(162119, 'Matoury', 5818, 76, 4.85055556, -52.33111111),
(162120, 'Montsinéry-Tonnegrande', 5818, 76, 4.89277778, -52.49277778),
(162121, 'Ouanary', 5818, 76, 4.20916667, -51.67166667),
(162122, 'Papaichton', 5818, 76, 3.80972222, -54.14888889),
(162123, 'Régina', 5818, 76, 4.31361111, -52.12916667),
(162124, 'Remire-Montjoly', 5818, 76, 4.905, -52.27638889),
(162125, 'Roura', 5818, 76, 4.72833333, -52.32416667),
(162126, 'Saint-Élie', 5818, 76, 4.82555556, -53.28805556),
(162127, 'Saint-Georges', 5818, 76, 3.88944444, -51.80111111),
(162128, 'Saint-Laurent-du-Maroni', 5818, 76, 5.50388889, -54.02888889),
(162129, 'Saül', 5818, 76, 3.62277778, -53.20833333),
(162130, 'Sinnamary', 5818, 76, 5.3775, -52.95861111);
