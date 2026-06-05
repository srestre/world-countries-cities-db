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
(67, 'Equatorial Guinea', 'GQ', 'GNQ', 'Africa', 'Middle Africa', 'Malabo', 'XAF', 2, 10, '🇬🇶');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3444, 'Annobón', 67, 'GQ', 'AN', 'province', -1.4268782, 5.6352801),
(3446, 'Bioko Norte', 67, 'GQ', 'BN', 'province', 3.6484594, 8.7851155),
(3443, 'Bioko Sur', 67, 'GQ', 'BS', 'province', 3.4245254, 8.6646092),
(3445, 'Centro Sur', 67, 'GQ', 'CS', 'province', 1.3969966, 10.4538528),
(5551, 'Djibloho', 67, 'GQ', 'DJ', 'province', 1.6, 10.8),
(3442, 'Insular', 67, 'GQ', 'I', 'region', 3.4986523, 8.7136062),
(3439, 'Kié-Ntem', 67, 'GQ', 'KN', 'province', 2.0579266, 10.9855916),
(3441, 'Litoral', 67, 'GQ', 'LI', 'province', 1.6026374, 9.841569),
(3438, 'Río Muni', 67, 'GQ', 'C', 'region', 1.0570951, 9.6532917),
(3440, 'Wele-Nzas', 67, 'GQ', 'WN', 'province', 1.4648719, 11.131676);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(52397, 'San Antonio de Palé', 3444, 67, -1.4068, 5.63178),
(52387, 'Malabo', 3446, 67, 3.75578, 8.78166),
(52395, 'Rebola', 3446, 67, 3.71667, 8.83333),
(52398, 'Santiago de Baney', 3446, 67, 3.6992, 8.9084),
(52385, 'Luba', 3443, 67, 3.45683, 8.55465),
(52376, 'Acurenam', 3445, 67, 1.03225, 10.64882),
(52380, 'Bicurga', 3445, 67, 1.58113, 10.46716),
(52384, 'Evinayong', 3445, 67, 1.43677, 10.55124),
(160040, 'Ciudad de la Paz', 5551, 67, 1.58888889, 10.8225),
(160135, 'Mengomeyén', 5551, 67, 1.68, 10.9),
(52383, 'Ebebiyin', 3439, 67, 2.15106, 11.33528),
(52390, 'Mikomeseng', 3439, 67, 2.13609, 10.61322),
(52392, 'Ncue', 3439, 67, 2.01643, 10.47066),
(52393, 'Nsang', 3439, 67, 2.02475, 10.94599),
(52379, 'Bata', 3441, 67, 1.86391, 9.76582),
(52381, 'Bitica', 3441, 67, 1.4261, 9.62316),
(52382, 'Cogo', 3441, 67, 1.08425, 9.693),
(52386, 'Machinda', 3441, 67, 1.88262, 9.95133),
(52388, 'Mbini', 3441, 67, 1.58267, 9.61478),
(52396, 'Río Campo', 3441, 67, 2.33812, 9.82212),
(52375, 'Aconibe', 3440, 67, 1.29683, 10.93691),
(52378, 'Añisoc', 3440, 67, 1.8658, 10.76892),
(52377, 'Ayene', 3440, 67, 1.85592, 10.68994),
(52389, 'Mengomeyén', 3440, 67, 1.69439, 11.03422),
(52391, 'Mongomo', 3440, 67, 1.62742, 11.31346),
(52394, 'Nsok', 3440, 67, 1.12985, 11.26603);
