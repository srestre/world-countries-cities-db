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
(145, 'Monaco', 'Mónaco', 'MC', 'MCO', 'Europe', 'Europa', 'Western Europe', 'Europa Occidental', 'Monaco', 'EUR', 43.73333333, 7.4, '🇲🇨');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5668, 'Fontvieille', 'Fontvieille', 145, 'MC', 'FO', 'quarter', 'distrito', 43.72944444, 7.415),
(5669, 'Jardin Exotique', 'Jardin Exotique', 145, 'MC', 'JE', 'quarter', 'distrito', 43.73138889, 7.41388889),
(4917, 'La Colle', 'La Colle', 145, 'MC', 'CL', 'quarter', 'distrito', 43.7327465, 7.4137276),
(4918, 'La Condamine', 'La Condamine', 145, 'MC', 'CO', 'quarter', 'distrito', 43.7350665, 7.419906),
(5670, 'La Gare', 'La Gare', 145, 'MC', 'GA', 'quarter', 'distrito', 43.7319, 7.4168),
(5671, 'La Source', 'La Source', 145, 'MC', 'SO', 'quarter', 'distrito', 43.7365, 7.4195),
(5672, 'Larvotto', 'Larvotto', 145, 'MC', 'LA', 'quarter', 'distrito', 43.74666667, 7.43333333),
(5673, 'Malbousquet', 'Malbousquet', 145, 'MC', 'MA', 'quarter', 'distrito', 43.7345, 7.4215),
(5674, 'Monaco-Ville', 'Monaco-Ville', 145, 'MC', 'MO', 'quarter', 'distrito', 43.7311, 7.42),
(4919, 'Moneghetti', 'Mongotti', 145, 'MC', 'MG', 'quarter', 'distrito', 43.7364927, 7.4153383),
(5675, 'Monte-Carlo', 'Monte-Carlo', 145, 'MC', 'MC', 'quarter', 'distrito', 43.73972222, 7.42722222),
(5676, 'Moulins', 'Moulins', 145, 'MC', 'MU', 'quarter', 'distrito', 43.7389, 7.4185),
(5677, 'Port-Hercule', 'Port-Hercule', 145, 'MC', 'PH', 'quarter', 'distrito', 43.7347, 7.4253),
(5678, 'Saint-Roman', 'Saint-Roman', 145, 'MC', 'SR', 'quarter', 'distrito', 43.7453, 7.4318),
(5679, 'Sainte-Dévote', 'Sainte-Dévote', 145, 'MC', 'SD', 'quarter', 'distrito', 43.7372, 7.4208),
(5680, 'Spélugues', 'Spélugues', 145, 'MC', 'SP', 'quarter', 'distrito', 43.7392, 7.4251),
(5681, 'Vallon de la Rousse', 'Vallon de la Rousse', 145, 'MC', 'VR', 'quarter', 'distrito', 43.7401, 7.4175);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(160046, 'Fontvieille', 5668, 145, 43.72944444, 7.415),
(160047, 'Jardin Exotique', 5669, 145, 43.73138889, 7.41388889),
(160048, 'La Colle', 4917, 145, 43.7327465, 7.4137276),
(160049, 'La Condamine', 4918, 145, 43.7350665, 7.419906),
(160050, 'La Gare', 5670, 145, 43.7319, 7.4168),
(160051, 'La Source', 5671, 145, 43.7365, 7.4195),
(160052, 'Larvotto', 5672, 145, 43.74666667, 7.43333333),
(160053, 'Malbousquet', 5673, 145, 43.7345, 7.4215),
(160054, 'Monaco-Ville', 5674, 145, 43.7311, 7.42),
(160055, 'Moneghetti', 4919, 145, 43.7364927, 7.4153383),
(160056, 'Monte-Carlo', 5675, 145, 43.73972222, 7.42722222),
(160057, 'Moulins', 5676, 145, 43.7389, 7.4185),
(160058, 'Port-Hercule', 5677, 145, 43.7347, 7.4253),
(160059, 'Saint-Roman', 5678, 145, 43.7453, 7.4318),
(160060, 'Sainte-Dévote', 5679, 145, 43.7372, 7.4208),
(160061, 'Spélugues', 5680, 145, 43.7392, 7.4251),
(160062, 'Vallon de la Rousse', 5681, 145, 43.7401, 7.4175);
