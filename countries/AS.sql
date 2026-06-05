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
(5, 'American Samoa', 'Samoa Americana', 'AS', 'ASM', 'Oceania', 'Oceanía', 'Polynesia', 'Polinesia', 'Pago Pago', 'USD', -14.33333333, -170, '🇦🇸');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5375, 'Eastern', 'Eastern', 5, 'AS', '02', 'district', 'distrito', -14.2782402, -170.6243227),
(5376, 'Manuʻa', 'Injury', 5, 'AS', '03', 'district', 'distrito', -14.214605, -169.533465),
(5378, 'Rose', 'Rose', 5, 'AS', '05', 'atoll', 'atolón', -14.5424865, -168.1637445),
(5377, 'Swains', 'Swains', 5, 'AS', '04', 'atoll', 'atolón', -11.052904, -171.0767349),
(5374, 'Western', 'Western', 5, 'AS', '01', 'district', 'distrito', -14.3323075, -170.7961334);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(154920, 'Ituʻau', 5375, 5, -14.3061643, -170.8069144),
(154921, 'Maʻoputasi', 5375, 5, -14.2521685, -170.7418767),
(154924, 'Saʻole', 5375, 5, -14.299957, -170.6176337),
(154923, 'Sua', 5375, 5, -14.2771088, -170.7144263),
(154922, 'Vaifanua', 5375, 5, -14.2557804, -170.7630181),
(154928, 'Faleasao', 5376, 5, -14.2038549, -169.5490737),
(154929, 'Fitiuta', 5376, 5, -14.2038634, -169.5169044),
(154925, 'Ofu', 5376, 5, -14.1713595, -169.7193912),
(154926, 'Olosega', 5376, 5, -14.1742227, -169.6398124),
(154927, 'Tau', 5376, 5, -14.2421501, -169.5510165),
(154916, 'Lealataua', 5374, 5, -14.3226152, -170.9084993),
(154917, 'Leasina', 5374, 5, -14.2958164, -170.8045932),
(154918, 'Tualatai', 5374, 5, -14.3792354, -170.8103312),
(154919, 'Tualauta', 5374, 5, -14.3587689, -170.7558332);
