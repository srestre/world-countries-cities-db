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
(166, 'Oman', 'OM', 'OMN', 'Asia', 'Western Asia', 'Muscat', 'OMR', 21, 57, '🇴🇲');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3058, 'Ad Dakhiliyah', 166, 'OM', 'DA', 'governorate', 22.2259752, 57.3692722),
(3047, 'Ad Dhahirah', 166, 'OM', 'ZA', 'governorate', 22.6505232, 56.0616295),
(3048, 'Al Batinah North', 166, 'OM', 'BS', 'governorate', 24.2371879, 56.5701198),
(3049, 'Al Batinah South', 166, 'OM', 'BJ', 'governorate', 23.3673911, 57.4737863),
(3059, 'Al Buraimi', 166, 'OM', 'BU', 'governorate', 24.1614948, 56.1464102),
(3056, 'Al Wusta', 166, 'OM', 'WU', 'governorate', 19.7250347, 56.4313671),
(3053, 'Ash Sharqiyah North', 166, 'OM', 'SS', 'governorate', 22.2024738, 58.5159072),
(3054, 'Ash Sharqiyah South', 166, 'OM', 'SJ', 'governorate', 21.909878, 59.3078117),
(3057, 'Dhofar', 166, 'OM', 'ZU', 'governorate', 18.3368829, 54.2092994),
(3052, 'Musandam', 166, 'OM', 'MU', 'governorate', 26.1523215, 56.3294895),
(3055, 'Muscat', 166, 'OM', 'MA', 'governorate', 23.6123628, 58.5938134);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(79926, 'Adam', 3058, 166, 22.37934, 57.52718),
(79930, 'Bahlā’', 3058, 166, 22.97886, 57.3047),
(79934, 'Bidbid', 3058, 166, 23.40787, 58.1283),
(79937, 'Izkī', 3058, 166, 22.93333, 57.76667),
(79942, 'Nizwá', 3058, 166, 22.93333, 57.53333),
(79948, 'Sufālat Samā’il', 3058, 166, 23.31667, 58.01667),
(79953, '‘Ibrī', 3047, 166, 23.22573, 56.51572),
(79950, 'Yanqul', 3047, 166, 23.58645, 56.53969),
(79928, 'Al Khābūrah', 3048, 166, 23.97144, 57.09313),
(79929, 'As Suwayq', 3048, 166, 23.84944, 57.43861),
(79939, 'Liwá', 3048, 166, 24.53077, 56.563),
(79952, 'Şaḩam', 3048, 166, 24.17222, 56.88861),
(79946, 'Shināş', 3048, 166, 24.7426, 56.46698),
(79947, 'Sohar', 3048, 166, 24.34745, 56.70937),
(79931, 'Barkā’', 3049, 166, 23.67872, 57.88605),
(79933, 'Bayt al ‘Awābī', 3049, 166, 23.30324, 57.52459),
(79943, 'Oman Smart Future City', 3049, 166, 23.6527, 57.59926),
(79944, 'Rustaq', 3049, 166, 23.39083, 57.42444),
(79927, 'Al Buraymī', 3059, 166, 24.25088, 55.79312),
(79936, 'Haymā’', 3056, 166, 19.95931, 56.27575),
(79949, 'Sur', 3054, 166, 22.56667, 59.52889),
(79951, 'Şalālah', 3057, 166, 17.01505, 54.09237),
(79935, 'Dib Dibba', 3052, 166, 26.19778, 56.25778),
(79938, 'Khasab', 3052, 166, 26.17993, 56.24774),
(79940, 'Madḩā’ al Jadīdah', 3052, 166, 25.28345, 56.3328),
(79932, 'Bawshar', 3055, 166, 23.57769, 58.39982),
(79941, 'Muscat', 3055, 166, 23.58413, 58.40778),
(79945, 'Seeb', 3055, 166, 23.67027, 58.18911);
