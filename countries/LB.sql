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
(121, 'Lebanon', 'LB', 'LBN', 'Asia', 'Western Asia', 'Beirut', 'LBP', 33.83333333, 35.83333333, '🇱🇧');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(2285, 'Akkar', 121, 'LB', 'AK', 'governorate', 34.5555009, 36.2016453),
(2283, 'Baalbek-Hermel', 121, 'LB', 'BH', 'governorate', 34.168333, 36.3134617),
(2286, 'Beirut', 121, 'LB', 'BA', 'governorate', 33.8886106, 35.4954772),
(2287, 'Beqaa', 121, 'LB', 'BI', 'governorate', 33.6746204, 35.8333757),
(2282, 'Mount Lebanon', 121, 'LB', 'JL', 'governorate', 34.29, 36.092),
(2288, 'Nabatieh', 121, 'LB', 'NA', 'governorate', 33.3771693, 35.4838293),
(2284, 'North', 121, 'LB', 'AS', 'governorate', 34.29, 36.092),
(2281, 'South', 121, 'LB', 'JA', 'governorate', 34.4115339, -81.204814);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(65939, 'Caza de Aakkar', 2285, 121, 34.53333, 36.16667),
(65933, 'Baalbek', 2283, 121, 34.00583, 36.21806),
(65941, 'Caza de Baalbek', 2283, 121, 34.09822, 36.27157),
(65936, 'Beirut', 2286, 121, 33.89332, 35.50157),
(65951, 'Ra’s Bayrūt', 2286, 121, 33.9, 35.48333),
(65930, 'Aanjar', 2287, 121, 33.72778, 35.93111),
(65955, 'Zahlé', 2287, 121, 33.84675, 35.90203),
(65932, 'Baabda', 2282, 121, 33.83389, 35.54417),
(65937, 'Bhamdoun', 2282, 121, 33.795, 35.65111),
(65938, 'Bhamdoûn el Mhatta', 2282, 121, 33.80861, 35.65972),
(65940, 'Caza de Baabda', 2282, 121, 33.84592, 35.66791),
(65947, 'Jbaïl', 2282, 121, 34.12111, 35.64806),
(65948, 'Jounieh', 2282, 121, 33.98083, 35.61778),
(65931, 'Ain Ebel', 2288, 121, 33.11023, 35.40251),
(65942, 'Caza de Bent Jbaïl', 2288, 121, 33.15964, 35.41137),
(65943, 'Caza de Nabatîyé', 2288, 121, 33.39435, 35.44483),
(65946, 'Habboûch', 2288, 121, 33.40729, 35.48169),
(65949, 'Marjayoûn', 2288, 121, 33.36028, 35.59111),
(65950, 'Nabatîyé et Tahta', 2288, 121, 33.37889, 35.48389),
(65934, 'Batroûn', 2284, 121, 34.25528, 35.65806),
(65935, 'Bcharré', 2284, 121, 34.25083, 36.01056),
(65953, 'Tripoli', 2284, 121, 34.43352, 35.84415),
(65944, 'En Nâqoûra', 2281, 121, 33.11806, 35.13972),
(65945, 'Ghazieh', 2281, 121, 33.5175, 35.36889),
(65952, 'Sidon', 2281, 121, 33.55751, 35.37148),
(65954, 'Tyre', 2281, 121, 33.27333, 35.19389);
