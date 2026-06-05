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
(36, 'Burundi', 'Burundi', 'BI', 'BDI', 'Africa', 'África', 'Eastern Africa', 'África Oriental', 'Bujumbura', 'BIF', -3.5, 30, '🇧🇮');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(3196, 'Bubanza', 'Bubanza', 36, 'BI', 'BB', 'province', 'provincia', -3.1112787, 29.3828358),
(3198, 'Bujumbura Mairie', 'Bujumbura Mairie', 36, 'BI', 'BM', 'province', 'provincia', -3.3493959, 29.3631843),
(3200, 'Bujumbura Rural', 'Rural de Bujumbura', 36, 'BI', 'BL', 'province', 'provincia', -3.4759817, 29.4535702),
(3202, 'Bururi', 'Bururi', 36, 'BI', 'BR', 'province', 'provincia', -3.8581592, 29.584379),
(3201, 'Cankuzo', 'Faire du chauffeur', 36, 'BI', 'CA', 'province', 'provincia', -3.1450876, 30.58987),
(3190, 'Cibitoke', 'Cibitoke', 36, 'BI', 'CI', 'province', 'provincia', -2.8477341, 29.261662),
(3197, 'Gitega', 'Gitega', 36, 'BI', 'GI', 'province', 'provincia', -3.5382336, 29.910701),
(3194, 'Karuzi', 'Karuzi', 36, 'BI', 'KR', 'province', 'provincia', -3.1255377, 30.0978347),
(3192, 'Kayanza', 'Kayanza', 36, 'BI', 'KY', 'province', 'provincia', -3.0214816, 29.6458034),
(3195, 'Kirundo', 'Kirundo', 36, 'BI', 'KI', 'province', 'provincia', -2.5853872, 30.0933449),
(3188, 'Makamba', 'Makamba', 36, 'BI', 'MA', 'province', 'provincia', -4.1978315, 29.8073996),
(3193, 'Muramvya', 'Muramvya', 36, 'BI', 'MU', 'province', 'provincia', -3.2751181, 29.6307855),
(3186, 'Muyinga', 'Muyinga', 36, 'BI', 'MY', 'province', 'provincia', -2.7335985, 30.3171441),
(3187, 'Mwaro', 'Mwaro', 36, 'BI', 'MW', 'province', 'provincia', -3.4650043, 29.6708508),
(3199, 'Ngozi', 'Ngozi', 36, 'BI', 'NG', 'province', 'provincia', -2.8776895, 29.8994986),
(3185, 'Rumonge', 'Rumange', 36, 'BI', 'RM', 'province', 'provincia', -3.9754049, 29.4388014),
(3189, 'Rutana', 'Rutana', 36, 'BI', 'RT', 'province', 'provincia', -3.8618714, 30.0676979),
(3191, 'Ruyigi', 'Ruyigi', 36, 'BI', 'RY', 'province', 'provincia', -3.4733471, 30.2501278);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(9762, 'Bubanza', 3196, 36, -3.0804, 29.391),
(9763, 'Bujumbura', 3198, 36, -3.38193, 29.36142),
(9764, 'Bururi', 3202, 36, -3.94877, 29.62438),
(9765, 'Cankuzo', 3201, 36, -3.2186, 30.5528),
(9766, 'Cibitoke', 3190, 36, -2.8869, 29.1248),
(9767, 'Gitega', 3197, 36, -3.42708, 29.92463),
(9768, 'Karuzi', 3194, 36, -3.10139, 30.16278),
(9769, 'Kayanza', 3192, 36, -2.9221, 29.6293),
(9770, 'Kirundo', 3195, 36, -2.5845, 30.0959),
(9771, 'Makamba', 3188, 36, -4.1348, 29.804),
(9772, 'Muramvya', 3193, 36, -3.2682, 29.6079),
(9773, 'Muyinga', 3186, 36, -2.8451, 30.3414),
(9774, 'Mwaro', 3187, 36, -3.51128, 29.70334),
(9775, 'Ngozi', 3199, 36, -2.9075, 29.8306),
(9776, 'Rumonge', 3185, 36, -3.9736, 29.4386),
(9777, 'Rutana', 3189, 36, -3.9279, 29.992),
(9778, 'Ruyigi', 3191, 36, -3.47639, 30.24861);
