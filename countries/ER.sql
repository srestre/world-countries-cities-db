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
(68, 'Eritrea', 'Eritrea', 'ER', 'ERI', 'Africa', 'África', 'Eastern Africa', 'África Oriental', 'Asmara', 'ERN', 15, 39, '🇪🇷');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(3425, 'Anseba', 'ኣንሰባ', 68, 'ER', 'AN', 'region', 'región', 16.5000101, 37.5000048),
(3427, 'Debub', 'ዲቡብ .', 68, 'ER', 'DU', 'region', 'región', 14.9099667, 38.8150692),
(3428, 'Gash-Barka', 'ጋሽ-እንቋዕ ደሓን መጻእኩም', 68, 'ER', 'GB', 'region', 'región', 15.25, 37.5),
(3426, 'Maekel', 'ጉሓት', 68, 'ER', 'MA', 'region', 'región', 15.333333, 38.916667),
(3424, 'Northern Red Sea', 'ሰሜናዊ ቀይሕ ባሕሪ', 68, 'ER', 'SK', 'region', 'región', 16, 39),
(3429, 'Southern Red Sea', 'ደቡባዊ ቀይሕ ባሕሪ', 68, 'ER', 'DK', 'region', 'región', 13.75, 41.5);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(31888, 'Keren', 3425, 68, 15.77792, 38.45107),
(31881, 'Adi Keyh', 3427, 68, 14.84444, 39.37722),
(31886, 'Dek’emhāre', 3427, 68, 15.07, 39.0475),
(31890, 'Mendefera', 3427, 68, 14.88722, 38.81528),
(31882, 'Ak’ordat', 3428, 68, 15.54798, 37.88291),
(31885, 'Barentu', 3428, 68, 15.10582, 37.59067),
(31891, 'Teseney', 3428, 68, 15.11, 36.6575),
(31883, 'Asmara', 3426, 68, 15.33805, 38.93184),
(31889, 'Massawa', 3424, 68, 15.60811, 39.47455),
(31884, 'Assab', 3429, 68, 13.00917, 42.73944),
(31887, 'Edd', 3429, 68, 13.93088, 41.6938);
