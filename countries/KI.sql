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
(114, 'Kiribati', 'KI', 'KIR', 'Oceania', 'Micronesia', 'Tarawa', 'AUD', 1.41666666, 173, '🇰🇮');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(1831, 'Gilbert', 114, 'KI', 'G', 'island', -1.2394556, 175.2969455),
(1832, 'Line', 114, 'KI', 'L', 'island', 1.3589779, 172.9311202),
(1830, 'Phoenix', 114, 'KI', 'P', 'island', -3.7213444, -170.7117052);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(65041, 'Abaiang', 1831, 114, 1.85293, 172.94369),
(65042, 'Abemama', 1831, 114, 0.4, 173.86667),
(65043, 'Ambo Village', 1831, 114, 1.35317, 173.04259),
(65044, 'Aranuka', 1831, 114, 0.16428, 173.60579),
(65045, 'Arorae', 1831, 114, -2.63493, 176.82229),
(65046, 'Bairiki Village', 1831, 114, 1.32924, 172.97522),
(65047, 'Banaba', 1831, 114, -0.855, 169.538),
(65049, 'Banraeaba Village', 1831, 114, 1.3454, 173.03464),
(65050, 'Beru', 1831, 114, -1.32957, 175.98072),
(65051, 'Betio Village', 1831, 114, 1.35797, 172.92105),
(65052, 'Bikenibeu Village', 1831, 114, 1.3673, 173.12415),
(65053, 'Bonriki Village', 1831, 114, 1.38081, 173.13887),
(65054, 'Buota Village', 1831, 114, 1.39078, 173.13082),
(65055, 'Butaritari', 1831, 114, 3.17205, 172.79675),
(65056, 'Eita Village', 1831, 114, 1.36154, 173.08113),
(65059, 'Kuria', 1831, 114, 0.26522, 173.38881),
(65061, 'Maiana', 1831, 114, 0.91869, 172.99759),
(65062, 'Makin', 1831, 114, 3.38816, 172.99656),
(65064, 'Marakei', 1831, 114, 2.01077, 173.27637),
(65066, 'Nawerewere Village', 1831, 114, 1.36362, 173.13935),
(65067, 'Nikunau', 1831, 114, -1.36567, 176.46412),
(65068, 'Nonouti', 1831, 114, -0.66667, 174.35),
(65069, 'Onotoa', 1831, 114, -1.88587, 175.56393),
(65070, 'Rawannawi Village', 1831, 114, 2.05379, 173.26354),
(65071, 'Tabiteuea', 1831, 114, -1.42241, 174.89805),
(65074, 'Tamana', 1831, 114, -2.50113, 175.98621),
(65075, 'Tarawa', 1831, 114, 1.3278, 172.97696),
(65076, 'Teaoraereke Village', 1831, 114, 1.33309, 173.01162),
(65077, 'Temaiku Village', 1831, 114, 1.36292, 173.16226),
(65048, 'Banana Village', 1832, 114, 1.98329, -157.36526),
(65058, 'Kiritimati', 1832, 114, 1.94, -157.475),
(65060, 'London Village', 1832, 114, 1.98487, -157.47502),
(65065, 'Napari Village', 1832, 114, 3.90806, -159.38832),
(65072, 'Tabuaeran', 1832, 114, 3.86667, -159.33333),
(65073, 'Tabwakea Village', 1832, 114, 2.01643, -157.48773),
(65078, 'Teraina', 1832, 114, 4.68764, -160.38803),
(65057, 'Kanton', 1830, 114, -2.81, -171.678);
