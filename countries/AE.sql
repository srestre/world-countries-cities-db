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
(231, 'United Arab Emirates', 'Emiratos Árabes Unidos', 'AE', 'ARE', 'Asia', 'Asia', 'Western Asia', 'Asia Occidental', 'Abu Dhabi', 'AED', 24, 54, '🇦🇪');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(3396, 'Abu Dhabi', 'أبو ظبي', 231, 'AE', 'AZ', 'emirate', 'emirato', 24.453884, 54.3773438),
(3395, 'Ajman', 'عجمان', 231, 'AE', 'AJ', 'emirate', 'emirato', 25.3936557, 55.4451432),
(3391, 'Dubai', 'دبي', 231, 'AE', 'DU', 'emirate', 'emirato', 25.2647227, 55.2924146),
(3393, 'Fujairah', 'فجيرة', 231, 'AE', 'FU', 'emirate', 'emirato', 25.1244604, 56.3355085),
(3394, 'Ras Al Khaimah', 'رأس الخيمة', 231, 'AE', 'RK', 'emirate', 'emirato', 25.7386349, 55.9249224),
(3390, 'Sharjah', 'الشارقة', 231, 'AE', 'SH', 'emirate', 'emirato', 25.3461498, 55.4210633),
(3392, 'Umm Al Quwain', 'أم القوي', 231, 'AE', 'UQ', 'emirate', 'emirato', 25.6112488, 55.6174631);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(12, 'Abu Dhabi', 3396, 231, 24.41361, 54.43295),
(16, 'Al Ain City', 3396, 231, 24.19167, 55.76056),
(19, 'Al Dhafra', 3396, 231, 23.65745, 53.72225),
(26, 'Bani Yas City', 3396, 231, 24.30978, 54.62944),
(11, 'Ghayathi', 3396, 231, 23.9045342, 52.5871026),
(34, 'Khalifa City', 3396, 231, 24.42588, 54.605),
(17, 'Liwa Oasis', 3396, 231, 22.8697255, 53.2408608),
(41, 'Mussafah', 3396, 231, 24.35893, 54.48267),
(42, 'Muzayri‘', 3396, 231, 23.14355, 53.7881),
(25, 'Ruwais', 3396, 231, 24.11028, 52.73056),
(49, 'Zayed City', 3396, 231, 23.65416, 53.70522),
(14, 'Ajman', 3395, 231, 25.40328, 55.52341),
(37, 'Manama', 3395, 231, 25.32568, 56.00259),
(38, 'Masfut', 3395, 231, 24.83982, 56.05158),
(32, 'Dubai', 3391, 231, 25.0657, 55.17128),
(28, 'Dibba Al Fujairah', 3393, 231, 25.5858, 56.24792),
(30, 'Dibba Al-Fujairah', 3393, 231, 25.59246, 56.26176),
(31, 'Dibba Al-Hisn', 3393, 231, 25.61955, 56.27291),
(20, 'Fujairah', 3393, 231, 25.11641, 56.34141),
(43, 'Ras Al Khaimah', 3394, 231, 25.46116, 56.04058),
(18, 'Al Batayih', 3390, 231, 25.22317, 55.74272),
(13, 'Al Dhaid', 3390, 231, 25.28812, 55.88157),
(22, 'Al Hamriyah', 3390, 231, 25.46121, 55.54813),
(23, 'Al Madam', 3390, 231, 24.95536, 55.7682),
(33, 'Kalba', 3390, 231, 24.99816, 56.27207),
(36, 'Khor Fakkan', 3390, 231, 25.33966, 56.3028),
(39, 'Milehah', 3390, 231, 25.10097, 55.91282),
(40, 'Murbaḩ', 3390, 231, 25.27623, 56.36256),
(46, 'Sharjah', 3390, 231, 25.33737, 55.41206),
(47, 'Umm AL Quwain', 3392, 231, 25.49326, 55.7352);
