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
(72, 'Faroe Islands', 'FO', 'FRO', 'Europe', 'Northern Europe', 'Torshavn', 'DKK', 62, -7, '🇫🇴');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5229, 'Eysturoy', 72, 'FO', 'EY', 'region', 62.1988704, -6.8178451),
(5230, 'Northern Isles', 72, 'FO', 'NO', 'region', 62.2805689, 6.7017061),
(5231, 'Sandoy', 72, 'FO', 'SA', 'region', 61.8333877, -6.7239899),
(5232, 'Streymoy', 72, 'FO', 'ST', 'region', 62.1237192, -7.0158828),
(5233, 'Suðuroy', 72, 'FO', 'SU', 'region', 61.5210651, -6.8141866),
(5234, 'Vágar', 72, 'FO', 'VA', 'region', 62.0898985, -7.2345841);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(153758, 'Eiði', 5229, 72, 62.2789, -7.0123),
(153748, 'Eystur', 5229, 72, 62.1567, -6.8233),
(153752, 'Fuglafjørður', 5229, 72, 62.2101, -6.8123),
(153754, 'Nes', 5229, 72, 62.0987, -6.7654),
(153747, 'Runavík', 5229, 72, 62.1323, -6.789),
(153757, 'Sjóvar', 5229, 72, 62.1234, -6.8765),
(153763, 'Hvannasund', 5230, 72, 62.3456, -6.789),
(153746, 'Klaksvík', 5230, 72, 62.221, -6.58),
(153767, 'Kunoy', 5230, 72, 62.3456, -6.8901),
(153769, 'Húsavík', 5231, 72, 61.8096495, -6.6794956),
(153761, 'Sandur', 5231, 72, 61.8348155, -6.8175826),
(153768, 'Skálavík', 5231, 72, 61.8302676, -6.664032),
(153762, 'Skopun', 5231, 72, 62.0123, -6.9876),
(153772, 'Skúvoy', 5231, 72, 61.7664432, -6.826962),
(153760, 'Kvívík', 5232, 72, 62.1456, -7.2098),
(153750, 'Sunda', 5232, 72, 62.1345, -7.0987),
(153745, 'Tórshavn', 5232, 72, 62, -7),
(153755, 'Vestmanna', 5232, 72, 62.1567, -7.2345),
(153771, 'Fámjin', 5233, 72, 61.5246866, -6.8792705),
(153770, 'Hov', 5233, 72, 61.5069357, -6.7557422),
(153759, 'Hvalba', 5233, 72, 61.5987, -6.9876),
(153766, 'Porkeri', 5233, 72, 61.5432, -6.9876),
(153764, 'Sumba', 5233, 72, 61.4033267, -6.7117361),
(153751, 'Tvøroyri', 5233, 72, 61.5623, -6.778),
(153753, 'Vágur', 5233, 72, 61.4789, -6.8101),
(153756, 'Sørvágur', 5234, 72, 62.0654, -7.3787),
(153749, 'Vágar', 5234, 72, 62.0667, -7.1);
