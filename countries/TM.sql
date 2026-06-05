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
(226, 'Turkmenistan', 'Turkmenistán', 'TM', 'TKM', 'Asia', 'Asia', 'Central Asia', 'Asia Central', 'Ashgabat', 'TMT', 40, 60, '🇹🇲');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(3374, 'Ahal', 'Mümkin', 226, 'TM', 'A', 'region', 'región', 38.8395548, 58.8610186),
(3371, 'Ashgabat', 'Ashgabat', 226, 'TM', 'S', 'city', 'ciudad', 37.9404648, 58.3823487),
(3372, 'Balkan', 'Balkan', 226, 'TM', 'B', 'region', 'región', 39.9353714, 54.9120055),
(3373, 'Daşoguz', 'Daş', 226, 'TM', 'D', 'region', 'región', 41.8368737, 59.9651904),
(3370, 'Lebap', 'Lebap', 226, 'TM', 'L', 'region', 'región', 38.8131139, 63.0513218),
(3369, 'Mary', 'Mary', 226, 'TM', 'M', 'region', 'región', 37.1302916, 62.4019513);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(106880, 'Abadan', 3374, 226, 38.05415, 58.19721),
(106882, 'Annau', 3374, 226, 37.88754, 58.51596),
(106883, 'Arçabil', 3374, 226, 37.915, 58.08987),
(106886, 'Baharly', 3374, 226, 38.43624, 57.43158),
(106896, 'Kaka', 3374, 226, 37.34821, 59.61431),
(106905, 'Tejen', 3374, 226, 37.38338, 60.50545),
(106884, 'Ashgabat', 3371, 226, 37.95, 58.38333),
(106887, 'Balkanabat', 3372, 226, 39.51075, 54.36713),
(106889, 'Bereket', 3372, 226, 39.24463, 55.51536),
(106895, 'Gumdag', 3372, 226, 39.20611, 54.59056),
(106898, 'Magtymguly', 3372, 226, 38.43749, 56.28081),
(106901, 'Serdar', 3372, 226, 38.97644, 56.27575),
(106907, 'Türkmenbaşy', 3372, 226, 40.02216, 52.95517),
(106881, 'Akdepe', 3373, 226, 42.05513, 59.37877),
(106890, 'Boldumsaz', 3373, 226, 42.12824, 59.67101),
(106891, 'Daşoguz', 3373, 226, 41.83625, 59.96661),
(106897, 'Köneürgench', 3373, 226, 42.32773, 59.15442),
(106904, 'Tagta', 3373, 226, 41.65041, 59.9164),
(106909, 'Yylanly', 3373, 226, 41.83333, 59.65),
(106885, 'Atamyrat', 3370, 226, 37.83573, 65.21058),
(106892, 'Farap', 3370, 226, 39.17037, 63.61165),
(106893, 'Gazojak', 3370, 226, 41.18746, 61.4036),
(106894, 'Gowurdak', 3370, 226, 37.81244, 66.04656),
(106900, 'Saýat', 3370, 226, 38.78393, 63.88035),
(106906, 'Türkmenabat', 3370, 226, 39.07328, 63.57861),
(106888, 'Bayramaly', 3369, 226, 37.61852, 62.16715),
(106899, 'Mary', 3369, 226, 37.59378, 61.83031),
(106902, 'Serhetabat', 3369, 226, 35.27992, 62.34383),
(106903, 'Seydi', 3369, 226, 39.4816, 62.91374),
(106908, 'Yolöten', 3369, 226, 37.29886, 62.35975);
