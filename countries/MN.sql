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
(146, 'Mongolia', 'MN', 'MNG', 'Asia', 'Eastern Asia', 'Ulan Bator', 'MNT', 46, 105, '🇲🇳');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(1973, 'Arkhangai', 146, 'MN', '073', 'province', 47.862646, 101.0316283),
(1969, 'Bayan-Ölgii', 146, 'MN', '071', 'province', 48.5470083, 89.8549358),
(1976, 'Bayankhongor', 146, 'MN', '069', 'province', 45.2380937, 99.5146799),
(1961, 'Bulgan', 146, 'MN', '067', 'province', 48.9521438, 103.3965591),
(1962, 'Darkhan-Uul', 146, 'MN', '037', 'province', 49.3767291, 106.2901384),
(1963, 'Dornod', 146, 'MN', '061', 'province', 47.6772781, 115.2177155),
(1981, 'Dornogovi', 146, 'MN', '063', 'province', 44.4179637, 109.7783753),
(1970, 'Dundgovi', 146, 'MN', '059', 'province', 45.5186722, 106.2611562),
(1972, 'Govi-Altai', 146, 'MN', '065', 'province', 45.3463139, 95.9325806),
(1978, 'Govisümber', 146, 'MN', '064', 'province', 46.4610827, 108.5173101),
(1974, 'Khentii', 146, 'MN', '039', 'province', 47.885981, 110.4201043),
(1964, 'Khovd', 146, 'MN', '043', 'province', 46.8997977, 92.2959651),
(1975, 'Khövsgöl', 146, 'MN', '041', 'province', 50.2206196, 99.9170492),
(1967, 'Ömnögovi', 146, 'MN', '053', 'province', 43.282363, 104.1133864),
(1966, 'Orkhon', 146, 'MN', '035', 'province', 49.0243744, 104.2998863),
(1965, 'Övörkhangai', 146, 'MN', '055', 'province', 45.8297039, 102.7237769),
(1980, 'Selenge', 146, 'MN', '049', 'province', 49.3910136, 107.0629034),
(1977, 'Sükhbaatar', 146, 'MN', '051', 'province', 46.2093417, 113.5077196),
(1968, 'Töv', 146, 'MN', '047', 'province', 47.4692538, 106.5525161),
(5453, 'Ulaanbaatar', 146, 'MN', '001', 'capital city', 47.9184676, 106.9177016),
(1971, 'Uvs', 146, 'MN', '046', 'province', 49.6313887, 92.9558186),
(1979, 'Zavkhan', 146, 'MN', '057', 'province', 48.3133355, 96.2850506);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(67734, 'Tsetserleg', 1973, 146, 47.475, 101.45417),
(67706, 'Altay', 1969, 146, 48.29359, 89.51488),
(67740, 'Ölgii', 1969, 146, 48.96833, 89.9625),
(67733, 'Tsengel', 1969, 146, 48.94314, 89.14358),
(67709, 'Bayanhongor', 1976, 146, 46.19444, 100.71806),
(67710, 'Bulgan', 1961, 146, 48.8125, 103.53472),
(67714, 'Darhan', 1962, 146, 49.48667, 105.92278),
(67711, 'Choibalsan', 1963, 146, 48.07257, 114.53264),
(67718, 'Ereencav', 1963, 146, 49.8807, 115.72526),
(67725, 'Mandalgovi', 1970, 146, 45.7625, 106.27083),
(67705, 'Altai', 1972, 146, 46.37222, 96.25833),
(67712, 'Choyr', 1978, 146, 46.36111, 108.36111),
(67739, 'Undurkhaan', 1974, 146, 47.31944, 110.65556),
(67724, 'Khovd', 1964, 146, 48.00556, 91.64194),
(67728, 'Möst', 1964, 146, 46.67712, 92.78521),
(67741, 'Üyönch', 1964, 146, 46.04786, 92.02612),
(67719, 'Hanh', 1975, 146, 51.50265, 100.66395),
(67726, 'Murun-kuren', 1975, 146, 49.63417, 100.1625),
(67732, 'Tsengel', 1975, 146, 49.47833, 100.88944),
(67735, 'Turt', 1975, 146, 51.50725, 100.66257),
(67713, 'Dalandzadgad', 1967, 146, 43.57083, 104.425),
(67720, 'Hanhongor', 1967, 146, 43.77345, 104.47998),
(67730, 'Nomgon Sum', 1967, 146, 42.41462, 105.0564),
(67717, 'Erdenet', 1966, 146, 49.03333, 104.08333),
(67707, 'Arvayheer', 1965, 146, 46.26389, 102.775),
(67721, 'Harhorin', 1965, 146, 47.19753, 102.82379),
(67722, 'Hovd', 1965, 146, 44.67024, 102.17491),
(67723, 'Kharkhorin', 1965, 146, 47.19245, 102.81349),
(67729, 'Nariynteel', 1965, 146, 45.9595, 101.45977),
(67716, 'Dzüünharaa', 1980, 146, 48.85229, 106.45786),
(67731, 'Sühbaatar', 1980, 146, 50.23139, 106.20778),
(67708, 'Baruun-Urt', 1977, 146, 46.68056, 113.27917),
(67742, 'Centipede', 1968, 146, 47.70693, 106.95276),
(67715, 'Dzuunmod', 1968, 146, 47.70694, 106.95278),
(67727, 'Möngönmorĭt', 1968, 146, 48.19504, 108.48295),
(67737, 'Ulaanhudag', 1968, 146, 47.33333, 104.5),
(153783, 'Ulan Bator', 1968, 146, 47.8917624, 106.73706),
(157016, 'Ulaanbaatar', 5453, 146, 47.8915317, 106.7367222),
(67736, 'Ulaangom', 1971, 146, 49.98111, 92.06667),
(67738, 'Uliastay', 1979, 146, 47.74167, 96.84444);
