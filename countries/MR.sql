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
(139, 'Mauritania', 'Mauritania', 'MR', 'MRT', 'Africa', 'África', 'Western Africa', 'África Occidental', 'Nouakchott', 'MRU', 20, -12, '🇲🇷');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(3344, 'Adrar', 'أدرار', 139, 'MR', '07', 'region', 'región', 21.0090623, -10.2207449),
(3349, 'Assaba', 'عصابة', 139, 'MR', '03', 'region', 'región', 16.5809185, -11.5363724),
(3339, 'Brakna', 'براكنا', 139, 'MR', '05', 'region', 'región', 17.2475638, -13.4037714),
(3346, 'Dakhlet Nouadhibou', 'داخلة نواذيبو', 139, 'MR', '08', 'region', 'región', 20.8019537, -16.0012708),
(3341, 'Gorgol', 'غورغول', 139, 'MR', '04', 'region', 'región', 16.0062275, -12.8360834),
(3350, 'Guidimaka', 'غيديماكا', 139, 'MR', '10', 'region', 'región', 15.3766896, -12.124663),
(3338, 'Hodh Ech Chargui', 'حوض الشرقي', 139, 'MR', '01', 'region', 'región', 18.1941112, -7.0921652),
(3351, 'Hodh El Gharbi', 'حوض الغربي', 139, 'MR', '02', 'region', 'región', 16.5693922, -9.8322366),
(3342, 'Inchiri', 'إنشيري', 139, 'MR', '12', 'region', 'región', 19.9922766, -15.113767),
(3343, 'Nouakchott-Nord', 'نواكشوط الشمالية', 139, 'MR', '14', 'region', 'región', 18.1024945, -15.9192819),
(3352, 'Nouakchott-Ouest', 'نواكشوط الغربية', 139, 'MR', '13', 'region', 'región', 18.1127945, -15.9930276),
(3347, 'Nouakchott-Sud', 'نواكشوط الجنوبية', 139, 'MR', '15', 'region', 'región', 18.0033945, -15.965829),
(3345, 'Tagant', 'تاجانت', 139, 'MR', '09', 'region', 'región', 18.5729893, -10.3937926),
(3340, 'Tiris Zemmour', 'تيريس زمور', 139, 'MR', '11', 'region', 'región', 24.1951392, -9.6664199),
(3348, 'Trarza', 'ترارزة', 139, 'MR', '06', 'region', 'región', 17.922642, -14.8476017);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(67746, 'Atar', 3344, 139, 20.5177, -13.04857),
(150074, 'Azougui', 3344, 139, 20.56764, -13.11191),
(67748, 'Chingueṭṭi', 3344, 139, 20.463, -12.362),
(150075, 'Ksar el Khali', 3344, 139, 20.93333333, -11.61666667),
(67747, 'Barkéwol', 3349, 139, 16.64039, -12.49849),
(67750, 'Kiffa', 3349, 139, 16.62073, -11.40208),
(67757, '’Elb el Jmel', 3339, 139, 17.0105, -13.97102),
(67745, 'Aleg', 3339, 139, 17.05314, -13.91312),
(150071, 'Bofal', 3339, 139, 16.41666667, -13.8),
(150072, 'Sori Malé', 3339, 139, 16.95416667, -13.37916667),
(150076, 'Cansado', 3346, 139, 20.85333333, -17.0325),
(150077, 'Iouik', 3346, 139, 19.84944444, -16.33083333),
(67751, 'Nouadhibou', 3346, 139, 20.94188, -17.03842),
(67749, 'Kaédi', 3341, 139, 16.15027, -13.5037),
(67754, 'Sélibaby', 3350, 139, 15.15846, -12.1843),
(150066, 'Diade', 3338, 139, 16.23333333, -7.41666667),
(150067, 'Kataouane', 3338, 139, 16.06888889, -6.49888889),
(67752, 'Néma', 3338, 139, 16.61702, -7.25649),
(150068, 'Timbedra', 3338, 139, 16.24472222, -8.1675),
(67743, 'Aioun', 3351, 139, 16.6614, -9.6149),
(150069, 'Ayoun el Atrous', 3351, 139, 16.66666667, -9.61666667),
(150070, 'Togba', 3351, 139, 17.4, -10.36666667),
(67744, 'Akjoujt', 3342, 139, 19.74657, -14.38531),
(150085, 'Dar-Naim', 3343, 139, 18.03333333, -15.96666667),
(150086, 'Teyarett', 3343, 139, 18.1289572, -15.9377834),
(150087, 'Toujouonine', 3343, 139, 18.07169, -15.90311),
(150082, 'Ksar', 3352, 139, 18.1049033, -15.9644337),
(150083, 'Sebkha', 3352, 139, 18.07555556, -16.00194444),
(150084, 'Tevragh-Zeina', 3352, 139, 18.11011, -15.99931),
(150088, 'Arafat', 3347, 139, 18.04639, -15.97194),
(150089, 'Riyad', 3347, 139, 18.0078427, -15.97404),
(153945, 'Moudjeria', 3345, 139, 17.9795514, -13.3979534),
(153946, 'Tichit', 3345, 139, 18.4968626, -12.1219935),
(153947, 'Tijigja', 3345, 139, 18.5164787, -12.9826476),
(150078, 'Ain Ben Tili', 3340, 139, 25.99444444, -9.55333333),
(150079, 'Chegga', 3340, 139, 25.37194444, -5.78666667),
(150080, 'Fderîck', 3340, 139, 22.67777778, -12.7075),
(150081, 'Zouérat', 3340, 139, 22.73444444, -12.4725),
(67756, 'Zouerate', 3340, 139, 22.73542, -12.47134),
(150073, 'Legat', 3348, 139, 16.75, -14.83333333),
(67753, 'Rosso', 3348, 139, 16.51378, -15.80503),
(67755, 'Tékane', 3348, 139, 16.60175, -15.34866);
