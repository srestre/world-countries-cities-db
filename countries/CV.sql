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
(40, 'Cape Verde', 'Cabo Verde', 'CV', 'CPV', 'Africa', 'África', 'Western Africa', 'África Occidental', 'Praia', 'CVE', 16, -24, '🇨🇻');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(2994, 'Barlavento Islands', 'Barlavento Islands', 40, 'CV', 'B', 'geographical region', 'región geográfica', 17.0555285, -25.1723049),
(2999, 'Boa Vista', 'Boa Vista', 40, 'CV', 'BV', 'municipality', 'municipio', 16.099509, -22.8009411),
(2996, 'Brava', 'Brava', 40, 'CV', 'BR', 'municipality', 'municipio', 14.8519426, -24.7086939),
(2991, 'Maio', 'Maio', 40, 'CV', 'MA', 'municipality', 'municipio', 15.2272182, -23.1563014),
(2987, 'Mosteiros', 'Mosteiros', 40, 'CV', 'MO', 'municipality', 'municipio', 15.0347257, -24.3277421),
(2997, 'Paul', 'Paul', 40, 'CV', 'PA', 'municipality', 'municipio', 17.1150295, -25.0201589),
(2989, 'Porto Novo', 'Porto Novo', 40, 'CV', 'PN', 'municipality', 'municipio', 17.0193423, -25.0641922),
(2988, 'Praia', 'Praia', 40, 'CV', 'PR', 'municipality', 'municipio', 14.9481201, -23.5158945),
(2982, 'Ribeira Brava', 'Ribeira Brava', 40, 'CV', 'RB', 'municipality', 'municipio', 16.615728, -24.2982543),
(3002, 'Ribeira Grande', 'Ribeira Grande', 40, 'CV', 'RG', 'municipality', 'municipio', 17.1833547, -25.0643795),
(2984, 'Ribeira Grande de Santiago', 'Ribeira Grande de Santiago', 40, 'CV', 'RS', 'municipality', 'municipio', 14.9830298, -23.6561725),
(2998, 'Sal', 'Sal', 40, 'CV', 'SL', 'municipality', 'municipio', 16.7204556, -22.9386761),
(2985, 'Santa Catarina', 'Santa Catarina', 40, 'CV', 'CA', 'municipality', 'municipio', 15.0890754, -23.7134304),
(2995, 'Santa Catarina do Fogo', 'Santa Catarina do Fogo', 40, 'CV', 'CF', 'municipality', 'municipio', 14.9022545, -24.3212579),
(3004, 'Santa Cruz', 'Santa Cruz', 40, 'CV', 'CR', 'municipality', 'municipio', 15.1323932, -23.5576819),
(2986, 'São Domingos', 'São Domingos', 40, 'CV', 'SD', 'municipality', 'municipio', 15.0286165, -23.563922),
(3000, 'São Filipe', 'São Filipe', 40, 'CV', 'SF', 'municipality', 'municipio', 14.8951679, -24.4945636),
(2993, 'São Lourenço dos Órgãos', 'São Lourenço dos Órgãos', 40, 'CV', 'SO', 'municipality', 'municipio', 15.0709442, -23.5865131),
(2990, 'São Miguel', 'São Miguel', 40, 'CV', 'SM', 'municipality', 'municipio', 15.1899662, -23.6420486),
(5552, 'São Salvador do Mundo', 'São Salvador do Mundo', 40, 'CV', 'SS', 'municipality', 'municipio', 15.07, -23.63),
(3001, 'São Vicente', 'São Vicente', 40, 'CV', 'SV', 'municipality', 'municipio', 16.8494412, -24.9718792),
(2992, 'Sotavento Islands', 'Ilhas das Ilhas Sotavent', 40, 'CV', 'S', 'geographical region', 'región geográfica', 15.1200758, -23.6348181),
(2983, 'Tarrafal', 'Tarrafal', 40, 'CV', 'TA', 'municipality', 'municipio', 15.2760578, -23.7484077),
(3003, 'Tarrafal de São Nicolau', 'Tarrafal de São Nicolau', 40, 'CV', 'TS', 'municipality', 'municipio', 16.5636498, -24.354942);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(22003, 'Sal Rei', 2999, 40, 16.17611, -22.91722),
(21995, 'Nova Sintra', 2996, 40, 14.87139, -24.69556),
(22010, 'Vila do Maio', 2991, 40, 15.13823, -23.21158),
(21992, 'Igreja', 2987, 40, 15.03389, -24.325),
(21997, 'Pombas', 2997, 40, 17.15026, -25.02007),
(21999, 'Porto Novo', 2989, 40, 17.01969, -25.06471),
(22000, 'Praia', 2988, 40, 14.93152, -23.51254),
(22001, 'Ribeira Brava', 2982, 40, 16.61583, -24.29833),
(21998, 'Ponta do Sol', 3002, 40, 17.20171, -25.09217),
(22002, 'Ribeira Grande', 3002, 40, 17.1825, -25.065),
(21989, 'Cidade Velha', 2984, 40, 14.91531, -23.60527),
(21991, 'Espargos', 2998, 40, 16.75524, -22.9446),
(22005, 'Santa Maria', 2998, 40, 16.59796, -22.90509),
(21987, 'Assomada', 2985, 40, 15.1, -23.68333),
(21990, 'Cova Figueira', 2995, 40, 14.89054, -24.29343),
(21996, 'Pedra Badejo', 3004, 40, 15.1375, -23.53083),
(22004, 'Santa Cruz', 3004, 40, 15.13333, -23.56667),
(22006, 'São Domingos', 2986, 40, 15.02438, -23.5625),
(22007, 'São Filipe', 3000, 40, 14.8961, -24.49556),
(21993, 'João Teves', 2993, 40, 15.06694, -23.58917),
(21988, 'Calheta', 2990, 40, 15.18613, -23.59228),
(160036, 'Achada Leitão', 5552, 40, 15.08, -23.64),
(160038, 'Leitão Grande', 5552, 40, 15.075, -23.645),
(160035, 'Picos', 5552, 40, 15.083, -23.632),
(160037, 'Picos Acima', 5552, 40, 15.09, -23.63),
(21994, 'Mindelo', 3001, 40, 16.89014, -24.98042),
(22008, 'Tarrafal', 2983, 40, 15.27881, -23.75192),
(22009, 'Tarrafal de São Nicolau', 3003, 40, 16.56622, -24.35793);
