CREATE TABLE IF NOT EXISTS countries (
  id INTEGER PRIMARY KEY, name VARCHAR(100), name_es VARCHAR(100), iso2 CHAR(2), iso3 CHAR(3),
  region VARCHAR(100), region_es VARCHAR(100), subregion VARCHAR(100), subregion_es VARCHAR(100),
  capital VARCHAR(100), currency VARCHAR(255), latitude DECIMAL(10,8), longitude DECIMAL(11,8), emoji VARCHAR(16)
);
CREATE TABLE IF NOT EXISTS states (
  id INTEGER PRIMARY KEY, name VARCHAR(255), native VARCHAR(255), country_id INTEGER, country_code CHAR(2),
  state_code VARCHAR(10), type VARCHAR(191), type_es VARCHAR(191), latitude DECIMAL(10,8), longitude DECIMAL(11,8)
);
CREATE TABLE IF NOT EXISTS cities (
  id INTEGER PRIMARY KEY, name VARCHAR(255), state_id INTEGER, country_id INTEGER,
  latitude DECIMAL(10,8), longitude DECIMAL(11,8)
);

INSERT INTO countries (id, name, name_es, iso2, iso3, region, region_es, subregion, subregion_es, capital, currency, latitude, longitude, emoji) VALUES
(180, 'Reunion', 'Reunión', 'RE', 'REU', 'Africa', 'África', 'Eastern Africa', 'África Oriental', 'Saint-Denis', 'EUR', -21.15, 55.5, '🇷🇪');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5436, 'Saint-Benoît', 'Saint-Benoît', 180, 'RE', '01', 'district', 'distrito', -21.0810433, 55.6028127),
(5437, 'Saint-Denis', 'Saint-Denis', 180, 'RE', '02', 'district', 'distrito', -20.8799889, 55.448137),
(5438, 'Saint-Paul', 'Saint-Paul', 180, 'RE', '03', 'district', 'distrito', -21.0006099, 55.2771585),
(5439, 'Saint-Pierre', 'Saint-Pierre', 180, 'RE', '04', 'district', 'distrito', -21.2377437, 55.4899764);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(155014, 'Bras-Panon', 5436, 180, -21.0315816, 55.5441634),
(155015, 'La Plaine-des-Palmistes', 5436, 180, -21.1529507, 55.5618014),
(155016, 'Saint-André', 5436, 180, -20.9567727, 55.5548674),
(155017, 'Saint-Benoît', 5436, 180, -21.0885946, 55.4664076),
(155018, 'Sainte-Rose', 5436, 180, -21.1778289, 55.6593981),
(155019, 'Salazie', 5436, 180, -21.0524097, 55.4321337),
(155020, 'Saint-Denis', 5437, 180, -20.9645672, 55.418353),
(155021, 'Sainte-Marie', 5437, 180, -20.9462842, 55.4409587),
(155022, 'Sainte-Suzanne', 5437, 180, -20.9506379, 55.5111475),
(155024, 'La Possession', 5438, 180, -20.9966715, 55.3094196),
(155023, 'Le Port', 5438, 180, -20.9459981, 55.2625839),
(155027, 'Les Trois-Bassins', 5438, 180, -21.1138065, 55.2553467),
(155025, 'Saint-Leu', 5438, 180, -21.1815374, 55.2607553),
(155026, 'Saint-Paul', 5438, 180, -21.0365634, 55.1754223),
(155029, 'Cilaos', 5439, 180, -21.1402675, 55.3731415),
(155030, 'Entre-Deux', 5439, 180, -21.2107387, 55.4112594),
(155031, 'L''Étang-Salé', 5439, 180, -21.2347408, 55.3163686),
(155037, 'Le Tampon', 5439, 180, -21.2250092, 55.4876541),
(155028, 'Les Avirons', 5439, 180, -21.2018683, 55.3216609),
(155032, 'Petite-Île', 5439, 180, -21.3329678, 55.5294205),
(155033, 'Saint-Joseph', 5439, 180, -21.2921186, 55.5616173),
(155034, 'Saint-Louis', 5439, 180, -21.2254829, 55.340044),
(155035, 'Saint-Philippe', 5439, 180, -21.308375, 55.6611834),
(155036, 'Saint-Pierre', 5439, 180, -21.3089303, 55.3395313);
