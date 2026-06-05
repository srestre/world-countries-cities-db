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
(152, 'Namibia', 'NA', 'NAM', 'Africa', 'Southern Africa', 'Windhoek', 'NAD', -22, 17, '🇳🇦');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(43, 'Erongo', 152, 'NA', 'ER', 'region', -22.0278147, 15.389358),
(38, 'Hardap', 152, 'NA', 'HA', 'region', -24.4140944, 17.4134051),
(45, 'Karas', 152, 'NA', 'KA', 'region', -26.8752094, 17.7634818),
(36, 'Kavango East', 152, 'NA', 'KE', 'region', -18.3982355, 20.72468),
(35, 'Kavango West', 152, 'NA', 'KW', 'region', -18.256111, 18.970201),
(44, 'Khomas', 152, 'NA', 'KH', 'region', -22.9082553, 17.09198),
(34, 'Kunene', 152, 'NA', 'KU', 'region', -19.6792809, 13.9756564),
(40, 'Ohangwena', 152, 'NA', 'OW', 'region', -17.5877369, 16.7737955),
(41, 'Omaheke', 152, 'NA', 'OH', 'region', -21.9074676, 19.3929661),
(39, 'Omusati', 152, 'NA', 'OS', 'region', -18.2862314, 14.8856679),
(37, 'Oshana', 152, 'NA', 'ON', 'region', -18.4702308, 15.7434419),
(42, 'Oshikoto', 152, 'NA', 'OT', 'region', -18.5464046, 17.1019606),
(46, 'Otjozondjupa', 152, 'NA', 'OD', 'region', -19.9424962, 18.395886),
(47, 'Zambezi', 152, 'NA', 'CA', 'region', -17.6912922, 24.1377371);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(76626, 'Arandis', 43, 152, -22.41667, 14.96667),
(76633, 'Hentiesbaai', 43, 152, -22.11667, 14.28333),
(76636, 'Karibib', 43, 152, -21.93333, 15.83333),
(76648, 'Omaruru', 43, 152, -21.43333, 15.93333),
(76659, 'Otjimbingwe', 43, 152, -22.35, 16.13333),
(76666, 'Swakopmund', 43, 152, -22.67842, 14.52663),
(76667, 'Swakopmund Constituency', 43, 152, -22.63199, 14.60119),
(76670, 'Usakos', 43, 152, -22, 15.6),
(76671, 'Walvis Bay', 43, 152, -22.9575, 14.50528),
(76627, 'Aranos', 38, 152, -24.13333, 19.11667),
(76634, 'Hoachanas', 38, 152, -23.91667, 18.05),
(76643, 'Maltahöhe', 38, 152, -24.83333, 16.98333),
(76644, 'Mariental', 38, 152, -24.63333, 17.96667),
(76663, 'Rehoboth', 38, 152, -23.317, 17.09),
(76629, 'Bethanie', 45, 152, -26.48333, 17.15),
(76635, 'Karasburg', 45, 152, -28.01667, 18.75),
(76639, 'Keetmanshoop', 45, 152, -26.58333, 18.13333),
(76642, 'Lüderitz', 45, 152, -26.64807, 15.15383),
(76655, 'Oranjemund', 45, 152, -28.55, 16.43333),
(76668, 'Tses', 45, 152, -25.88333, 18),
(76672, 'Warmbad', 45, 152, -28.45, 18.73333),
(76664, 'Rundu', 36, 152, -17.93333, 19.76667),
(76638, 'Katutura', 44, 152, -22.52306, 17.06028),
(76673, 'Windhoek', 44, 152, -22.55941, 17.08323),
(76630, 'Epupa Constituency', 34, 152, -17.00388, 13.24825),
(76640, 'Khorixas', 34, 152, -20.36667, 14.96667),
(76641, 'Khorixas Constituency', 34, 152, -20.36792, 14.95996),
(76653, 'Opuwo', 34, 152, -18.06068, 13.83998),
(76654, 'Opuwo Constituency', 34, 152, -18.54247, 13.51617),
(76662, 'Outjo', 34, 152, -20.11667, 16.15),
(76665, 'Sesfontein Constituency', 34, 152, -19.56106, 13.7653),
(76657, 'Oshikango', 40, 152, -17.4, 15.88333),
(76631, 'Gobabis', 41, 152, -22.45, 18.96667),
(76646, 'Okahao', 39, 152, -17.88758, 15.06677),
(76651, 'Ongandjera', 39, 152, -17.88333, 15.06667),
(76661, 'Outapi', 39, 152, -17.5, 14.98333),
(76650, 'Ondangwa', 37, 152, -17.91667, 15.95),
(76652, 'Ongwediva', 37, 152, -17.78333, 15.76667),
(76656, 'Oshakati', 37, 152, -17.78833, 15.70436),
(76649, 'Omuthiya', 42, 152, -18.36463, 16.58146),
(76669, 'Tsumeb', 42, 152, -19.23333, 17.71667),
(76632, 'Grootfontein', 46, 152, -19.56667, 18.11667),
(76645, 'Okahandja', 46, 152, -21.98333, 16.91667),
(76647, 'Okakarara', 46, 152, -20.58333, 17.43333),
(76658, 'Otavi', 46, 152, -19.65, 17.33333),
(76660, 'Otjiwarongo', 46, 152, -20.46369, 16.64772),
(76628, 'Bagani', 47, 152, -18.11065, 21.61645),
(76637, 'Katima Mulilo', 47, 152, -17.5, 24.26667);
