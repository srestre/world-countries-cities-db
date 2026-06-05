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
(248, 'Kosovo', 'XK', 'XKX', 'Europe', 'Eastern Europe', 'Pristina', 'EUR', 42.5612909, 20.3403035, '🇽🇰');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(4874, 'Ferizaj', 248, 'XK', 'XUF', 'district', 42.3701844, 21.1483281),
(4876, 'Gjakove', 248, 'XK', 'XDG', 'district', 42.3798793, 20.4316226),
(4877, 'Gjilan', 248, 'XK', 'XGJ', 'district', 42.4635206, 21.4694011),
(4878, 'Mitrovica', 248, 'XK', 'XKM', 'district', 42.8790424, 20.8657862),
(5321, 'Peja', 248, 'XK', 'PEJ', 'district', 42.6593986, 20.2885757),
(4879, 'Pristina', 248, 'XK', 'XPI', 'district', 42.6629138, 21.1655028),
(5322, 'Prizren', 248, 'XK', 'PRI', 'district', 42.2130151, 20.7363339);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(160143, 'Ferizaj', 4874, 248, 42.37056, 21.15528),
(160139, 'Hani i Elezit', 4874, 248, 42.15, 21.29667),
(160140, 'Kačanik', 4874, 248, 42.23194, 21.25944),
(160141, 'Shtime', 4874, 248, 42.43306, 21.03972),
(160142, 'Štrpce', 4874, 248, 42.23944, 21.02722),
(160147, 'Deçan', 4876, 248, 42.54018, 20.28793),
(160149, 'Dranoc', 4876, 248, 42.51556, 20.29222),
(160146, 'Gjakovë', 4876, 248, 42.38028, 20.43083),
(160150, 'Gllogjan', 4876, 248, 42.50722, 20.36278),
(160158, 'Irzniq', 4876, 248, 42.52, 20.34722),
(160153, 'Isniq', 4876, 248, 42.5575, 20.30278),
(160154, 'Lëbushë', 4876, 248, 42.56306, 20.29083),
(160144, 'Lloqan', 4876, 248, 42.52444, 20.28083),
(160151, 'Lluka e Eperme', 4876, 248, 42.545, 20.30778),
(160155, 'Lumbardhi', 4876, 248, 42.54667, 20.34667),
(160156, 'Orahovac', 4876, 248, 42.39944, 20.65472),
(160145, 'Papraqan', 4876, 248, 42.55278, 20.33111),
(160157, 'Prilep', 4876, 248, 42.5075, 20.31778),
(160152, 'Strellc i Epërm', 4876, 248, 42.57843, 20.29398),
(160148, 'Strellc i Ulët', 4876, 248, 42.58063, 20.31619),
(160159, 'Gjilan', 4877, 248, 42.46045, 21.46986),
(160161, 'Kamenica', 4877, 248, 42.57806, 21.58028),
(160160, 'Klokot', 4877, 248, 42.37139, 21.37444),
(160162, 'Partesh', 4877, 248, 42.40194, 21.43361),
(160163, 'Pasjane', 4877, 248, 42.40694, 21.49556),
(160164, 'Ranilug', 4877, 248, 42.49222, 21.59889),
(160165, 'Vitina', 4877, 248, 42.32139, 21.35833),
(160167, 'Leposaviq', 4878, 248, 43.10389, 20.80278),
(160166, 'Mitrovicë', 4878, 248, 42.88333, 20.86667),
(160168, 'Srbica', 4878, 248, 42.74667, 20.78861),
(160169, 'Vushtrri', 4878, 248, 42.82306, 20.9675),
(160170, 'Zubin Potok', 4878, 248, 42.91444, 20.68972),
(160171, 'Zvečan', 4878, 248, 42.9075, 20.84028),
(160181, 'Dubova (Driloni)', 5321, 248, 42.71194, 20.36972),
(160182, 'Istok', 5321, 248, 42.78083, 20.4875),
(160183, 'Klina', 5321, 248, 42.62167, 20.57778),
(160184, 'Kosuriq', 5321, 248, 42.57028, 20.46472),
(160185, 'Pejë', 5321, 248, 42.65913, 20.28828),
(160172, 'Bradash', 4879, 248, 42.94028, 21.13806),
(160173, 'Glogovac', 4879, 248, 42.62833, 20.89389),
(160174, 'Gračanica', 4879, 248, 42.60111, 21.19583),
(160175, 'Kosovo Polje', 4879, 248, 42.66394, 21.09611),
(160176, 'Lipljan', 4879, 248, 42.52167, 21.12583),
(160177, 'Novo Brdo', 4879, 248, 42.6159, 21.43405),
(160178, 'Obiliq', 4879, 248, 42.68694, 21.07028),
(160179, 'Podujeva', 4879, 248, 42.91056, 21.19306),
(160180, 'Pristina', 4879, 248, 42.67272, 21.16688),
(160186, 'Budakovo', 5322, 248, 42.355, 20.925),
(160188, 'Dragash', 5322, 248, 42.0265, 20.65333),
(160187, 'Gjinoc', 5322, 248, 42.31833, 20.81861),
(160189, 'Leshan', 5322, 248, 42.32778, 20.78111),
(160190, 'Llazicë', 5322, 248, 42.55528, 20.76333),
(160191, 'Mališevo', 5322, 248, 42.48222, 20.74583),
(160192, 'Mamuša', 5322, 248, 42.33083, 20.72694),
(160193, 'Nishor', 5322, 248, 42.42389, 20.80167),
(160194, 'Pagaruša', 5322, 248, 42.42, 20.74222),
(160195, 'Peqan', 5322, 248, 42.38361, 20.82194),
(160196, 'Prizren', 5322, 248, 42.21389, 20.73972),
(160197, 'Suva Reka', 5322, 248, 42.35861, 20.825);
