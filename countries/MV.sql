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
(133, 'Maldives', 'MV', 'MDV', 'Asia', 'Southern Asia', 'Male', 'MVR', 3.25, 73, '🇲🇻');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(2594, 'Addu', 133, 'MV', '01', 'city', -0.6414935, 73.1629978),
(2587, 'Alif Alif', 133, 'MV', '02', 'administrative atoll', 4.4389236, 72.8716854),
(2600, 'Alif Dhaal', 133, 'MV', '00', 'administrative atoll', 3.6123026, 72.855663),
(5727, 'Baa', 133, 'MV', '20', 'administrative atoll', 5.13333333, 72.95),
(2590, 'Dhaalu', 133, 'MV', '17', 'administrative atoll', 2.8473454, 72.9029526),
(2599, 'Faafu', 133, 'MV', '14', 'administrative atoll', 3.1314909, 72.8843567),
(2598, 'Gaafu Alif', 133, 'MV', '27', 'administrative atoll', 0.9829527, 73.2780939),
(2603, 'Gaafu Dhaalu', 133, 'MV', '28', 'administrative atoll', 0.3041783, 73.2124746),
(2595, 'Gnaviyani', 133, 'MV', '29', 'administrative atoll', -0.2053264, 73.2569868),
(2586, 'Haa Alif', 133, 'MV', '07', 'administrative atoll', 7.0607296, 72.9896628),
(2597, 'Haa Dhaalu', 133, 'MV', '23', 'administrative atoll', 6.449901, 72.6264899),
(2596, 'Kaafu', 133, 'MV', '26', 'administrative atoll', 4.354299, 73.5760032),
(2601, 'Laamu', 133, 'MV', '05', 'administrative atoll', 1.8899418, 73.3140027),
(2607, 'Lhaviyani', 133, 'MV', '03', 'administrative atoll', 5.3992544, 73.5273924),
(2609, 'Malé', 133, 'MV', 'MLE', 'administrative atoll', 4.1779879, 73.5107387),
(2608, 'Meemu', 133, 'MV', '12', 'administrative atoll', 2.7878094, 73.5342987),
(2592, 'Noonu', 133, 'MV', '25', 'administrative atoll', 5.786755, 73.4184336),
(2602, 'Raa', 133, 'MV', '13', 'administrative atoll', 5.6609485, 72.7681645),
(2585, 'Shaviyani', 133, 'MV', '24', 'administrative atoll', 6.3322997, 73.2324635),
(2591, 'Thaa', 133, 'MV', '08', 'administrative atoll', 2.1461655, 73.0288245),
(2584, 'Vaavu', 133, 'MV', '04', 'administrative atoll', 3.6152492, 73.5869986);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(67929, 'Hithadhoo', 2594, 133, -0.6, 73.08333),
(67937, 'Meedhoo', 2594, 133, -0.58333, 73.23333),
(67934, 'Mahibadhoo', 2600, 133, 3.75713, 72.96893),
(67931, 'Kudahuvadhoo', 2590, 133, 2.67075, 72.89437),
(67943, 'Viligili', 2598, 133, 0.75906, 73.43296),
(67940, 'Thinadhoo', 2603, 133, 0.5306, 72.99969),
(67927, 'Fuvahmulah', 2595, 133, -0.29878, 73.42403),
(67923, 'Dhidhdhoo', 2586, 133, 6.88744, 73.11402),
(67932, 'Kulhudhuffushi', 2597, 133, 6.62207, 73.06998),
(67928, 'Guraidhoo', 2596, 133, 3.90045, 73.46623),
(67930, 'Hulhumale', 2596, 133, 4.21169, 73.54008),
(67933, 'Maafushi', 2596, 133, 3.94231, 73.4907),
(67935, 'Male', 2596, 133, 4.17521, 73.50916),
(67925, 'Fonadhoo', 2601, 133, 1.83243, 73.50257),
(67939, 'Naifaru', 2607, 133, 5.44438, 73.36571),
(67938, 'Muli', 2608, 133, 2.91667, 73.56667),
(67936, 'Manadhoo', 2592, 133, 5.76687, 73.4136),
(67941, 'Ugoofaaru', 2602, 133, 5.66812, 73.03017),
(67926, 'Funadhoo', 2585, 133, 6.15091, 73.29013),
(67942, 'Veymandoo', 2591, 133, 2.18772, 73.09556),
(67924, 'Felidhoo', 2584, 133, 3.47182, 73.54699);
