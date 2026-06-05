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
(191, 'Samoa', 'Samoa', 'WS', 'WSM', 'Oceania', 'Oceanía', 'Polynesia', 'Polinesia', 'Apia', 'WST', -13.58333333, -172.33333333, '🇼🇸');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(4763, 'A''ana', 'Apu', 191, 'WS', 'AA', 'district', 'distrito', -13.8371757, -171.9950869),
(4761, 'Aiga-i-le-Tai', 'Aiga-i-le-Tai', 191, 'WS', 'AL', 'district', 'distrito', -13.862031, -172.0328371),
(4765, 'Atua', 'Atua', 191, 'WS', 'AT', 'district', 'distrito', -13.954878, -171.6512455),
(4764, 'Fa''asaleleaga', 'Fa''asaleleaga', 191, 'WS', 'FA', 'district', 'distrito', -13.6307638, -172.2365981),
(4769, 'Gaga''emauga', 'Gaga''emauga', 191, 'WS', 'GE', 'district', 'distrito', -13.5428666, -172.366887),
(4771, 'Gaga''ifomauga', 'Gaga''ifomauga', 191, 'WS', 'GI', 'district', 'distrito', -13.5468007, -172.4969331),
(4767, 'Palauli', 'Palauli', 191, 'WS', 'PA', 'district', 'distrito', -13.7063577, -172.4839701),
(4762, 'Satupa''itea', 'Satupa''itea', 191, 'WS', 'SA', 'district', 'distrito', -13.7414328, -172.3406683),
(4770, 'Tuamasaga', 'Tuamasaga', 191, 'WS', 'TU', 'district', 'distrito', -13.9218804, -171.8007196),
(4768, 'Va''a-o-Fonoti', 'Vaʻi-O-phonoti', 191, 'WS', 'VF', 'district', 'distrito', -13.9470903, -171.5431872),
(4766, 'Vaisigano', 'Vaisigano', 191, 'WS', 'VS', 'district', 'distrito', -13.5595656, -172.6593798);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(130647, 'Fasito‘outa', 4763, 191, -13.81163, -171.94063),
(130649, 'Leulumoega', 4763, 191, -13.82297, -171.96127),
(130655, 'Nofoali‘i', 4763, 191, -13.8217, -171.95873),
(130658, 'Satapuala', 4763, 191, -13.83535, -171.97963),
(130654, 'Mulifanua', 4761, 191, -13.83183, -172.03602),
(130646, 'Falefa', 4765, 191, -13.88695, -171.58805),
(130650, 'Lotofagā', 4765, 191, -13.97643, -171.85781),
(130651, 'Lufilufi', 4765, 191, -13.87449, -171.59857),
(130659, 'Solosolo', 4765, 191, -13.87504, -171.64181),
(130653, 'Matavai', 4771, 191, -14.03208, -171.64768),
(130656, 'Safotu', 4771, 191, -13.45132, -172.40177),
(130648, 'Gataivai', 4767, 191, -13.7736, -172.38802),
(130661, 'Vailoa', 4767, 191, -13.75551, -172.30698),
(130643, 'Afega', 4770, 191, -13.79726, -171.85308),
(130644, 'Apia', 4770, 191, -13.83333, -171.76666),
(130652, 'Malie', 4770, 191, -13.80044, -171.8469),
(130660, 'Vailima', 4770, 191, -13.86417, -171.76126),
(130662, 'Vaiusu', 4770, 191, -13.82678, -171.79333),
(130657, 'Samamea', 4768, 191, -13.93375, -171.53122),
(130645, 'Asau', 4766, 191, -13.51963, -172.63784);
