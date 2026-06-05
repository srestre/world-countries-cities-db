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
(98, 'Hong Kong S.A.R.', 'Hong Kong', 'HK', 'HKG', 'Asia', 'Asia', 'Eastern Asia', 'Asia Oriental', 'Hong Kong', 'HKD', 22.25, 114.16666666, '🇭🇰');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(4889, 'Central and Western', 'Central and Western', 98, 'HK', 'HCW', 'district', 'distrito', 22.28666, 114.15497),
(4891, 'Eastern', 'Eastern', 98, 'HK', 'HEA', 'district', 'distrito', 22.28411, 114.22414),
(4888, 'Islands', 'Islands', 98, 'HK', 'NIS', 'district', 'distrito', 22.26114, 113.94608),
(4895, 'Kowloon City', 'Kowloon City', 98, 'HK', 'KKC', 'district', 'distrito', 22.3282, 114.19155),
(4898, 'Kwai Tsing', 'Kwai Tsing', 98, 'HK', 'NKT', 'district', 'distrito', 22.3634303, 114.1229825),
(4897, 'Kwun Tong', 'Kwun Tong', 98, 'HK', 'KKT', 'district', 'distrito', 22.31326, 114.22581),
(4900, 'North', 'North', 98, 'HK', 'NNO', 'district', 'distrito', 22.49471, 114.13812),
(4887, 'Sai Kung', 'Sai Kung', 98, 'HK', 'NSK', 'district', 'distrito', 21.6730519, 108.3954313),
(4901, 'Sha Tin', 'Sha Tin', 98, 'HK', 'NST', 'district', 'distrito', 22.38715, 114.19534),
(4894, 'Sham Shui Po', 'Sham Shui Po', 98, 'HK', 'KSS', 'district', 'distrito', 22.2357383, 114.1698162),
(4892, 'Southern', 'Southern', 98, 'HK', 'HSO', 'district', 'distrito', 22.24725, 114.15884),
(4885, 'Tai Po', 'Tai Po', 98, 'HK', 'NTP', 'district', 'distrito', 22.45085, 114.16422),
(4884, 'Tsuen Wan', 'Tsuen Wan', 98, 'HK', 'NTW', 'district', 'distrito', 22.36281, 114.12907),
(4899, 'Tuen Mun', 'Tuen Mun', 98, 'HK', 'NTM', 'district', 'distrito', 22.39163, 113.9770885),
(4890, 'Wan Chai', 'Wan Chai', 98, 'HK', 'HWC', 'district', 'distrito', 22.264499, 114.1898216),
(4896, 'Wong Tai Sin', 'Wong Tai Sin', 98, 'HK', 'KWT', 'district', 'distrito', 22.33353, 114.19686),
(4893, 'Yau Tsim Mong', 'Yau Tsim Mong', 98, 'HK', 'KYT', 'district', 'distrito', 22.32138, 114.1726),
(4883, 'Yuen Long', 'Yuen Long', 98, 'HK', 'NYL', 'district', 'distrito', 22.4487051, 114.0958704);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(153484, 'Admiralty', 4889, 98, 22.278, 114.164),
(153483, 'Central', 4889, 98, 22.281, 114.159),
(153508, 'Tai O', 4888, 98, 22.247, 113.869),
(153500, 'Kowloon Tong', 4895, 98, 22.337, 114.179),
(153505, 'Kwun Tong', 4897, 98, 22.31, 114.225),
(153504, 'Lam Tin', 4897, 98, 22.307, 114.235),
(153497, 'Sheung Shui', 4900, 98, 22.501, 114.123),
(153493, 'Sai Kung', 4887, 98, 22.384, 114.273),
(153498, 'Tseung Kwan O', 4887, 98, 22.319, 114.263),
(153494, 'Ma On Shan', 4901, 98, 22.422, 114.23),
(153489, 'Sha Tin', 4901, 98, 22.383, 114.188),
(153499, 'Sha Tin Wai', 4901, 98, 22.38, 114.191),
(153501, 'Cheung Sha Wan', 4894, 98, 22.336, 114.151),
(153502, 'Lai Chi Kok', 4894, 98, 22.337, 114.146),
(153506, 'Aberdeen', 4892, 98, 22.247, 114.152),
(153496, 'Stanley', 4892, 98, 22.22, 114.214),
(153507, 'Stanley Peninsula', 4892, 98, 22.21, 114.217),
(153509, 'Tai Mei Tuk', 4885, 98, 22.457, 114.184),
(153495, 'Tai Po', 4885, 98, 22.449, 114.16),
(153490, 'Tsuen Wan', 4884, 98, 22.371, 114.114),
(153491, 'Tuen Mun', 4884, 98, 22.395, 113.973),
(153486, 'Causeway Bay', 4890, 98, 22.28, 114.185),
(153485, 'Wan Chai', 4890, 98, 22.278, 114.182),
(153503, 'Wong Tai Sin', 4896, 98, 22.341, 114.193),
(153488, 'Mong Kok', 4893, 98, 22.319, 114.169),
(153487, 'Tsim Sha Tsui', 4893, 98, 22.298, 114.172),
(153492, 'Yuen Long', 4883, 98, 22.444, 114.027);
