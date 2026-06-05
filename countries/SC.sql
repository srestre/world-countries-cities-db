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
(197, 'Seychelles', 'SC', 'SYC', 'Africa', 'Eastern Africa', 'Victoria', 'SCR', -4.6574977, 55.4540146, '🇸🇨');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(513, 'Anse Boileau', 197, 'SC', '02', 'district', -4.7047268, 55.4859363),
(5694, 'Anse Etoile', 197, 'SC', '03', 'district', -4.59166667, 55.45),
(502, 'Anse Royale', 197, 'SC', '05', 'district', -4.7376121, 55.5176065),
(506, 'Anse-aux-Pins', 197, 'SC', '01', 'district', -4.6900443, 55.5150289),
(508, 'Au Cap', 197, 'SC', '04', 'district', -4.7059723, 55.5081012),
(497, 'Baie Lazare', 197, 'SC', '06', 'district', -4.7482525, 55.4859363),
(514, 'Baie Sainte Anne', 197, 'SC', '07', 'district', -4.3411172, 55.7564233),
(512, 'Beau Vallon', 197, 'SC', '08', 'district', -4.6210967, 55.4277802),
(515, 'Bel Air', 197, 'SC', '09', 'district', -4.6416206, 55.4518668),
(505, 'Bel Ombre', 197, 'SC', '10', 'district', -4.6193716, 55.4112979),
(517, 'Cascade', 197, 'SC', '11', 'district', -4.6691243, 55.4972693),
(503, 'Glacis', 197, 'SC', '12', 'district', -4.583654, 55.4345526),
(500, 'Grand''Anse Mahé', 197, 'SC', '13', 'district', -4.6750171, 55.4505286),
(504, 'Grand''Anse Praslin', 197, 'SC', '14', 'district', -4.3269702, 55.7177343),
(5695, 'Ile Perseverance I', 197, 'SC', '26', 'district', -4.63, 55.47),
(5696, 'Ile Perseverance II', 197, 'SC', '27', 'district', -4.635, 55.475),
(495, 'La Digue', 197, 'SC', '15', 'district', -4.356222, 55.8306895),
(516, 'La Rivière Anglaise', 197, 'SC', '16', 'district', -4.6156909, 55.451153),
(499, 'Les Mamelles', 197, 'SC', '24', 'district', -4.6570449, 55.4811608),
(494, 'Mont Buxton', 197, 'SC', '17', 'district', -4.6166667, 55.4457768),
(498, 'Mont Fleuri', 197, 'SC', '18', 'district', -4.6363172, 55.4645941),
(511, 'Plaisance', 197, 'SC', '19', 'district', -4.65391, 55.4680175),
(510, 'Pointe La Rue', 197, 'SC', '20', 'district', -4.680489, 55.5191857),
(507, 'Port Glaud', 197, 'SC', '21', 'district', -4.66406, 55.4177606),
(501, 'Roche Caiman', 197, 'SC', '25', 'district', -4.6493085, 55.4831656),
(496, 'Saint Louis', 197, 'SC', '22', 'district', -4.6223, 55.4390618),
(509, 'Takamaka', 197, 'SC', '23', 'district', -4.3250885, 55.7312042);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(102906, 'Anse Boileau', 513, 197, -4.71667, 55.48333),
(160109, 'Anse Etoile', 5694, 197, -4.59166667, 55.45),
(102907, 'Anse Royale', 502, 197, -4.73333, 55.51667),
(102908, 'Beau Vallon', 512, 197, -4.62091, 55.43015),
(102909, 'Bel Ombre', 505, 197, -4.61667, 55.41667),
(102910, 'Cascade', 517, 197, -4.66667, 55.5),
(102913, 'Victoria', 516, 197, -4.62001, 55.45501),
(102911, 'Port Glaud', 507, 197, -4.66667, 55.41667),
(102912, 'Takamaka', 509, 197, -4.76667, 55.5);
