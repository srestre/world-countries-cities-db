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
(88, 'Guadeloupe', 'GP', 'GLP', 'Americas', 'Caribbean', 'Basse-Terre', 'EUR', 16.25, -61.583333, '🇬🇵');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5384, 'Basse-Terre', 88, 'GP', '01', 'district', 16.0000778, -61.7333373),
(5385, 'Pointe-à-Pitre', 88, 'GP', '02', 'district', 16.2408636, -61.5334077);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(154948, 'Baie-Mahault', 5384, 88, 16.2497607, -61.6775072),
(154949, 'Baillif', 5384, 88, 16.0497331, -61.7570591),
(154950, 'Basse-Terre', 5384, 88, 15.9991631, -61.749981),
(154951, 'Bouillante', 5384, 88, 16.1386937, -61.7989897),
(154952, 'Capesterre-Belle-Eau', 5384, 88, 16.0485402, -61.7021045),
(154953, 'Deshaies', 5384, 88, 16.3193605, -61.8242578),
(154954, 'Gourbeyre', 5384, 88, 16.0056595, -61.7302387),
(154955, 'Goyave', 5384, 88, 16.1231077, -61.6974021),
(154956, 'Lamentin', 5384, 88, 16.2443132, -61.7519194),
(154957, 'Petit-Bourg', 5384, 88, 16.1694881, -61.7404331),
(154958, 'Pointe-Noire', 5384, 88, 16.2270277, -61.8063122),
(154959, 'Saint-Claude', 5384, 88, 16.0405744, -61.7364873),
(154960, 'Sainte-Rose', 5384, 88, 16.2937252, -61.7659576),
(154961, 'Terre-de-Bas', 5384, 88, 15.8554196, -61.653292),
(154962, 'Terre-de-Haut', 5384, 88, 15.8580376, -61.6096098),
(154963, 'Trois-Rivières', 5384, 88, 15.9931362, -61.6905296),
(154964, 'Vieux-Fort', 5384, 88, 15.9607038, -61.7135177),
(154965, 'Vieux-Habitants', 5384, 88, 16.0846618, -61.7993923),
(154967, 'Anse-Bertrand', 5385, 88, 16.4668181, -61.5521768),
(154968, 'Capesterre-de-Marie-Galante', 5385, 88, 15.9176399, -61.2707786),
(154971, 'Grand-Bourg', 5385, 88, 15.908538, -61.3340618),
(154969, 'La Désirade', 5385, 88, 16.2584545, -61.1490279),
(154970, 'Le Gosier', 5385, 88, 16.2272625, -61.5573449),
(154973, 'Le Moule', 5385, 88, 16.3353687, -61.4424293),
(154966, 'Les Abymes', 5385, 88, 16.2677383, -61.5790727),
(154972, 'Morne-à-l''Eau', 5385, 88, 16.3211061, -61.6635689),
(154974, 'Petit-Canal', 5385, 88, 16.392131, -61.5371312),
(154975, 'Pointe-à-Pitre', 5385, 88, 16.2331304, -61.5623485),
(154976, 'Port-Louis', 5385, 88, 16.4201282, -61.5703989),
(154977, 'Saint-François', 5385, 88, 16.2783495, -61.3362498),
(154978, 'Saint-Louis', 5385, 88, 15.9653589, -61.355625),
(154979, 'Sainte-Anne', 5385, 88, 16.2564613, -61.4720288);
