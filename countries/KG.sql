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
(118, 'Kyrgyzstan', 'KG', 'KGZ', 'Asia', 'Central Asia', 'Bishkek', 'KGS', 41, 75, '🇰🇬');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(998, 'Batken', 118, 'KG', 'B', 'region', 40.0611852, 70.8200964),
(1001, 'Bishkek', 118, 'KG', 'GB', 'city', 42.8761424, 74.6036724),
(1004, 'Chuy', 118, 'KG', 'C', 'region', 42.5550236, 74.621991),
(1002, 'Issyk-Kul', 118, 'KG', 'Y', 'region', 42.4620398, 77.0789862),
(1000, 'Jalal-Abad', 118, 'KG', 'J', 'region', 40.9298182, 73.00119),
(999, 'Naryn', 118, 'KG', 'N', 'region', 41.3670658, 75.9931838),
(1003, 'Osh', 118, 'KG', 'GO', 'city', 40.5172678, 72.8049894),
(1005, 'Osh', 118, 'KG', 'O', 'region', 40.5172678, 72.8049894),
(997, 'Talas', 118, 'KG', 'T', 'region', 42.521995, 72.247693);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(64886, 'Aydarken', 998, 118, 39.94319, 71.34184),
(64888, 'Batken', 998, 118, 40.06259, 70.81939),
(64896, 'Iradan', 998, 118, 40.26667, 72.1),
(64897, 'Isfana', 998, 118, 39.83895, 69.5276),
(64909, 'Karavan', 998, 118, 40.29513, 72.18627),
(64915, 'Kyzyl-Kyya', 998, 118, 40.25684, 72.12793),
(64923, 'Suluktu', 998, 118, 39.93652, 69.56779),
(64891, 'Bishkek', 1001, 118, 42.87, 74.59),
(64884, 'Alamudunskiy Rayon', 1004, 118, 42.81985, 74.59398),
(64890, 'Belovodskoye', 1004, 118, 42.82944, 74.1083),
(64894, 'Chuyskiy Rayon', 1004, 118, 42.66667, 75.33333),
(64898, 'Ivanovka', 1004, 118, 42.88778, 75.085),
(64902, 'Kaindy', 1004, 118, 42.82469, 73.67585),
(64903, 'Kant', 1004, 118, 42.89106, 74.85077),
(64906, 'Kara-Balta', 1004, 118, 42.81423, 73.84813),
(64911, 'Kemin', 1004, 118, 42.78611, 75.69167),
(64917, 'Lebedinovka', 1004, 118, 42.88454, 74.67819),
(64921, 'Sokulukskiy Rayon', 1004, 118, 42.83333, 74.33333),
(64922, 'Sosnovka', 1004, 118, 42.63707, 73.89608),
(64928, 'Tokmok', 1004, 118, 42.84194, 75.30149),
(64934, 'Ysyk-Ata', 1004, 118, 42.72665, 75.07444),
(64882, 'Ak-Suu', 1002, 118, 42.49948, 78.52702),
(64887, 'Balykchy', 1002, 118, 42.46017, 76.18709),
(64892, 'Cholpon-Ata', 1002, 118, 42.64944, 77.08225),
(64901, 'Kadzhi-Say', 1002, 118, 42.14107, 77.17848),
(64908, 'Karakol', 1002, 118, 42.49068, 78.39362),
(64916, 'Kyzyl-Suu', 1002, 118, 42.34211, 78.00644),
(64931, 'Tyup', 1002, 118, 42.7276, 78.36476),
(64883, 'Ala-Buka', 1000, 118, 41.40806, 71.46306),
(64889, 'Bazar-Korgon', 1000, 118, 41.0376, 72.74586),
(64899, 'Jalal-Abad', 1000, 118, 40.93333, 73),
(64910, 'Kazarman', 1000, 118, 41.405, 74.037),
(64912, 'Kerben', 1000, 118, 41.49399, 71.75826),
(64913, 'Kochkor-Ata', 1000, 118, 41.03709, 72.4832),
(64924, 'Suzak', 1000, 118, 40.8982, 72.90481),
(64927, 'Tash-Kumyr', 1000, 118, 41.34612, 72.21707),
(64929, 'Toktogul', 1000, 118, 41.87442, 72.94192),
(64930, 'Toktogul District', 1000, 118, 41.75, 73),
(64885, 'At-Bashi', 999, 118, 41.16951, 75.80099),
(64900, 'Jumgal', 999, 118, 41.94924, 74.40566),
(64918, 'Naryn', 999, 118, 41.42866, 75.99111),
(64893, 'Chong-Alay', 1005, 118, 39.47614, 72.33017),
(64895, 'Daroot-Korgon', 1005, 118, 39.55274, 72.20518),
(64904, 'Kara Kulja', 1005, 118, 40.64095, 73.49411),
(64905, 'Kara Suu', 1005, 118, 40.7046, 72.86666),
(64914, 'Kyzyl-Eshme', 1005, 118, 39.56559, 72.27153),
(64919, 'Nookat', 1005, 118, 40.26597, 72.61834),
(64920, 'Osh', 1005, 118, 40.52828, 72.7985),
(64932, 'Uzgen', 1005, 118, 40.76994, 73.30068),
(64933, 'Uzgen District', 1005, 118, 40.55, 73.3),
(64907, 'Kara-Buurinskiy Rayon', 997, 118, 42.5, 71.41667),
(64925, 'Talas', 997, 118, 42.52277, 72.24274),
(64926, 'Talasskiy Rayon', 997, 118, 42.18647, 72.69408);
