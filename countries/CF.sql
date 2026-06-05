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
(42, 'Central African Republic', 'República Centroafricana', 'CF', 'CAF', 'Africa', 'África', 'Middle Africa', 'África Central', 'Bangui', 'XAF', 7, 21, '🇨🇫');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(1259, 'Bamingui-Bangoran', 'Bamingui-bangoran', 42, 'CF', 'BB', 'prefecture', 'prefectura', 8.698547, 20.5281149),
(1262, 'Bangui', 'Bangui', 42, 'CF', 'BGF', 'commune', 'comuna', 4.3635118, 18.5835913),
(1264, 'Basse-Kotto', 'Basse-kotto', 42, 'CF', 'BK', 'prefecture', 'prefectura', 5.1283201, 21.3883825),
(1258, 'Haut-Mbomou', 'Aujourd''hui-mbomou', 42, 'CF', 'HM', 'prefecture', 'prefectura', 6.3497929, 25.6508738),
(1268, 'Haute-Kotto', 'Haute-Kotto', 42, 'CF', 'HK', 'prefecture', 'prefectura', 7.3625645, 22.9271411),
(1263, 'Kémo', 'note', 42, 'CF', 'KG', 'prefecture', 'prefectura', 5.9480074, 19.2158871),
(1256, 'Lobaye', 'Siffler', 42, 'CF', 'LB', 'prefecture', 'prefectura', 4.1034548, 17.5653592),
(1257, 'Mambéré-Kadéï', 'Mugely-Kadéï', 42, 'CF', 'HS', 'prefecture', 'prefectura', 4.5662762, 15.8671403),
(1266, 'Mbomou', 'Mbomou', 42, 'CF', 'MB', 'prefecture', 'prefectura', 5.5230899, 23.4445705),
(1253, 'Nana-Grébizi', 'Nana-Grébizi', 42, 'CF', 'KB', 'economic prefecture', 'prefectura económica', 7.5048007, 19.1923579),
(1260, 'Nana-Mambéré', 'Nana-Mambéré', 42, 'CF', 'NM', 'prefecture', 'prefectura', 5.2231625, 15.3517922),
(1255, 'Ombella-M''Poko', 'Ombela-Mou-M''roko', 42, 'CF', 'MP', 'prefecture', 'prefectura', 5.0726761, 18.1717789),
(1265, 'Ouaka', 'Ouuaka', 42, 'CF', 'UK', 'prefecture', 'prefectura', 6.3110548, 20.5447525),
(1254, 'Ouham', 'Ouham', 42, 'CF', 'AC', 'prefecture', 'prefectura', 7.1314008, 17.7041361),
(1267, 'Ouham-Pendé', 'Ouham-Pendé', 42, 'CF', 'OP', 'prefecture', 'prefectura', 6.7057282, 16.1443202),
(1252, 'Sangha-Mbaéré', 'Sangha-Mbaéré', 42, 'CF', 'SE', 'prefecture', 'prefectura', 3.6754895, 16.3246915),
(1261, 'Vakaga', 'Seulement', 42, 'CF', 'VK', 'prefecture', 'prefectura', 9.8250502, 22.376363);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(17296, 'Bamingui', 1259, 42, 7.88897, 20.04875),
(17329, 'Ndélé', 1259, 42, 8.74287, 20.89108),
(17298, 'Bangui', 1262, 42, 4.36122, 18.55496),
(17294, 'Alindao', 1264, 42, 5.02667, 21.20876),
(17323, 'Kembé', 1264, 42, 4.62275, 21.88645),
(17327, 'Mobaye', 1264, 42, 4.31902, 21.17861),
(17331, 'Obo', 1258, 42, 5.39586, 26.49211),
(17338, 'Zemio', 1258, 42, 5.03144, 25.13614),
(17313, 'Bria', 1268, 42, 6.54233, 21.98633),
(17332, 'Ouadda', 1268, 42, 8.07771, 22.40075),
(17337, 'Sibut', 1263, 42, 5.71801, 19.07389),
(17307, 'Boda', 1256, 42, 4.31887, 17.46953),
(17308, 'Boganangone', 1256, 42, 4.73558, 17.14047),
(17325, 'Mbaiki', 1256, 42, 3.97145, 17.93352),
(17328, 'Mongoumba', 1256, 42, 3.64153, 18.59364),
(17301, 'Berberati', 1257, 42, 4.31211, 15.88948),
(17314, 'Carnot', 1257, 42, 4.94273, 15.87735),
(17317, 'Gamboula', 1257, 42, 4.11775, 15.13926),
(17297, 'Bangassou', 1266, 42, 4.74132, 22.81838),
(17316, 'Gambo', 1266, 42, 4.64816, 22.26331),
(17334, 'Ouango', 1266, 42, 4.31325, 22.55524),
(17336, 'Rafai', 1266, 42, 5.81012, 24.20305),
(17321, 'Kaga Bandoro', 1253, 42, 6.98961, 19.18744),
(17299, 'Baoro', 1260, 42, 5.66667, 15.96667),
(17310, 'Bouar', 1260, 42, 5.93404, 15.59599),
(17303, 'Bimbo', 1255, 42, 4.25671, 18.41583),
(17305, 'Boali', 1255, 42, 4.80048, 18.12747),
(17315, 'Damara', 1255, 42, 4.96075, 18.7035),
(17295, 'Bambari', 1265, 42, 5.76795, 20.67565),
(17318, 'Grimari', 1265, 42, 5.73549, 19.91209),
(17319, 'Ippy', 1265, 42, 6.26793, 21.22468),
(17324, 'Kouango', 1265, 42, 4.99337, 19.96186),
(17300, 'Batangafo', 1254, 42, 7.30082, 18.2833),
(17309, 'Bossangoa', 1254, 42, 6.49263, 17.45518),
(17311, 'Bouca', 1254, 42, 6.50734, 18.2767),
(17320, 'Kabo', 1254, 42, 7.69937, 18.62903),
(17306, 'Bocaranga', 1267, 42, 6.76546, 15.77873),
(17312, 'Bozoum', 1267, 42, 6.31933, 16.37992),
(17335, 'Paoua', 1267, 42, 7.24269, 16.44059),
(17330, 'Nola', 1252, 42, 3.52494, 16.04583),
(17304, 'Birao', 1261, 42, 10.28488, 22.78818),
(17333, 'Ouanda-Djallé', 1261, 42, 9.05877, 22.42741);
