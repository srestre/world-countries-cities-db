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
(89, 'Guam', 'GU', 'GUM', 'Oceania', 'Micronesia', 'Hagatna', 'USD', 13.46666666, 144.78333333, '🇬🇺');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5254, 'Agana Heights', 89, 'GU', '01', 'village', 13.4655441, 144.7465714),
(5255, 'Asan-Maina', 89, 'GU', '02', 'village', 13.4776472, 144.7308588),
(5256, 'Barrigada', 89, 'GU', '03', 'village', 13.4694092, 144.80106),
(5257, 'Chalan Pago-Ordot', 89, 'GU', '04', 'village', 13.441372, 144.7670241),
(5258, 'Dededo', 89, 'GU', '05', 'village', 13.519054, 144.8378388),
(5259, 'Hågat', 89, 'GU', '06', 'village', 13.384761, 144.6580714),
(5265, 'Hagåtña', 89, 'GU', '12', 'village', 13.4748148, 144.7516191),
(5261, 'Inarajan (Inalåhan)', 89, 'GU', '08', 'village', 13.2797664, 144.7432266),
(5263, 'Mangilao', 89, 'GU', '10', 'village', 13.4439915, 144.8050528),
(5262, 'Merizo (Malesso)', 89, 'GU', '09', 'village', 13.2682975, 144.6726106),
(5264, 'Mongmong-Toto-Maite', 89, 'GU', '11', 'village', 13.4674318, 144.7680282),
(5266, 'Piti', 89, 'GU', '13', 'village', 13.4647446, 144.6876982),
(5267, 'Santa Rita (Sånta Rita-Sumai)', 89, 'GU', '14', 'village', 13.3867874, 144.6664227),
(5268, 'Sinajana', 89, 'GU', '15', 'village', 13.4609486, 144.7461208),
(5269, 'Talofofo (Talo''fo''fo)', 89, 'GU', '16', 'village', 13.353904, 144.7532932),
(5270, 'Tamuning', 89, 'GU', '17', 'village', 13.4944762, 144.7804582),
(5260, 'Umatac (Humåtak)', 89, 'GU', '07', 'village', 13.2945777, 144.6538283),
(5271, 'Yigo', 89, 'GU', '18', 'village', 13.5379424, 144.8984955),
(5272, 'Yona', 89, 'GU', '19', 'village', 13.41376, 144.774413);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(160257, 'Agana Heights Village', 5254, 89, 13.46559, 144.74795),
(160258, 'Asan-Maina Village', 5255, 89, 13.47215, 144.71654),
(160259, 'Barrigada Village', 5256, 89, 13.46913, 144.79901),
(160260, 'Chalan Pago-Ordot Village', 5257, 89, 13.44741, 144.75902),
(160261, 'Dededo Village', 5258, 89, 13.51777, 144.8391),
(160262, 'Agat Village', 5259, 89, 13.383, 144.66003),
(160269, 'Hagåtña', 5265, 89, 13.47567, 144.74886),
(160268, 'Hagåtña Village', 5265, 89, 13.47279, 144.75802),
(160263, 'Inarajan Village', 5261, 89, 13.27363, 144.74845),
(160265, 'Adacao', 5263, 89, 13.49242, 144.8447),
(160266, 'Mangilao Village', 5263, 89, 13.44761, 144.80109),
(160264, 'Merizo Village', 5262, 89, 13.26584, 144.66908),
(160267, 'Mongmong-Toto-Maite Village', 5264, 89, 13.46857, 144.78214),
(160270, 'Piti Village', 5266, 89, 13.46256, 144.69331),
(160271, 'Apra Harbor', 5267, 89, 13.42827, 144.65252),
(160272, 'Santa Rita Village', 5267, 89, 13.38608, 144.67226),
(160273, 'Sinajana Village', 5268, 89, 13.46334, 144.75406),
(160274, 'Talofofo Village', 5269, 89, 13.35513, 144.75835),
(160276, 'Apotgan', 5270, 89, 13.48817, 144.77644),
(160275, 'Tamuning', 5270, 89, 13.48754, 144.78143),
(160277, 'Tamuning-Tumon-Harmon Village', 5270, 89, 13.48773, 144.78138),
(160279, 'Anao', 5271, 89, 13.5289, 144.9182),
(160278, 'Chaguian', 5271, 89, 13.57175, 144.88058),
(160280, 'Yigo Village', 5271, 89, 13.53605, 144.88855),
(160281, 'Yona Village', 5272, 89, 13.40974, 144.77697);
