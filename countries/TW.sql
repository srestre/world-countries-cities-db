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
(216, 'Taiwan', 'Taiwán', 'TW', 'TWN', 'Asia', 'Asia', 'Eastern Asia', 'Asia Oriental', 'Taipei', 'TWD', 23.5, 121, '🇹🇼');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(3404, 'Changhua', 'Changhua', 216, 'TW', 'CHA', 'county', 'condado', 24.0755667, 120.5444667),
(3408, 'Chiayi', 'Chiayi', 216, 'TW', 'CYI', 'city', 'ciudad', 23.4591664, 120.2930004),
(5704, 'Chiayi County', '嘉義縣', 216, 'TW', 'CYQ', 'county', 'condado', 23.49620556, 120.641875),
(3417, 'Hsinchu', 'Hsinchu', 216, 'TW', 'HSZ', 'city', 'ciudad', 24.8138287, 120.9674798),
(5705, 'Hsinchu County', '新竹縣', 216, 'TW', 'HSQ', 'county', 'condado', 24.83333333, 121.01472222),
(3411, 'Hualien', 'Hualien', 216, 'TW', 'HUA', 'county', 'condado', 23.9871589, 121.6015714),
(3412, 'Kaohsiung', 'Kaohsiung', 216, 'TW', 'KHH', 'special municipality', 'municipio especial', 22.6203348, 120.3120375),
(4965, 'Keelung', 'Keelung', 216, 'TW', 'KEE', 'city', 'ciudad', 25.1317232, 121.744652),
(3415, 'Kinmen', 'Kinmen', 216, 'TW', 'KIN', 'county', 'condado', 24.4367638, 118.3186435),
(3420, 'Lienchiang', 'Lienchiang', 216, 'TW', 'LIE', 'county', 'condado', 26.1577951, 119.9519756),
(3413, 'Miaoli', 'Miaoli', 216, 'TW', 'MIA', 'county', 'condado', 24.560159, 120.8214265),
(3407, 'Nantou', 'Nantou', 216, 'TW', 'NAN', 'county', 'condado', 23.90235, 120.6909167),
(4966, 'New Taipei', 'New Taipei', 216, 'TW', 'NWT', 'special municipality', 'municipio especial', 25.011997, 121.4656619),
(3403, 'Penghu', 'Penghu', 216, 'TW', 'PEN', 'county', 'condado', 23.569694, 119.5664543),
(3405, 'Pingtung', 'Pingtung', 216, 'TW', 'PIF', 'county', 'condado', 22.6628468, 120.4915677),
(3406, 'Taichung', 'Taichung', 216, 'TW', 'TXG', 'special municipality', 'municipio especial', 24.163162, 120.6478282),
(3421, 'Tainan', 'Tainan', 216, 'TW', 'TNN', 'special municipality', 'municipio especial', 22.9912348, 120.184982),
(3422, 'Taipei', 'Taipei', 216, 'TW', 'TPE', 'special municipality', 'municipio especial', 25.0329694, 121.5654177),
(3410, 'Taitung', 'Taitung', 216, 'TW', 'TTT', 'county', 'condado', 22.7560447, 121.1456538),
(3419, 'Taoyuan', 'Taoyuan', 216, 'TW', 'TAO', 'special municipality', 'municipio especial', 24.9936281, 121.3009798),
(3402, 'Yilan', 'Yilan', 216, 'TW', 'ILA', 'county', 'condado', 24.7302791, 121.7631149),
(3416, 'Yunlin', 'Yunlin', 216, 'TW', 'YUN', 'county', 'condado', 23.6990775, 120.5245511);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(109003, 'Changhua', 3404, 216, 23.95361, 120.49083),
(109038, 'Yuanlin', 3404, 216, 23.95671, 120.57608),
(109004, 'Chiayi', 3408, 216, 23.47722, 120.44527),
(109026, 'Pizitou', 3408, 216, 23.48556, 120.44472),
(160127, 'Budai', 5704, 216, 23.36, 120.17),
(109005, 'Chiayi', 5704, 216, 23.46333, 120.58166),
(160128, 'Dalin', 5704, 216, 23.59888889, 120.47),
(160129, 'Minxiong', 5704, 216, 23.550399, 120.445696),
(109011, 'Hsinchu', 3417, 216, 24.67416, 121.16111),
(109010, 'Hsinchu', 5705, 216, 24.80361, 120.96861),
(160131, 'Hukou', 5705, 216, 24.9, 121.05),
(160130, 'Zhubei', 5705, 216, 24.83333333, 121.01194444),
(109012, 'Hualien', 3411, 216, 23.78166, 121.39333),
(109016, 'Kaohsiung', 3412, 216, 22.61626, 120.31333),
(109014, 'Jincheng', 3415, 216, 24.43415, 118.31712),
(109017, 'Kinmen', 3415, 216, 24.45333, 118.38861),
(109018, 'Lienchiang', 3420, 216, 26.37004, 120.49545),
(109022, 'Nangan', 3420, 216, 26.15039, 119.93284),
(109021, 'Miaoli', 3413, 216, 24.48972, 120.90638),
(109019, 'Lugu', 3407, 216, 23.74639, 120.7525),
(109023, 'Nantou', 3407, 216, 23.83419, 120.92704),
(109027, 'Puli', 3407, 216, 23.96639, 120.96952),
(109041, 'Zhongxing New Village', 3407, 216, 23.95908, 120.68516),
(109020, 'Magong', 3403, 216, 23.5654, 119.58627),
(109024, 'Penghu', 3403, 216, 23.57111, 119.61138),
(109007, 'Donggang', 3405, 216, 22.46515, 120.44927),
(109009, 'Hengchun', 3405, 216, 22.00417, 120.74389),
(109025, 'Pingtung', 3405, 216, 22.49555, 120.61444),
(109028, 'Taichung', 3406, 216, 24.1469, 120.6839),
(109030, 'Tainan', 3421, 216, 22.99083, 120.21333),
(109039, 'Yujing', 3421, 216, 23.12493, 120.46138),
(109002, 'Banqiao', 3422, 216, 25.01427, 121.46719),
(109015, 'Jiufen', 3422, 216, 25.10957, 121.84424),
(109031, 'Taipei', 3422, 216, 25.04776, 121.53185),
(109033, 'Taitung', 3410, 216, 22.88361, 121.04833),
(109006, 'Daxi', 3419, 216, 24.88373, 121.29043),
(109035, 'Taoyuan', 3419, 216, 24.895, 121.24611),
(109037, 'Yilan', 3402, 216, 24.5425, 121.63361),
(109008, 'Douliu', 3416, 216, 23.70944, 120.54333),
(109040, 'Yunlin', 3416, 216, 23.70701, 120.38481);
