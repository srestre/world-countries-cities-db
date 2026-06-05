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
(212, 'Eswatini', 'Suazilandia', 'SZ', 'SWZ', 'Africa', 'África', 'Southern Africa', 'África Austral', 'Mbabane', 'SZL', -26.5, 31.5, '🇸🇿');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(969, 'Hhohho', 'Hhohho', 212, 'SZ', 'HH', 'region', 'región', -26.0988012, 31.3630822),
(970, 'Lubombo', 'Bitch', 212, 'SZ', 'LU', 'region', 'región', -26.55452, 31.8619116),
(968, 'Manzini', 'Chic', 212, 'SZ', 'MA', 'region', 'región', -26.4976444, 31.3750815),
(971, 'Shiselweni', 'Suspend', 212, 'SZ', 'SH', 'region', 'región', -27.036022, 31.3321298);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(105084, 'Bulembu', 969, 212, -25.96667, 31.13333),
(105087, 'Hhukwini', 969, 212, -26.31972, 31.22222),
(105093, 'Lobamba', 969, 212, -26.46667, 31.2),
(105099, 'Mbabane', 969, 212, -26.31667, 31.13333),
(105105, 'Nkhaba', 969, 212, -26.15728, 31.16391),
(105109, 'Piggs Peak', 969, 212, -25.96082, 31.24666),
(105083, 'Big Bend', 970, 212, -26.81667, 31.93333),
(105085, 'Dvokodvweni Inkhundla', 970, 212, -26.45398, 31.76456),
(105094, 'Lomashasha', 970, 212, -26.06644, 32.00768),
(105101, 'Mhlume', 970, 212, -26.03333, 31.85),
(105107, 'Nsoko', 970, 212, -27.03333, 31.95),
(105112, 'Siteki', 970, 212, -26.4525, 31.94722),
(105113, 'Tshaneni', 970, 212, -25.98333, 31.71667),
(105114, 'Vuvulane', 970, 212, -26.07427, 31.87672),
(105082, 'Bhunya', 968, 212, -26.55, 31.01667),
(105086, 'Ekukhanyeni', 968, 212, -26.3875, 31.52806),
(105091, 'Kwaluseni', 968, 212, -26.48333, 31.33333),
(105095, 'Malkerns', 968, 212, -26.56667, 31.18333),
(105096, 'Manzini', 968, 212, -26.49884, 31.38004),
(105097, 'Manzini South', 968, 212, -26.48333, 31.36667),
(105100, 'Mhlambanyatsi', 968, 212, -26.45, 31.01667),
(105103, 'Ngwempisi', 968, 212, -26.6999, 31.28876),
(105108, 'Ntondozi', 968, 212, -26.635, 31.22556),
(105110, 'Sidvokodvo', 968, 212, -26.6282, 31.42021),
(105088, 'Hlatikulu', 971, 212, -26.97917, 31.32444),
(105089, 'Hluti', 971, 212, -27.21667, 31.61667),
(105090, 'Kubuta', 971, 212, -26.88333, 31.48333),
(105092, 'Lavumisa', 971, 212, -27.31005, 31.89198),
(105098, 'Matsanjeni', 971, 212, -27.21585, 31.72309),
(105102, 'Ngudzeni', 971, 212, -27.03583, 31.55111),
(105104, 'Nhlangano', 971, 212, -27.11222, 31.19833),
(105106, 'Nkwene', 971, 212, -26.89778, 31.24972),
(105111, 'Sigwe Inkhundla', 971, 212, -27.05821, 31.64543),
(105115, 'Zombodze Ikhundla', 971, 212, -27.22746, 31.33799);
