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
(141, 'Mayotte', 'YT', 'MYT', 'Africa', 'Eastern Africa', 'Mamoudzou', 'EUR', -12.83333333, 45.16666666, '🇾🇹');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5415, 'Acoua', 141, 'YT', '14', 'commune', -12.7243245, 45.0589372),
(5417, 'Bandraboua', 141, 'YT', '16', 'commune', -12.7045482, 45.1221926),
(5406, 'Bandrélé', 141, 'YT', '05', 'commune', -12.9133586, 45.1928677),
(5408, 'Boueni', 141, 'YT', '07', 'commune', -12.9107086, 45.0801256),
(5412, 'Chiconi', 141, 'YT', '11', 'commune', -12.8323497, 45.1149766),
(5409, 'Chirongui', 141, 'YT', '08', 'commune', -12.93544, 45.1492157),
(5405, 'Dembeni', 141, 'YT', '04', 'commune', -12.8433081, 45.1839954),
(5402, 'Dzaoudzi', 141, 'YT', '01', 'commune', -12.7760651, 45.2563246),
(5407, 'Kani Keli', 141, 'YT', '06', 'commune', -12.9565222, 45.1052606),
(5418, 'Koungou', 141, 'YT', '17', 'commune', -12.735753, 45.2067459),
(5414, 'M''Tsangamouji', 141, 'YT', '13', 'commune', -12.7601941, 45.0876892),
(5404, 'Mamoudzou', 141, 'YT', '03', 'commune', -12.7804136, 45.2279761),
(5416, 'Mtsamboro', 141, 'YT', '15', 'commune', -12.6996969, 45.0679904),
(5411, 'Ouangani', 141, 'YT', '10', 'commune', -12.8498235, 45.1398664),
(5403, 'Pamandzi', 141, 'YT', '02', 'commune', -12.7983446, 45.2746515),
(5410, 'Sada', 141, 'YT', '09', 'commune', -12.8518289, 45.0993169),
(5413, 'Tsingoni', 141, 'YT', '12', 'commune', -12.7897252, 45.1038055);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(160325, 'Acoua', 5415, 141, -12.72391, 45.05819),
(160324, 'Mtsangadoua', 5415, 141, -12.71112, 45.05118),
(160330, 'Bandraboua', 5417, 141, -12.7044, 45.12231),
(160329, 'Bouyouni', 5417, 141, -12.73462, 45.13914),
(160333, 'Dzumogne', 5417, 141, -12.71667, 45.11667),
(160332, 'Handréma', 5417, 141, -12.68112, 45.09965),
(160331, 'Mtsangamboua', 5417, 141, -12.69033, 45.10926),
(160302, 'Bandrele', 5406, 141, -12.91276, 45.19256),
(160303, 'Hamouro', 5406, 141, -12.8813, 45.21494),
(160300, 'Mtsamoudou', 5406, 141, -12.96232, 45.17449),
(160301, 'Nyambadao', 5406, 141, -12.89346, 45.20214),
(160305, 'Bouéni', 5408, 141, -12.9025, 45.07611),
(160306, 'Mouanatrindri', 5408, 141, -12.8996, 45.09792),
(160307, 'Mzouazia', 5408, 141, -12.92717, 45.10336),
(160318, 'Chiconi', 5412, 141, -12.83333, 45.11056),
(160319, 'Sohoa', 5412, 141, -12.82233, 45.10552),
(160309, 'Chirongui', 5409, 141, -12.93194, 45.14833),
(160311, 'Miréréni', 5409, 141, -12.90708, 45.15295),
(160310, 'Mramadoudou', 5409, 141, -12.92846, 45.15324),
(160312, 'Poroani', 5409, 141, -12.89226, 45.14121),
(160308, 'Tsimkoura', 5409, 141, -12.93934, 45.13739),
(160299, 'Dembeni', 5405, 141, -12.8436, 45.18436),
(160295, 'Hajangoua', 5405, 141, -12.86607, 45.19857),
(160296, 'Iloni', 5405, 141, -12.84553, 45.19037),
(160297, 'Ongojou', 5405, 141, -12.83883, 45.16012),
(160298, 'Tsararano', 5405, 141, -12.83528, 45.17355),
(160283, 'Dzaoudzi', 5402, 141, -12.78339, 45.25693),
(160282, 'Labattoir', 5402, 141, -12.77698, 45.28234),
(160304, 'Kani-Kéli', 5407, 141, -12.95361, 45.10333),
(160337, 'Kangani', 5418, 141, -12.73186, 45.18694),
(160335, 'Koungou', 5418, 141, -12.73361, 45.20417),
(160338, 'Longoni', 5418, 141, -12.73426, 45.16298),
(160334, 'Majikavo Koropa', 5418, 141, -12.74701, 45.22058),
(160336, 'Trévani', 5418, 141, -12.73437, 45.19861),
(160323, 'Chembényoumba', 5414, 141, -12.76472, 45.07793),
(160322, 'M''Tsangamouji', 5414, 141, -12.75944, 45.08361),
(160292, 'Combani', 5404, 141, -12.8, 45.16667),
(160290, 'Kaouéni', 5404, 141, -12.77121, 45.22419),
(160289, 'Kavani', 5404, 141, -12.78447, 45.22299),
(160291, 'Majikavo Lamir', 5404, 141, -12.75572, 45.22968),
(160293, 'Mamoudzou', 5404, 141, -12.78234, 45.22878),
(160288, 'Mtsapéré', 5404, 141, -12.78636, 45.21732),
(160294, 'Passamainty', 5404, 141, -12.80201, 45.20818),
(160287, 'Tsoundzou 1', 5404, 141, -12.80615, 45.2023),
(160286, 'Tsoundzou 2', 5404, 141, -12.81845, 45.1972),
(160285, 'Vahibé', 5404, 141, -12.79024, 45.17707),
(160327, 'Hamjago', 5416, 141, -12.68832, 45.0745),
(160328, 'Mtsahara', 5416, 141, -12.68137, 45.08274),
(160326, 'Mtsamboro', 5416, 141, -12.69982, 45.06894),
(160317, 'Barakani', 5411, 141, -12.83799, 45.1312),
(160315, 'Kahani', 5411, 141, -12.82385, 45.13141),
(160316, 'Ouangani', 5411, 141, -12.84639, 45.13611),
(160284, 'Pamandzi', 5403, 141, -12.79674, 45.27938),
(160314, 'Mangajou', 5410, 141, -12.84404, 45.11716),
(160313, 'Sada', 5410, 141, -12.85055, 45.10205),
(160320, 'Miréréni', 5413, 141, -12.78867, 45.14113),
(160321, 'Tsingoni', 5413, 141, -12.78722, 45.10278);
