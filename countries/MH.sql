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
(137, 'Marshall Islands', 'Islas Marshall', 'MH', 'MHL', 'Oceania', 'Oceanía', 'Micronesia', 'Micronesia', 'Majuro', 'USD', 9, 168, '🇲🇭');

INSERT INTO states (id, name, native, country_id, country_code, state_code, type, type_es, latitude, longitude) VALUES
(5643, 'Ailinglaplap', 'Ailinglaplap', 137, 'MH', 'ALL', 'municipality', 'municipio', 7.5, 168.73333333),
(5644, 'Ailuk', 'Ailuk', 137, 'MH', 'ALK', 'municipality', 'municipio', 10.31666667, 169.93333333),
(5645, 'Arno', 'Arno', 137, 'MH', 'ARN', 'municipality', 'municipio', 7.08333333, 171.7),
(5646, 'Aur', 'Aur', 137, 'MH', 'AUR', 'municipality', 'municipio', 8.2, 171.1),
(5647, 'Bikini & Kili', 'Bikini & Kili', 137, 'MH', 'KIL', 'municipality', 'municipio', 11.6, 165.4),
(5648, 'Ebon', 'Ebon', 137, 'MH', 'EBO', 'municipality', 'municipio', 4.63333333, 168.71666667),
(5649, 'Enewetak & Ujelang', 'Enewetak & Ujelang', 137, 'MH', 'ENI', 'municipality', 'municipio', 11.5, 162.33333333),
(5650, 'Jabat', 'Jabat', 137, 'MH', 'JAB', 'municipality', 'municipio', 7.75, 168.96666667),
(5651, 'Jaluit', 'Jaluit', 137, 'MH', 'JAL', 'municipality', 'municipio', 6, 169.56666667),
(5652, 'Kwajalein', 'Kwajalein', 137, 'MH', 'KWA', 'municipality', 'municipio', 8.71666667, 167.73333333),
(5653, 'Lae', 'Lae', 137, 'MH', 'LAE', 'municipality', 'municipio', 8.93611111, 166.2375),
(5654, 'Lib', 'Lib', 137, 'MH', 'LIB', 'municipality', 'municipio', 8.31305556, 167.37777778),
(5655, 'Likiep', 'Likiep', 137, 'MH', 'LIK', 'municipality', 'municipio', 9.88498, 169.14345),
(5656, 'Majuro', 'Majuro', 137, 'MH', 'MAJ', 'municipality', 'municipio', 7.0918, 171.3802),
(5657, 'Maloelap', 'Maloelap', 137, 'MH', 'MAL', 'municipality', 'municipio', 8.75343611, 171.04888889),
(5658, 'Mejit', 'Mejit', 137, 'MH', 'MEJ', 'municipality', 'municipio', 10.28333333, 170.88333333),
(5659, 'Mili', 'Mili', 137, 'MH', 'MIL', 'municipality', 'municipio', 6.12621667, 171.97998056),
(5660, 'Namdrik', 'Namdrik', 137, 'MH', 'NMK', 'municipality', 'municipio', 5.61666667, 168.11666667),
(5661, 'Namu', 'Namu', 137, 'MH', 'NMU', 'municipality', 'municipio', 7.98333333, 168.17361111),
(2574, 'Ralik', 'Titled', 137, 'MH', 'L', 'chain', 'archipiélago', 8.230817, 167.7953224),
(2573, 'Ratak', 'Ratak', 137, 'MH', 'T', 'chain', 'archipiélago', 8.615055, 170.8205547),
(5662, 'Rongelap', 'Rongelap', 137, 'MH', 'RON', 'municipality', 'municipio', 11.31666667, 166.78333333),
(5663, 'Ujae', 'Ujae', 137, 'MH', 'UJA', 'municipality', 'municipio', 9.05, 165.65),
(5664, 'Utrik', 'Utrik', 137, 'MH', 'UTI', 'municipality', 'municipio', 11.26730556, 169.78426111),
(5665, 'Wotho', 'Wotho', 137, 'MH', 'WTH', 'municipality', 'municipio', 10.1, 165.96666667),
(5666, 'Wotje', 'Wotje', 137, 'MH', 'WTJ', 'municipality', 'municipio', 9.43333333, 170.01666667);

INSERT INTO cities (id, name, state_id, country_id, latitude, longitude) VALUES
(160070, 'Ailinglaplap', 5643, 137, 7.5, 168.73333333),
(160071, 'Ailuk', 5644, 137, 10.31666667, 169.93333333),
(160072, 'Arno', 5645, 137, 7.08333333, 171.7),
(160073, 'Aur', 5646, 137, 8.2, 171.1),
(160074, 'Bikini', 5647, 137, 11.6, 165.4),
(160081, 'Kili', 5647, 137, 5.61666667, 169.11666667),
(160077, 'Ebon', 5648, 137, 4.63333333, 168.71666667),
(160078, 'Enewetak', 5649, 137, 11.5, 162.33333333),
(160092, 'Ujelang', 5649, 137, 9.82222222, 160.9),
(160079, 'Jabat', 5650, 137, 7.75, 168.96666667),
(160080, 'Jabor', 5651, 137, 6, 169.56666667),
(160076, 'Ebeye', 5652, 137, 41.0811, -111.92),
(160082, 'Lae', 5653, 137, 8.93611111, 166.2375),
(160083, 'Lib', 5654, 137, 8.31305556, 167.37777778),
(160084, 'Likiep', 5655, 137, 9.88498, 169.14345),
(160075, 'Delap-Uliga-Djarrit', 5656, 137, 7.08333333, 171.38333333),
(160090, 'Taroa', 5657, 137, 48, 33.41666667),
(160085, 'Mejit', 5658, 137, 10.28333333, 170.88333333),
(160086, 'Mili', 5659, 137, 6.12621667, 171.97998056),
(160087, 'Namdrik', 5660, 137, 5.61666667, 168.11666667),
(160088, 'Namu', 5661, 137, 7.98333333, 168.17361111),
(160089, 'Rongelap', 5662, 137, 11.31666667, 166.78333333),
(160091, 'Ujae', 5663, 137, 9.05, 165.65),
(160093, 'Utrik', 5664, 137, 11.26730556, 169.78426111),
(160094, 'Wotho', 5665, 137, 10.1, 165.96666667),
(160095, 'Wotje', 5666, 137, 9.43333333, 170.01666667);
