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
(179, 'Qatar', 'Catar', 'QA', 'QAT', 'Asia', 'Asia', 'Western Asia', 'Asia Occidental', 'Doha', 'QAR', 25.5, 51.25, '🇶🇦');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(3182, 'Al Daayen', 'دايين', 179, 'QA', 'ZA', 'municipality', 'municipio', 25.5097419, 51.4422699),
(3183, 'Al Khor', 'Al Khor', 179, 'QA', 'KH', 'municipality', 'municipio', 25.6804078, 51.4968502),
(3177, 'Al Rayyan', 'Al Rayyan', 179, 'QA', 'RA', 'municipality', 'municipio', 24.9304741, 50.9776888),
(3179, 'Al Wakrah', 'واكرا', 179, 'QA', 'WA', 'municipality', 'municipio', 25.1566623, 51.6013212),
(3178, 'Al-Shahaniya', 'الشهانية', 179, 'QA', 'SH', 'municipality', 'municipio', 25.3717421, 51.227109),
(3181, 'Doha', 'الدوحة', 179, 'QA', 'DA', 'municipality', 'municipio', 25.2854473, 51.5310398),
(3180, 'Madinat ash Shamal', 'مينات آش شوال', 179, 'QA', 'MS', 'municipality', 'municipio', 26.1182743, 51.2157265),
(3184, 'Umm Salal', 'قاعدة أم', 179, 'QA', 'US', 'municipality', 'municipio', 25.4647654, 51.3383996);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(89856, 'Al Ghuwayrīyah', 3183, 179, 25.82882, 51.24567),
(89858, 'Al Khawr', 3183, 179, 25.68389, 51.50583),
(89861, 'Ar Rayyān', 3177, 179, 25.29194, 51.42444),
(89869, 'Umm Bāb', 3177, 179, 25.21417, 50.80722),
(89859, 'Al Wakrah', 3179, 179, 25.17151, 51.60337),
(89860, 'Al Wukayr', 3179, 179, 25.15107, 51.53718),
(89868, 'Musay‘īd', 3179, 179, 24.99226, 51.55067),
(89857, 'Al Jumaylīyah', 3178, 179, 25.61068, 51.09108),
(89863, 'Ash Shīḩānīyah', 3178, 179, 25.37088, 51.22264),
(89865, 'Dukhān', 3178, 179, 25.42485, 50.78227),
(89864, 'Doha', 3181, 179, 25.28545, 51.53096),
(89862, 'Ar Ruways', 3180, 179, 26.13978, 51.21493),
(89866, 'Fuwayriţ', 3180, 179, 26.02565, 51.36971),
(89867, 'Madīnat ash Shamāl', 3180, 179, 26.12933, 51.2009),
(89870, 'Umm Şalāl Muḩammad', 3184, 179, 25.41524, 51.40647);
