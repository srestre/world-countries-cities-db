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
(43, 'Chad', 'TD', 'TCD', 'Africa', 'Middle Africa', 'N''Djamena', 'XAF', 15, 19, '🇹🇩');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(3583, 'Bahr el Gazel', 43, 'TD', 'BG', 'province', 14.4682468, 16.9416836),
(3590, 'Batha', 43, 'TD', 'BA', 'province', 13.8367731, 18.9649806),
(3574, 'Borkou', 43, 'TD', 'BO', 'province', 17.2658129, 18.3695288),
(5114, 'Chari-Baguirmi', 43, 'TD', 'CB', 'province', 11.3345348, 16.2884311),
(3575, 'Ennedi-Est', 43, 'TD', 'EE', 'province', 17.6219737, 23.3133676),
(3584, 'Ennedi-Ouest', 43, 'TD', 'EO', 'province', 18.1636803, 21.5082709),
(3576, 'Guéra', 43, 'TD', 'GR', 'province', 11.6753817, 18.4910031),
(3573, 'Hadjer-Lamis', 43, 'TD', 'HL', 'province', 12.6903906, 16.3352648),
(3588, 'Kanem', 43, 'TD', 'KA', 'province', 15.2264398, 15.3151191),
(3577, 'Lac', 43, 'TD', 'LC', 'province', 13.5820827, 14.3788329),
(3585, 'Logone Occidental', 43, 'TD', 'LO', 'province', 8.7795637, 15.9126749),
(3591, 'Logone Oriental', 43, 'TD', 'LR', 'province', 8.2047152, 16.470181),
(3589, 'Mandoul', 43, 'TD', 'MA', 'province', 8.72751, 17.5841771),
(3580, 'Mayo-Kebbi Est', 43, 'TD', 'ME', 'province', 10.126618, 15.818345),
(3571, 'Mayo-Kebbi Ouest', 43, 'TD', 'MO', 'province', 9.2640383, 14.7151598),
(3570, 'Moyen-Chari', 43, 'TD', 'MC', 'province', 9.4407768, 18.8160927),
(3586, 'N''Djamena', 43, 'TD', 'ND', 'province', 12.1191543, 15.0502758),
(3582, 'Ouaddaï', 43, 'TD', 'OD', 'province', 13.4613569, 21.288445),
(3592, 'Salamat', 43, 'TD', 'SA', 'province', 10.7575596, 20.6934116),
(3572, 'Sila', 43, 'TD', 'SI', 'province', 12.11786, 21.4458848),
(3579, 'Tandjilé', 43, 'TD', 'TA', 'province', 9.5713051, 16.5294956),
(3587, 'Tibesti', 43, 'TD', 'TI', 'province', 21.4007391, 17.4742763),
(3581, 'Wadi Fira', 43, 'TD', 'WF', 'province', 15.0191449, 21.467319);

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
