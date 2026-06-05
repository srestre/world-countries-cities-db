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
(220, 'Togo', 'TG', 'TGO', 'Africa', 'Western Africa', 'Lome', 'XOF', 8, 1.16666666, '🇹🇬');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(2575, 'Centrale', 220, 'TG', 'C', 'region', 8.607113, 1.0458554),
(2579, 'Kara', 220, 'TG', 'K', 'region', 9.541111, 0.7876018),
(2576, 'Maritime', 220, 'TG', 'M', 'region', 6.5175177, 1.2045805),
(2577, 'Plateaux', 220, 'TG', 'P', 'region', 7.450501, 1.0892702),
(2578, 'Savanes', 220, 'TG', 'S', 'region', 10.511559, 0.4653751);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(105173, 'Sokodé', 2575, 220, 8.98333, 1.13333),
(105174, 'Sotouboua', 2575, 220, 8.5634, 0.98399),
(105176, 'Tchamba', 2575, 220, 9.03333, 1.41667),
(105161, 'Bafilo', 2579, 220, 9.35, 1.26667),
(105162, 'Bassar', 2579, 220, 9.25025, 0.78213),
(105164, 'Kandé', 2579, 220, 9.95778, 1.04472),
(105165, 'Kara', 2579, 220, 9.55111, 1.18611),
(105168, 'Niamtougou', 2579, 220, 9.76806, 1.10528),
(105170, 'Pagouda', 2579, 220, 9.7525, 1.32778),
(105171, 'Préfecture de Bassar', 2579, 220, 9.25, 0.75),
(105158, 'Aného', 2576, 220, 6.22798, 1.5919),
(105167, 'Lomé', 2576, 220, 6.12874, 1.22154),
(105175, 'Tabligbo', 2576, 220, 6.58333, 1.5),
(105177, 'Tsévié', 2576, 220, 6.42611, 1.21333),
(105178, 'Vogan', 2576, 220, 6.33333, 1.53333),
(105157, 'Amlamé', 2577, 220, 7.46667, 0.9),
(105159, 'Atakpamé', 2577, 220, 7.53333, 1.13333),
(105160, 'Badou', 2577, 220, 7.58333, 0.6),
(105166, 'Kpalimé', 2577, 220, 6.9, 0.63333),
(105169, 'Notsé', 2577, 220, 6.95, 1.16667),
(105163, 'Dapaong', 2578, 220, 10.86225, 0.20762),
(105172, 'Sansanné-Mango', 2578, 220, 10.35917, 0.47083);
