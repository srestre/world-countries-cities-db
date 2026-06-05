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
(138, 'Martinique', 'Martinica', 'MQ', 'MTQ', 'Americas', 'América', 'Caribbean', 'Caribe', 'Fort-de-France', 'EUR', 14.666667, -61, '🇲🇶');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5398, 'Fort-de-France', 'Fort-de-France', 138, 'MQ', '01', 'district', 'distrito', 14.6027962, -61.0676724),
(5399, 'La Trinité', 'La Trinité', 138, 'MQ', '02', 'district', 'distrito', 14.7553161, -61.0287226),
(5400, 'Le Marin', 'Le Marin', 138, 'MQ', '03', 'district', 'distrito', 14.5251841, -60.9624151),
(5401, 'Saint-Pierre', 'Saint-Pierre', 138, 'MQ', '04', 'district', 'distrito', 14.7417183, -61.1763904);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(154980, 'Fort-de-France', 5398, 138, 14.6492418, -61.1098445),
(154981, 'Le Lamentin', 5398, 138, 14.6230862, -61.0334749),
(154982, 'Saint-Joseph', 5398, 138, 14.683534, -61.0818662),
(154983, 'Schœlcher', 5398, 138, 14.6517997, -61.1412867),
(154985, 'Basse-Pointe', 5399, 138, 14.8409708, -61.1648523),
(154986, 'Grand''Rivière', 5399, 138, 14.8469663, -61.2042764),
(154987, 'Gros-Morne', 5399, 138, 14.7084184, -61.1127122),
(154984, 'L''Ajoupa-Bouillon', 5399, 138, 14.8159718, -61.1717063),
(154993, 'La Trinité', 5399, 138, 14.7380415, -61.0292956),
(154988, 'Le Lorrain', 5399, 138, 14.7995256, -61.1151374),
(154990, 'Le Marigot', 5399, 138, 14.7795818, -61.0942458),
(154991, 'Le Robert', 5399, 138, 14.6744327, -61.0169272),
(154989, 'Macouba', 5399, 138, 14.8474386, -61.1670946),
(154992, 'Sainte-Marie', 5399, 138, 14.7730093, -61.0495997),
(154996, 'Ducos', 5400, 138, 14.5785442, -61.0097386),
(154995, 'Le Diamant', 5400, 138, 14.4768004, -61.0597384),
(154997, 'Le François', 5400, 138, 14.6092885, -60.9799911),
(154998, 'Le Marin', 5400, 138, 14.4822169, -60.9001141),
(155005, 'Le Vauclin', 5400, 138, 14.542086, -60.9006006),
(154994, 'Les Anses-d''Arlet', 5400, 138, 14.4995478, -61.1148162),
(155004, 'Les Trois-Îlets', 5400, 138, 14.5328746, -61.0787769),
(154999, 'Rivière-Pilote', 5400, 138, 14.5026697, -60.9381921),
(155000, 'Rivière-Salée', 5400, 138, 14.526214, -61.0035309),
(155001, 'Saint-Esprit', 5400, 138, 14.5617595, -60.9645111),
(155002, 'Sainte-Anne', 5400, 138, 14.431422, -60.8927876),
(155003, 'Sainte-Luce', 5400, 138, 14.4904093, -60.9879365),
(155006, 'Bellefontaine', 5401, 138, 14.6747476, -61.1665308),
(155008, 'Case-Pilote', 5401, 138, 14.6593399, -61.1502612),
(155009, 'Fonds-Saint-Denis', 5401, 138, 14.7227546, -61.1618919),
(155007, 'Le Carbet', 5401, 138, 14.7052158, -61.1944468),
(155010, 'Le Morne-Rouge', 5401, 138, 14.7695364, -61.1629284),
(155011, 'Le Morne-Vert', 5401, 138, 14.7046433, -61.1567977),
(155012, 'Le Prêcheur', 5401, 138, 14.8220261, -61.2374686),
(155013, 'Saint-Pierre', 5401, 138, 14.7716719, -61.2147501);
