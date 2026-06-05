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
(210, 'Suriname', 'Surinam', 'SR', 'SUR', 'Americas', 'América', 'South America', 'Sudamérica', 'Paramaribo', 'SRD', 4, -56, '🇸🇷');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(2846, 'Brokopondo', 'Brocopondo', 210, 'SR', 'BR', 'district', 'distrito', 4.6851643, -55.061093),
(2839, 'Commewijne', 'Commewijne', 210, 'SR', 'CM', 'district', 'distrito', 5.8401198, -54.9244431),
(2842, 'Coronie', 'Coronie', 210, 'SR', 'CR', 'district', 'distrito', 5.7468563, -56.2455162),
(2845, 'Marowijne', 'Marowijne', 210, 'SR', 'MA', 'district', 'distrito', 5.7083272, -54.35369),
(2840, 'Nickerie', 'Nickerie', 210, 'SR', 'NI', 'district', 'distrito', 5.7183925, -56.8775105),
(2841, 'Para', 'Naar', 210, 'SR', 'PR', 'district', 'distrito', 5.3430413, -55.581341),
(2843, 'Paramaribo', 'Paramaribo', 210, 'SR', 'PM', 'district', 'distrito', 5.8247628, -55.1703941),
(2848, 'Saramacca', 'Saramacca', 210, 'SR', 'SA', 'district', 'distrito', 5.7870805, -55.6064574),
(2847, 'Sipaliwini', 'Sipaliwini', 210, 'SR', 'SI', 'district', 'distrito', 3.6815086, -55.961246),
(2844, 'Wanica', 'Wanica', 210, 'SR', 'WA', 'district', 'distrito', 5.75, -55.25);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(104822, 'Brokopondo', 2846, 210, 5.05594, -54.98043),
(104823, 'Brownsweg', 2846, 210, 5.00435, -55.15333),
(104826, 'Mariënburg', 2839, 210, 5.87722, -55.04322),
(104828, 'Nieuw Amsterdam', 2839, 210, 5.88573, -55.08871),
(104832, 'Totness', 2842, 210, 5.87618, -56.32572),
(104821, 'Albina', 2845, 210, 5.49788, -54.05522),
(104827, 'Moengo', 2845, 210, 5.61411, -54.40121),
(104829, 'Nieuw Nickerie', 2840, 210, 5.92606, -56.97297),
(104833, 'Wageningen', 2840, 210, 5.7601, -56.66523),
(104830, 'Onverwacht', 2841, 210, 5.58983, -55.19462),
(104831, 'Paramaribo', 2843, 210, 5.86638, -55.16682),
(104824, 'Groningen', 2848, 210, 5.8, -55.46667),
(104825, 'Lelydorp', 2844, 210, 5.7, -55.23333);
