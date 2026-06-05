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
(77, 'French Polynesia', 'PF', 'PYF', 'Oceania', 'Polynesia', 'Papeete', 'XPF', -15, -140, '🇵🇫');

INSERT INTO states (id, name, country_id, country_code, state_code, type, latitude, longitude) VALUES
(5369, 'Austral Islands', 77, 'PF', '01', 'division', -23.3655617, -149.4620816),
(5370, 'Leeward Islands', 77, 'PF', '02', 'division', -16.6308348, -151.5039159),
(5371, 'Marquesas Islands', 77, 'PF', '03', 'division', -9.7793255, -139.0067835),
(5372, 'Tuamotu-Gambier', 77, 'PF', '04', 'division', -18.8027687, -141.9054929),
(5373, 'Windward Islands', 77, 'PF', '05', 'division', -17.6873439, -149.4451681);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(154867, 'Raivavae', 5369, 77, -23.8694633, -147.7324472),
(154868, 'Rapa', 5369, 77, -27.6082239, -144.3842777),
(154869, 'Rimatara', 5369, 77, -22.6438254, -152.8312052),
(154870, 'Rurutu', 5369, 77, -22.4695869, -151.3911371),
(154871, 'Tubuai', 5369, 77, -23.3685043, -149.5449648),
(154872, 'Bora-Bora', 5370, 77, -16.3916925, -151.9300335),
(154873, 'Huahine', 5370, 77, -16.7521233, -151.078895),
(154874, 'Maupiti', 5370, 77, -16.3143849, -154.7990863),
(154875, 'Tahaa', 5370, 77, -16.6195712, -151.5721539),
(154876, 'Taputapuatea', 5370, 77, -16.8206247, -151.4774133),
(154877, 'Tumaraa', 5370, 77, -16.8298533, -151.5338184),
(154878, 'Uturoa', 5370, 77, -16.7385829, -151.4954902),
(154879, 'Fatu-Hiva', 5371, 77, -10.4860474, -138.6918886),
(154880, 'Hiva-Oa', 5371, 77, -9.7263169, -139.3099888),
(154881, 'Nuku-Hiva', 5371, 77, -8.4103001, -141.0232711),
(154882, 'Tahuata', 5371, 77, -9.9573241, -139.1656347),
(154883, 'Ua-Huka', 5371, 77, -8.9096799, -139.6317197),
(154884, 'Ua-Pou', 5371, 77, -9.4089244, -140.1555377),
(154885, 'Anaa', 5372, 77, -17.4119439, -145.6628499),
(154886, 'Arutua', 5372, 77, -15.3120334, -146.9126285),
(154887, 'Fakarava', 5372, 77, -16.2984516, -145.9221889),
(154888, 'Fangatau', 5372, 77, -15.8209788, -140.908106),
(154889, 'Gambier', 5372, 77, -23.1008844, -135.0792255),
(154890, 'Hao', 5372, 77, -18.7453293, -145.3338385),
(154891, 'Hikueru', 5372, 77, -17.5876748, -142.6912059),
(154892, 'Makemo', 5372, 77, -16.5933442, -144.0175628),
(154893, 'Manihi', 5372, 77, -14.3975781, -146.1221707),
(154894, 'Napuka', 5372, 77, -14.1734231, -141.3067669),
(154895, 'Nukutavake', 5372, 77, -18.9780866, -139.2928452),
(154896, 'Puka-Puka', 5372, 77, -14.8190251, -138.8610087),
(154897, 'Rangiroa', 5372, 77, -15.1228292, -147.9114015),
(154898, 'Reao', 5372, 77, -18.519465, -136.460885),
(154899, 'Takaroa', 5372, 77, -14.6726394, -145.2268041),
(154900, 'Tatakoto', 5372, 77, -17.3417316, -138.4758463),
(154901, 'Tureia', 5372, 77, -20.8280318, -138.581639),
(154902, 'Arue', 5373, 77, -17.2773894, -149.8719943),
(154903, 'Faaa', 5373, 77, -17.5839194, -149.6460926),
(154904, 'Hitiaa O Te Ra', 5373, 77, -17.5914258, -149.4732481),
(154905, 'Mahina', 5373, 77, -17.5574742, -149.5164782),
(154906, 'Moorea-Maiao', 5373, 77, -17.5756653, -150.8618877),
(154907, 'Paea', 5373, 77, -17.6961698, -149.5896966),
(154908, 'Papara', 5373, 77, -17.7118763, -149.5904295),
(154909, 'Papeete', 5373, 77, -17.5571387, -149.5966009),
(154910, 'Pirae', 5373, 77, -17.5698638, -149.563528),
(154911, 'Punaauia', 5373, 77, -17.6179696, -149.6310224),
(154912, 'Taiarapu-Est', 5373, 77, -17.7555128, -149.3953396),
(154913, 'Taiarapu-Ouest', 5373, 77, -17.8100452, -149.3270052),
(154914, 'Teva I Uta', 5373, 77, -17.7225008, -149.4819615);
