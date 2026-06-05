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
(203, 'Somalia', 'SO', 'SOM', 'Africa', 'Eastern Africa', 'Mogadishu', 'SOS', 10, 49, '🇸🇴');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(925, 'Awdal', 203, 'SO', 'AW', 'region', 10.6951152, 43.4904963),
(917, 'Bakool', 203, 'SO', 'BK', 'region', 4.3514387, 43.7186102),
(927, 'Banaadir', 203, 'SO', 'BN', 'region', 2.0783351, 45.2805421),
(930, 'Bari', 203, 'SO', 'BR', 'region', 10.1903509, 50.1298044),
(926, 'Bay', 203, 'SO', 'BY', 'region', 2.9999946, 43.500177),
(918, 'Galguduud', 203, 'SO', 'GA', 'region', 5.0755014, 46.8803363),
(928, 'Gedo', 203, 'SO', 'GE', 'region', 3, 42),
(915, 'Hiran', 203, 'SO', 'HI', 'region', 4.3616958, 45.5333102),
(924, 'Lower Juba', 203, 'SO', 'JH', 'region', -0.0001019, 41.9999624),
(921, 'Lower Shebelle', 203, 'SO', 'SH', 'region', 1.8427539, 44.5937239),
(922, 'Middle Juba', 203, 'SO', 'JD', 'region', 1.4325937, 42.6559939),
(923, 'Middle Shebelle', 203, 'SO', 'SD', 'region', 3, 46),
(916, 'Mudug', 203, 'SO', 'MU', 'region', 6.6507279, 48.3009945),
(920, 'Nugal', 203, 'SO', 'NU', 'region', 8.16698, 48.9978971),
(919, 'Sanaag', 203, 'SO', 'SA', 'region', 10.4386899, 47.5924085),
(5699, 'Sool', 203, 'SO', 'SO', 'region', 8.39611111, 47.69138889),
(929, 'Togdheer', 203, 'SO', 'TO', 'region', 9.3029453, 45.4861213),
(5700, 'Woqooyi Galbeed', 203, 'SO', 'WO', 'region', 9.56305556, 44.0675);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(104815, 'Tayeeglow', 917, 203, 4.01897, 44.51111),
(104816, 'Waajid', 917, 203, 3.80958, 43.24627),
(104819, 'Xuddur', 917, 203, 4.12129, 43.88945),
(104820, 'Yeed', 917, 203, 4.55, 43.03333),
(104810, 'Mogadishu', 927, 203, 2.03711, 45.34375),
(104778, 'Bandarbeyla', 930, 203, 9.4942, 50.8122),
(104779, 'Bargaal', 930, 203, 11.28636, 51.0773),
(104781, 'Bereeda', 930, 203, 11.87037, 51.05795),
(104782, 'Bosaso', 930, 203, 11.28421, 49.18158),
(104788, 'Caluula', 930, 203, 11.96611, 50.75694),
(104800, 'Iskushuban', 930, 203, 10.2837, 50.23),
(104812, 'Qandala', 930, 203, 11.47197, 49.87282),
(104777, 'Baidoa', 926, 203, 3.11383, 43.6498),
(104786, 'Buurhakaba', 926, 203, 2.80257, 44.07805),
(104790, 'Ceelbuur', 918, 203, 4.68501, 46.6176),
(104791, 'Ceeldheer', 918, 203, 3.84878, 47.18064),
(104793, 'Dhuusamarreeb', 918, 203, 5.53597, 46.38666),
(104776, 'Baardheere', 928, 203, 2.34464, 42.27644),
(104797, 'Garbahaarrey', 928, 203, 3.32892, 42.22091),
(104807, 'Luuq', 928, 203, 3.80315, 42.54417),
(104780, 'Beledweyne', 915, 203, 4.73583, 45.20361),
(104784, 'Buulobarde', 915, 203, 3.85375, 45.56744),
(104801, 'Jalalaqsi', 915, 203, 3.3766, 45.5996),
(104785, 'Buur Gaabo', 924, 203, -1.21917, 41.83725),
(104802, 'Jamaame', 924, 203, 0.06968, 42.74497),
(104805, 'Kismayo', 924, 203, -0.35817, 42.54536),
(104775, 'Afgooye', 921, 203, 2.1381, 45.1212),
(104809, 'Marka', 921, 203, 1.71594, 44.77166),
(104813, 'Qoryooley', 921, 203, 1.78784, 44.52999),
(104817, 'Wanlaweyn', 921, 203, 2.6185, 44.8938),
(104794, 'Dujuuma', 922, 203, 1.25311, 42.57377),
(104804, 'Jilib', 922, 203, 0.48829, 42.78535),
(104814, 'Saacow', 922, 203, 1.62794, 42.44067),
(104787, 'Cadale', 923, 203, 2.7603, 46.3222),
(104803, 'Jawhar', 923, 203, 2.78087, 45.50048),
(104808, 'Mahaddayweyne', 923, 203, 2.9726, 45.5347),
(104796, 'Gaalkacyo', 916, 203, 6.76972, 47.43083),
(104799, 'Hobyo', 916, 203, 5.3505, 48.5268),
(104818, 'Xarardheere', 916, 203, 4.6544, 47.8575),
(104795, 'Eyl', 920, 203, 7.9803, 49.8164),
(104798, 'Garoowe', 920, 203, 8.40207, 48.48284),
(104792, 'Ceerigaabo', 919, 203, 10.61616, 47.36795),
(104806, 'Las Khorey', 919, 203, 11.1595, 48.1967),
(160113, 'Aynaba', 5699, 203, 8.95, 46.41666667),
(160114, 'Hudun', 5699, 203, 9.15416667, 47.47694444),
(160112, 'Las Anod', 5699, 203, 8.476, 47.357),
(104783, 'Burao', 929, 203, 9.52213, 45.53363),
(104789, 'Ceek', 929, 203, 8.99907, 45.35824),
(104811, 'Oodweyne', 929, 203, 9.4092, 45.06397),
(160116, 'Gabiley', 5700, 203, 9.7, 43.62361111),
(160115, 'Hargeisa', 5700, 203, 9.56305556, 44.0675);
