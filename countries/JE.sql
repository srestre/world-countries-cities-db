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
(110, 'Jersey', 'JE', 'JEY', 'Europe', 'Northern Europe', 'Saint Helier', 'GBP', 49.25, -2.16666666, '🇯🇪');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5309, 'Grouville', 110, 'JE', '01', 'parish', 49.18404, -2.0516828),
(5310, 'St Brelade', 110, 'JE', '02', 'parish', 49.1851255, -2.2010341),
(5311, 'St Clement', 110, 'JE', '03', 'parish', 49.1736373, -2.0562124),
(5312, 'St Helier', 110, 'JE', '04', 'parish', 49.1856637, -2.1102277),
(5313, 'St John', 110, 'JE', '05', 'parish', 49.2465535, -2.1349726),
(5314, 'St Lawrence', 110, 'JE', '06', 'parish', 49.2149124, -2.1416892),
(5315, 'St Martin', 110, 'JE', '07', 'parish', 49.2177274, -2.0516314),
(5316, 'St Mary', 110, 'JE', '08', 'parish', 49.2364029, -2.1716245),
(5317, 'St Ouen', 110, 'JE', '09', 'parish', 49.2335087, -2.2020406),
(5318, 'St Peter', 110, 'JE', '10', 'parish', 49.2128288, -2.18372),
(5319, 'St Saviour', 110, 'JE', '11', 'parish', 49.1948946, -2.0903183),
(5320, 'Trinity', 110, 'JE', '12', 'parish', 49.234492, -2.0929268);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(154101, 'Vingtaine de la Rocque', 5309, 110, 49.1704888, -2.0338914),
(154099, 'Vingtaine de la Rue', 5309, 110, 49.1866123, -2.0531613),
(154100, 'Vingtaine de Longueville', 5309, 110, 49.1900183, -2.049178),
(154098, 'Vingtaine des Marais', 5309, 110, 49.185563, -2.050422),
(154105, 'Vingtaine de la Moye', 5310, 110, 49.1844548, -2.2395047),
(154102, 'Vingtaine de Noirmont', 5310, 110, 49.1726985, -2.2255051),
(154104, 'Vingtaine des Quennevais', 5310, 110, 49.1970432, -2.2161808),
(154103, 'Vingtaine du Coin', 5310, 110, 49.1875396, -2.1847371),
(154106, 'Grande Vingtaine', 5311, 110, 49.1720713, -2.0619937),
(154108, 'Vingtaine de Samarès', 5311, 110, 49.1649758, -2.0988029),
(154107, 'Vingtaine du Rocquier', 5311, 110, 49.172505, -2.0654384),
(154111, 'Vingtaine de Bas du Mont au Prêtre', 5312, 110, 49.1993959, -2.1196408),
(154112, 'Vingtaine de Haut du Mont au Prêtre', 5312, 110, 49.2024251, -2.0991923),
(154109, 'Vingtaine de la Ville', 5312, 110, 49.1788332, -2.1035759),
(154113, 'Vingtaine du Mont à l''Abbé', 5312, 110, 49.2003633, -2.1338439),
(154114, 'Vingtaine du Mont Cochon', 5312, 110, 49.1997537, -2.1475755),
(154110, 'Vingtaine du Rouge Bouillon', 5312, 110, 49.192912, -2.109353),
(154116, 'Vingtaine de Hérupe', 5313, 110, 49.2333012, -2.1235708),
(154117, 'Vingtaine du Douet', 5313, 110, 49.2345962, -2.1722771),
(154115, 'Vingtaine du Nord', 5313, 110, 49.2393878, -2.1206972),
(154119, 'Vingtaine Bas de la Vallée', 5314, 110, 49.1958468, -2.1566922),
(154120, 'Vingtaine du Coin Hatain', 5314, 110, 49.2207436, -2.1269749),
(154121, 'Vingtaine du Coin Motier', 5314, 110, 49.2249017, -2.139654),
(154122, 'Vingtaine du Coin Tourgis Nord', 5314, 110, 49.2292499, -2.1509257),
(154123, 'Vingtaine du Coin Tourgis Sud', 5314, 110, 49.2105946, -2.1526433),
(154125, 'Vingtaine de Faldouet', 5315, 110, 49.2032204, -2.0526972),
(154126, 'Vingtaine de la Quéruée', 5315, 110, 49.214991, -2.0560363),
(154124, 'Vingtaine de Rozel', 5315, 110, 49.235695, -2.0504847),
(154128, 'Vingtaine du Fief de la Reine', 5315, 110, 49.2184277, -2.0351879),
(154130, 'Vingtaine du Nord', 5316, 110, 49.2442639, -2.1808226),
(154129, 'Vingtaine du Sud', 5316, 110, 49.2340425, -2.1673084),
(154133, 'Cueillette de Grantez', 5317, 110, 49.2312397, -2.2233903),
(154136, 'Cueillette de Léoville', 5317, 110, 49.2380324, -2.2263487),
(154134, 'Cueillette de Millais', 5317, 110, 49.2408537, -2.2433042),
(154135, 'Cueillette de Vinchelez', 5317, 110, 49.244478, -2.2390543),
(154132, 'Grande Cueillette', 5317, 110, 49.22331, -2.2160988),
(154131, 'Petite Cueillette', 5317, 110, 49.2245677, -2.1965655),
(154138, 'Grande Vingtaine', 5318, 110, 49.210655, -2.1960636),
(154139, 'Vingtaine des Augerez', 5318, 110, 49.2077679, -2.1862978),
(154140, 'Vingtaine du Coin Varin', 5318, 110, 49.2145195, -2.1872255),
(154137, 'Vingtaine du Douet', 5318, 110, 49.2098807, -2.1845342),
(154146, 'Vingtaine de la Grande Longueville', 5319, 110, 49.1878671, -2.0750215),
(154141, 'Vingtaine de la Petite Longueville', 5319, 110, 49.1809034, -2.0812162),
(154143, 'Vingtaine de Maufant', 5319, 110, 49.2082296, -2.100606),
(154144, 'Vingtaine de Sous la Hougue', 5319, 110, 49.2137711, -2.1357662),
(154145, 'Vingtaine des Pigneaux', 5319, 110, 49.202627, -2.0708067),
(154151, 'Vingtaine de la Croiserie', 5320, 110, 49.2164693, -2.0916441),
(154147, 'Vingtaine de la Ville-à-l''Évêque', 5320, 110, 49.2317648, -2.1223684),
(154148, 'Vingtaine de Rozel', 5320, 110, 49.2384287, -2.0670406),
(154150, 'Vingtaine des Augrès', 5320, 110, 49.2285729, -2.0823505),
(154149, 'Vingtaine du Rondin', 5320, 110, 49.2370624, -2.0875331);
