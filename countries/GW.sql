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
(93, 'Guinea-Bissau', 'GW', 'GNB', 'Africa', 'Western Africa', 'Bissau', 'XOF', 12, -15, '🇬🇼');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(2720, 'Bafatá', 93, 'GW', 'BA', 'region', 12.1735243, -14.652952),
(2714, 'Biombo', 93, 'GW', 'BM', 'region', 11.8816758, -15.7784496),
(5553, 'Bissau', 93, 'GW', 'BS', 'autonomous sector', 11.85, -15.56666667),
(2722, 'Bolama', 93, 'GW', 'BL', 'region', 11.2795064, -16.0294425),
(2713, 'Cacheu', 93, 'GW', 'CA', 'region', 12.1954331, -16.0991895),
(2719, 'Gabú', 93, 'GW', 'GA', 'region', 12.1170351, -14.1762506),
(2721, 'Leste', 93, 'GW', 'L', 'province', 12.17, -14.37),
(2717, 'Norte', 93, 'GW', 'N', 'province', 7.8721811, 123.8857747),
(2718, 'Oio', 93, 'GW', 'OI', 'region', 12.2876092, -15.3387658),
(2715, 'Quinara', 93, 'GW', 'QU', 'region', 11.6340114, -15.0952685),
(2716, 'Sul', 93, 'GW', 'S', 'province', 11.4088213, -16.0042494),
(2712, 'Tombali', 93, 'GW', 'TO', 'region', 11.2981082, -15.1170104);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(53807, 'Bafatá', 2720, 93, 12.16583, -14.66167),
(53815, 'Contuboel Sector', 2720, 93, 12.555, -14.641),
(53820, 'Quinhámel', 2714, 93, 11.88694, -15.85556),
(160041, 'Bissau', 5553, 93, 11.85, -15.56666667),
(53809, 'Bolama', 2722, 93, 11.57694, -15.47611),
(53811, 'Bubaque', 2722, 93, 11.28333, -15.83333),
(53812, 'Cacheu', 2713, 93, 12.27444, -16.16528),
(53813, 'Canchungo', 2713, 93, 12.06722, -16.03333),
(53817, 'Gabú', 2719, 93, 12.28, -14.22222),
(53808, 'Bissorã', 2718, 93, 12.22306, -15.4475),
(53816, 'Farim', 2718, 93, 12.48389, -15.22167),
(53818, 'Mansôa', 2718, 93, 12.07333, -15.31889),
(53810, 'Buba', 2715, 93, 11.58889, -14.99583),
(53814, 'Catió', 2712, 93, 11.2825, -15.25472),
(53819, 'Quebo', 2712, 93, 11.33333, -14.93333);
