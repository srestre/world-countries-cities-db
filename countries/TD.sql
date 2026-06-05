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
(43, 'Chad', 'Chad', 'TD', 'TCD', 'Africa', 'África', 'Middle Africa', 'África Central', 'N''Djamena', 'XAF', 15, 19, '🇹🇩');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(3583, 'Bahr el Gazel', 'Bahr El Gazel', 43, 'TD', 'BG', 'province', 'provincia', 14.4682468, 16.9416836),
(3590, 'Batha', 'Batha', 43, 'TD', 'BA', 'province', 'provincia', 13.8367731, 18.9649806),
(3574, 'Borkou', 'Borkou', 43, 'TD', 'BO', 'province', 'provincia', 17.2658129, 18.3695288),
(5114, 'Chari-Baguirmi', 'Chari-baguirmi', 43, 'TD', 'CB', 'province', 'provincia', 11.3345348, 16.2884311),
(3575, 'Ennedi-Est', 'Ennedi-Est', 43, 'TD', 'EE', 'province', 'provincia', 17.6219737, 23.3133676),
(3584, 'Ennedi-Ouest', 'Ennedi-Ouest', 43, 'TD', 'EO', 'province', 'provincia', 18.1636803, 21.5082709),
(3576, 'Guéra', 'Guéra', 43, 'TD', 'GR', 'province', 'provincia', 11.6753817, 18.4910031),
(3573, 'Hadjer-Lamis', 'Hadjer-lamis', 43, 'TD', 'HL', 'province', 'provincia', 12.6903906, 16.3352648),
(3588, 'Kanem', 'Kanem', 43, 'TD', 'KA', 'province', 'provincia', 15.2264398, 15.3151191),
(3577, 'Lac', 'Lac', 43, 'TD', 'LC', 'province', 'provincia', 13.5820827, 14.3788329),
(3585, 'Logone Occidental', 'Logone Occidental', 43, 'TD', 'LO', 'province', 'provincia', 8.7795637, 15.9126749),
(3591, 'Logone Oriental', 'Logone Oriental', 43, 'TD', 'LR', 'province', 'provincia', 8.2047152, 16.470181),
(3589, 'Mandoul', 'Mandall', 43, 'TD', 'MA', 'province', 'provincia', 8.72751, 17.5841771),
(3580, 'Mayo-Kebbi Est', 'Micha-cube EST', 43, 'TD', 'ME', 'province', 'provincia', 10.126618, 15.818345),
(3571, 'Mayo-Kebbi Ouest', 'Mayo-kebbi Oust', 43, 'TD', 'MO', 'province', 'provincia', 9.2640383, 14.7151598),
(3570, 'Moyen-Chari', 'Moyen-Chari', 43, 'TD', 'MC', 'province', 'provincia', 9.4407768, 18.8160927),
(3586, 'N''Djamena', 'N''Djamena', 43, 'TD', 'ND', 'province', 'provincia', 12.1191543, 15.0502758),
(3582, 'Ouaddaï', 'Ouaddaï', 43, 'TD', 'OD', 'province', 'provincia', 13.4613569, 21.288445),
(3592, 'Salamat', 'Merci', 43, 'TD', 'SA', 'province', 'provincia', 10.7575596, 20.6934116),
(3572, 'Sila', 'Ils sont', 43, 'TD', 'SI', 'province', 'provincia', 12.11786, 21.4458848),
(3579, 'Tandjilé', 'Dentaire', 43, 'TD', 'TA', 'province', 'provincia', 9.5713051, 16.5294956),
(3587, 'Tibesti', 'Tibesti', 43, 'TD', 'TI', 'province', 'provincia', 21.4007391, 17.4742763),
(3581, 'Wadi Fira', 'Wadi Fira', 43, 'TD', 'WF', 'province', 'provincia', 15.0191449, 21.467319);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(105152, 'Moussoro', 3583, 43, 13.64143, 16.48941),
(105120, 'Ati', 3590, 43, 13.2154, 18.3353),
(105154, 'Oum Hadjer', 3590, 43, 13.2954, 19.6966),
(105133, 'Faya-Largeau', 3574, 43, 17.9257, 19.10428),
(153256, 'Baguirmi Department', 5114, 43, 11.39833333, 16.1675),
(153257, 'Bousso', 5114, 43, 10.4825, 16.71611111),
(153259, 'Dababa', 5114, 43, 12.38, 17.06),
(153260, 'Gaoui', 5114, 43, 12.1807, 15.1476),
(153261, 'Linia', 5114, 43, 12.0562141, 15.3037987),
(153262, 'Mandjafa', 5114, 43, 11.19861111, 15.36111111),
(153263, 'Massenya', 5114, 43, 11.40277778, 16.17),
(105132, 'Fada', 3584, 43, 17.18535, 21.58114),
(105124, 'Bitkine', 3576, 43, 11.9801, 18.2138),
(105149, 'Melfi', 3576, 43, 11.0598, 17.9355),
(105150, 'Mongo', 3576, 43, 12.18441, 18.69303),
(105125, 'Bokoro', 3573, 43, 12.37813, 17.05876),
(105146, 'Massaguet', 3573, 43, 12.47554, 15.43647),
(105147, 'Massakory', 3573, 43, 12.996, 15.72927),
(105145, 'Mao', 3588, 43, 14.12116, 15.3103),
(105126, 'Bol', 3577, 43, 13.46706, 14.71363),
(105122, 'Beïnamar', 3585, 43, 8.6698, 15.3813),
(105121, 'Benoy', 3585, 43, 8.98327, 16.31991),
(105143, 'Lac Wey', 3585, 43, 8.70502, 15.98303),
(105151, 'Moundou', 3585, 43, 8.56667, 16.08333),
(105129, 'Bébédja', 3591, 43, 8.6761, 16.566),
(105128, 'Béboto', 3591, 43, 8.26681, 16.93898),
(105131, 'Doba', 3591, 43, 8.65, 16.85),
(105134, 'Goundi', 3589, 43, 9.36267, 17.36597),
(105141, 'Koumra', 3589, 43, 8.91256, 17.55392),
(105153, 'Moïssala', 3589, 43, 8.3404, 17.7663),
(105127, 'Bongor', 3580, 43, 10.28056, 15.37222),
(105135, 'Gounou Gaya', 3580, 43, 9.6294, 15.5132),
(105138, 'Guelendeng', 3580, 43, 10.91762, 15.55011),
(105148, 'Mboursou Léré', 3571, 43, 9.7639, 14.1539),
(105155, 'Pala', 3571, 43, 9.3642, 14.9046),
(105142, 'Kyabé', 3570, 43, 9.45149, 18.94493),
(105156, 'Sarh', 3570, 43, 9.1429, 18.3923),
(153264, 'N''Djamena', 3586, 43, 12.11, 15.05),
(105116, 'Abéché', 3582, 43, 13.82916, 20.8324),
(105117, 'Adré', 3582, 43, 13.46648, 22.19875),
(105137, 'Goz Béïda', 3582, 43, 13.94563, 20.5468),
(105118, 'Am Timan', 3592, 43, 11.0297, 20.2827),
(105136, 'Goz Beïda', 3572, 43, 12.22484, 21.41034),
(105130, 'Béré', 3579, 43, 9.3202, 16.1552),
(105140, 'Kelo', 3579, 43, 9.30859, 15.80658),
(105144, 'Laï', 3579, 43, 9.3972, 16.30066),
(105119, 'Aozou', 3587, 43, 21.8375, 17.4275),
(105123, 'Biltine', 3581, 43, 14.52791, 20.92749),
(105139, 'Iriba', 3581, 43, 15.11667, 22.25);
