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
(2, 'Aland Islands', 'Alandia', 'AX', 'ALA', 'Europe', 'Europa', 'Northern Europe', 'Europa del Norte', 'Mariehamn', 'EUR', 60.116667, 19.9, '🇦🇽');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5298, 'Brändö', 'Brändö', 2, 'AX', '12', 'municipality', 'municipio', 60.4135873, 21.0440498),
(5294, 'Eckerö', 'Eckerö', 2, 'AX', '08', 'municipality', 'municipio', 60.2231814, 19.5389379),
(5289, 'Finström', 'Finström', 2, 'AX', '03', 'municipality', 'municipio', 60.2310519, 19.9867259),
(5295, 'Föglö', 'Föglö', 2, 'AX', '09', 'municipality', 'municipio', 60.0107325, 20.4246997),
(5296, 'Geta', 'Geta', 2, 'AX', '10', 'municipality', 'municipio', 60.3740157, 19.8498128),
(5292, 'Hammarland', 'Hammarland', 2, 'AX', '06', 'municipality', 'municipio', 60.2196758, 19.7378481),
(5288, 'Jomala', 'Jomala', 2, 'AX', '02', 'municipality', 'municipio', 60.1522947, 19.9489144),
(5301, 'Kökar', 'Kökar', 2, 'AX', '15', 'municipality', 'municipio', 59.9211709, 20.9103514),
(5300, 'Kumlinge', 'Kumlinge', 2, 'AX', '14', 'municipality', 'municipio', 60.2587693, 20.7782292),
(5290, 'Lemland', 'Lemland', 2, 'AX', '04', 'municipality', 'municipio', 60.0690169, 20.0860081),
(5299, 'Lumparland', 'Lumparland', 2, 'AX', '13', 'municipality', 'municipio', 60.1168385, 20.2610583),
(5287, 'Mariehamn', 'Mariehamn', 2, 'AX', '01', 'municipality', 'municipio', 60.102423, 19.94126),
(5291, 'Saltvik', 'Saltvik', 2, 'AX', '05', 'municipality', 'municipio', 60.2755756, 20.0612065),
(5302, 'Sottunga', 'Sot', 2, 'AX', '16', 'municipality', 'municipio', 60.1307977, 20.6459821),
(5293, 'Sund', 'Hälsosam', 2, 'AX', '07', 'municipality', 'municipio', 60.2530332, 20.1198637),
(5297, 'Vårdö', 'Vårdö', 2, 'AX', '11', 'municipality', 'municipio', 60.2421692, 20.3744261);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(160431, 'Bomarsund', 5288, 2, 60.21234, 20.24023),
(160427, 'Finström', 5288, 2, 60.26667, 19.93333),
(160432, 'Godby', 5288, 2, 60.22995, 19.9881),
(160428, 'Hammarland', 5288, 2, 60.21667, 19.75),
(160429, 'Jomala', 5288, 2, 60.14902, 19.951),
(160433, 'Lemland', 5288, 2, 60.07178, 20.08472),
(160434, 'Saltvik', 5288, 2, 60.28333, 20.05),
(160435, 'Sund', 5288, 2, 60.25, 20.11667),
(160430, 'Tjudö', 5288, 2, 60.33333, 19.95),
(160426, 'Yomala', 5288, 2, 60.16689, 19.93341),
(160436, 'Ytterby', 5288, 2, 60.16667, 20.01667),
(160425, 'Mariehamn', 5287, 2, 60.09726, 19.93481);
