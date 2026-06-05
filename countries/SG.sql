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
(199, 'Singapore', 'Singapur', 'SG', 'SGP', 'Asia', 'Asia', 'South-Eastern Asia', 'Sudeste Asiático', 'Singapur', 'SGD', 1.36666666, 103.8, '🇸🇬');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(4651, 'Central Singapore', 'Central Singapore', 199, 'SG', '01', 'district', 'distrito', 1.2884, 103.8535),
(4649, 'North East', 'North East', 199, 'SG', '02', 'district', 'distrito', 5.3341186, 100.2761077),
(4653, 'North West', 'North West', 199, 'SG', '03', 'district', 'distrito', 1.4509382, 103.7849519),
(4650, 'South East', 'South East', 199, 'SG', '04', 'district', 'distrito', 1.3352329, 103.9598931),
(4652, 'South West', 'South West', 199, 'SG', '05', 'district', 'distrito', 5.2883389, 100.2815099);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(153462, 'Bukit Timah', 4651, 199, 1.3294, 103.8021),
(153466, 'Downtown Core', 4651, 199, 1.278, 103.852),
(153463, 'Geylang', 4651, 199, 1.3182, 103.8871),
(153467, 'Kallang', 4651, 199, 1.3106, 103.866),
(153459, 'Marine Parade', 4651, 199, 1.303, 103.9072),
(153461, 'Novena', 4651, 199, 1.3201, 103.8439),
(153464, 'Orchard Road', 4651, 199, 1.3036, 103.8318),
(153468, 'Outram', 4651, 199, 1.2819, 103.839),
(153465, 'Rochor', 4651, 199, 1.3049, 103.852),
(104057, 'Singapore', 4651, 199, 1.28967, 103.85007),
(153460, 'Tanjong Pagar', 4651, 199, 1.2764, 103.8434),
(153469, 'Toa Payoh', 4651, 199, 1.3354, 103.8497),
(153475, 'Ang Mo Kio', 4649, 199, 1.3698, 103.8461),
(153472, 'Hougang', 4649, 199, 1.3736, 103.8867),
(153474, 'Punggol', 4649, 199, 1.4051, 103.9023),
(153471, 'Sengkang', 4649, 199, 1.3901, 103.8952),
(153473, 'Serangoon', 4649, 199, 1.3496, 103.8737),
(153476, 'Sembawang', 4653, 199, 1.4491, 103.8201),
(104058, 'Woodlands', 4653, 199, 1.43801, 103.78877),
(153470, 'Yishun', 4653, 199, 1.4293, 103.8355),
(153478, 'Bedok', 4650, 199, 1.3236, 103.9273),
(153479, 'Pasir Ris', 4650, 199, 1.3739, 103.9493),
(153477, 'Tampines', 4650, 199, 1.3547, 103.9437),
(153481, 'Bukit Batok', 4652, 199, 1.3496, 103.7528),
(153482, 'Bukit Panjang', 4652, 199, 1.3786, 103.7626),
(153480, 'Jurong West', 4652, 199, 1.3396, 103.7073);
