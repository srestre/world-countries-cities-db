#!/usr/bin/env node
/*
 * build.js
 * Builds a worldwide countries / states / cities database, SPLIT into granular pieces
 * and several formats, so you can request only what you need (one country, one region,
 * one subregion or a business bundle) without downloading the full ~47MB world file.
 *
 * Source: dr5hn/countries-states-cities-database (Darshan Gada), under ODbL.
 *   json/countries+states+cities.json  (full hierarchy, ~47MB)
 *
 * Generated call levels (each one an independent file):
 *   /countries/<ISO2>.{json,csv,sql,yml}              one country (hierarchical)
 *   /regions/<slug>.{json,csv,sql,yml}                one dr5hn region
 *   /subregions/<slug>.{json,csv,sql,yml}             one subregion
 *   /bundles/<slug>.{json,csv,sql,yml}                curated business groups (latam, ...)
 *   /flat-cities/<ISO2>.{json,csv}                    flat array of city names
 *   /large-countries/<ISO2>/states/<slug>.{json,csv}  per-state drill-down
 *   /metadata/{countries,index,regions,bundles}.*     country metadata and indexes
 *
 * Bilingual: country names (name / name_es), region/subregion names (region_es /
 * subregion_es), state type (type / type_es) plus the state local name (native), and
 * bundle names (name / name_es). City names are proper nouns (single form). Structure,
 * slugs, keys and code stay in English. JSON is compact, UTF-8, non-ASCII left unescaped.
 * Re-runnable.
 *
 * SPDX-License-Identifier: MIT
 * Copyright (c) 2026 srestre. Code under MIT (LICENSE-CODE); data under ODbL (LICENSE).
 */

'use strict';

const fs = require('fs');
const path = require('path');

const {
  slug, num, ensureDir, writeJSON, csvField, writeCSV,
  yamlScalar, yamlLines, writeYAML, sqlStr, sqlNum, sqlId, flushInserts,
} = require('./lib/format.js');
const { BUNDLES } = require('./lib/groups.js');

const SRC = 'https://raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/json/countries%2Bstates%2Bcities.json';
const ROOT = path.resolve(__dirname, '..');

const collator = new Intl.Collator('es', { sensitivity: 'accent' });

// Large countries that get per-state drill-down files.
const LARGE_COUNTRIES = ['US', 'BR', 'MX', 'IN', 'CA', 'AU', 'RU', 'CN'];

// Region names in Spanish.
const REGION_ES = {
  'Asia': 'Asia',
  'Europe': 'Europa',
  'Africa': 'África',
  'Oceania': 'Oceanía',
  'Americas': 'América',
  'Polar': 'Regiones polares',
};

// Subregion names in Spanish (the 22 dr5hn subregions).
const SUBREGION_ES = {
  'Australia and New Zealand': 'Australia y Nueva Zelanda',
  'Caribbean': 'Caribe',
  'Central America': 'Centroamérica',
  'Central Asia': 'Asia Central',
  'Eastern Africa': 'África Oriental',
  'Eastern Asia': 'Asia Oriental',
  'Eastern Europe': 'Europa Oriental',
  'Melanesia': 'Melanesia',
  'Micronesia': 'Micronesia',
  'Middle Africa': 'África Central',
  'Northern Africa': 'África del Norte',
  'Northern America': 'Norteamérica',
  'Northern Europe': 'Europa del Norte',
  'Polynesia': 'Polinesia',
  'South America': 'Sudamérica',
  'South-Eastern Asia': 'Sudeste Asiático',
  'Southern Africa': 'África Austral',
  'Southern Asia': 'Asia del Sur',
  'Southern Europe': 'Europa del Sur',
  'Western Africa': 'África Occidental',
  'Western Asia': 'Asia Occidental',
  'Western Europe': 'Europa Occidental',
};

// State / province type in Spanish (101 distinct dr5hn types). Unknown -> original.
const STATE_TYPE_ES = {
  'European collectivity': 'colectividad europea',
  'Special region': 'región especial',
  'administered area': 'área administrada',
  'administration': 'administración',
  'administrative atoll': 'atolón administrativo',
  'administrative precinct': 'distrito administrativo',
  'administrative region': 'región administrativa',
  'administrative territory': 'territorio administrativo',
  'arctic region': 'región ártica',
  'area': 'área',
  'atoll': 'atolón',
  'autonomous city': 'ciudad autónoma',
  'autonomous community': 'comunidad autónoma',
  'autonomous district': 'distrito autónomo',
  'autonomous municipality': 'municipio autónomo',
  'autonomous province': 'provincia autónoma',
  'autonomous region': 'región autónoma',
  'autonomous republic': 'república autónoma',
  'autonomous sector': 'sector autónomo',
  'autonomous territorial unit': 'unidad territorial autónoma',
  'borough': 'distrito',
  'canton': 'cantón',
  'capital city': 'ciudad capital',
  'capital district': 'distrito capital',
  'capital territory': 'territorio capital',
  'chain': 'archipiélago',
  'city': 'ciudad',
  'city municipality': 'municipio urbano',
  'city with county rights': 'ciudad con rango de condado',
  'commune': 'comuna',
  'council area': 'área de consejo',
  'country': 'país',
  'county': 'condado',
  'decentralized regional entity': 'entidad regional descentralizada',
  'department': 'departamento',
  'dependency': 'dependencia',
  'district': 'distrito',
  'district municipality': 'municipio distrital',
  'districts under republic administration': 'distritos bajo administración de la república',
  'division': 'división',
  'economic prefecture': 'prefectura económica',
  'emirate': 'emirato',
  'entity': 'entidad',
  'federal capital territory': 'territorio de la capital federal',
  'federal dependency': 'dependencia federal',
  'federal district': 'distrito federal',
  'federal territory': 'territorio federal',
  'free municipal consortium': 'consorcio municipal libre',
  'geographical region': 'región geográfica',
  'geographical unit': 'unidad geográfica',
  'governorate': 'gobernación',
  'indigenous region': 'región indígena',
  'island': 'isla',
  'island council': 'consejo insular',
  'land': 'estado federado',
  'local council': 'consejo local',
  'london borough': 'distrito de Londres',
  'metropolitan administration': 'administración metropolitana',
  'metropolitan city': 'ciudad metropolitana',
  'metropolitan collectivity with special status': 'colectividad metropolitana con estatus especial',
  'metropolitan department': 'departamento metropolitano',
  'metropolitan district': 'distrito metropolitano',
  'metropolitan region': 'región metropolitana',
  'military postal region': 'región postal militar',
  'municipality': 'municipio',
  'oblast': 'óblast',
  'outlying area': 'área periférica',
  'overseas collectivity': 'colectividad de ultramar',
  'overseas collectivity with special status': 'colectividad de ultramar con estatus especial',
  'overseas region': 'región de ultramar',
  'overseas territory': 'territorio de ultramar',
  'parish': 'parroquia',
  'popularate': 'popularate',
  'prefecture': 'prefectura',
  'province': 'provincia',
  'quarter': 'distrito',
  'region': 'región',
  'regional unit': 'unidad regional',
  'republic': 'república',
  'rural municipality': 'municipio rural',
  'sheadings': 'sheadings',
  'special administrative region': 'región administrativa especial',
  'special city': 'ciudad especial',
  'special island authority': 'autoridad insular especial',
  'special municipality': 'municipio especial',
  'special self-governing city': 'ciudad autónoma especial',
  'special self-governing province': 'provincia autónoma especial',
  'state': 'estado',
  'state city': 'ciudad-estado',
  'territorial unit': 'unidad territorial',
  'territory': 'territorio',
  'town': 'población',
  'town council': 'consejo de localidad',
  'two-tier county': 'condado de dos niveles',
  'union territory': 'territorio de la unión',
  'unitary authority': 'autoridad unitaria',
  'urban community': 'comunidad urbana',
  'urban municipality': 'municipio urbano',
  'village': 'aldea',
  'voivodship': 'voivodato',
  'ward': 'distrito',
};

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

// Spanish country name from the source translations, falling back to English.
function spanishName(c) {
  let t = c.translations;
  if (typeof t === 'string') { try { t = JSON.parse(t); } catch (e) { t = null; } }
  if (t && typeof t === 'object' && t.es) return t.es;
  return c.name;
}

function regionEs(r) { return r ? (REGION_ES[r] || r) : null; }
function subregionEs(sr) { return sr ? (SUBREGION_ES[sr] || sr) : null; }
function typeEs(t) { return t ? (STATE_TYPE_ES[t] || t) : null; }

// ----- Trimmed views (JSON / YAML) -----------------------------------------

function trimCity(ci) {
  return { name: ci.name, latitude: num(ci.latitude), longitude: num(ci.longitude) };
}

function trimState(s) {
  return {
    name: s.name,
    native: s.native || null,
    code: s.iso2 || null,
    iso3166_2: s.iso3166_2 || null,
    type: s.type || null,
    type_es: typeEs(s.type),
    latitude: num(s.latitude),
    longitude: num(s.longitude),
    cities: (s.cities || []).map(trimCity),
  };
}

function trimCountry(c) {
  return {
    name: c.name,
    name_es: spanishName(c),
    native: c.native || null,
    iso2: c.iso2,
    iso3: c.iso3,
    numeric_code: c.numeric_code || null,
    phonecode: c.phonecode || null,
    capital: c.capital || null,
    currency: c.currency || null,
    currency_name: c.currency_name || null,
    currency_symbol: c.currency_symbol || null,
    tld: c.tld || null,
    region: c.region || null,
    region_es: regionEs(c.region),
    subregion: c.subregion || null,
    subregion_es: subregionEs(c.subregion),
    latitude: num(c.latitude),
    longitude: num(c.longitude),
    emoji: c.emoji || null,
    states: (c.states || []).map(trimState),
  };
}

function countryMeta(c) {
  return {
    name: c.name,
    name_es: spanishName(c),
    native: c.native || null,
    iso2: c.iso2,
    iso3: c.iso3,
    numeric_code: c.numeric_code || null,
    phonecode: c.phonecode || null,
    capital: c.capital || null,
    currency: c.currency || null,
    currency_name: c.currency_name || null,
    currency_symbol: c.currency_symbol || null,
    tld: c.tld || null,
    region: c.region || null,
    region_es: regionEs(c.region),
    subregion: c.subregion || null,
    subregion_es: subregionEs(c.subregion),
    nationality: c.nationality || null,
    population: num(c.population),
    gdp: num(c.gdp),
    latitude: num(c.latitude),
    longitude: num(c.longitude),
    emoji: c.emoji || null,
  };
}

// ----- CSV ------------------------------------------------------------------

// City-level rows for a set of trimmed countries (bilingual columns).
function cityRows(countries) {
  const rows = [];
  for (const c of countries) {
    for (const s of c.states) {
      const base = {
        country_iso2: c.iso2, country_name: c.name, country_name_es: c.name_es,
        region: c.region, region_es: c.region_es, subregion: c.subregion, subregion_es: c.subregion_es,
        state_code: s.code, state_name: s.name, state_type: s.type, state_type_es: s.type_es,
      };
      if (!s.cities.length) {
        rows.push({ ...base, city_name: '', latitude: '', longitude: '' });
        continue;
      }
      for (const ci of s.cities) {
        rows.push({ ...base, city_name: ci.name, latitude: ci.latitude, longitude: ci.longitude });
      }
    }
  }
  return rows;
}

const CITY_COLS = ['country_iso2', 'country_name', 'country_name_es', 'region', 'region_es', 'subregion', 'subregion_es', 'state_code', 'state_name', 'state_type', 'state_type_es', 'city_name', 'latitude', 'longitude'];

// ----- SQL (scoped CREATE + INSERT, using original ids) --------------------

const SQL_SCHEMA = [
  'CREATE TABLE IF NOT EXISTS countries (',
  '  id INTEGER PRIMARY KEY, name VARCHAR(100), name_es VARCHAR(100), iso2 CHAR(2), iso3 CHAR(3),',
  '  region VARCHAR(100), region_es VARCHAR(100), subregion VARCHAR(100), subregion_es VARCHAR(100),',
  '  capital VARCHAR(100), currency VARCHAR(255), latitude DECIMAL(10,8), longitude DECIMAL(11,8), emoji VARCHAR(16)',
  ');',
  'CREATE TABLE IF NOT EXISTS states (',
  '  id INTEGER PRIMARY KEY, name VARCHAR(255), native VARCHAR(255), country_id INTEGER, country_code CHAR(2),',
  '  state_code VARCHAR(10), type VARCHAR(191), type_es VARCHAR(191), latitude DECIMAL(10,8), longitude DECIMAL(11,8)',
  ');',
  'CREATE TABLE IF NOT EXISTS cities (',
  '  id INTEGER PRIMARY KEY, name VARCHAR(255), state_id INTEGER, country_id INTEGER,',
  '  latitude DECIMAL(10,8), longitude DECIMAL(11,8)',
  ');',
  '',
].join('\n');

// Takes the RAW country objects (with ids) in scope.
function writeSQL(file, rawCountries) {
  const out = [SQL_SCHEMA];
  const cV = [], sV = [], ciV = [];
  for (const c of rawCountries) {
    cV.push(`(${sqlId(c.id)}, ${sqlStr(c.name)}, ${sqlStr(spanishName(c))}, ${sqlStr(c.iso2)}, ${sqlStr(c.iso3)}, ${sqlStr(c.region)}, ${sqlStr(regionEs(c.region))}, ${sqlStr(c.subregion)}, ${sqlStr(subregionEs(c.subregion))}, ${sqlStr(c.capital)}, ${sqlStr(c.currency)}, ${sqlNum(c.latitude)}, ${sqlNum(c.longitude)}, ${sqlStr(c.emoji)})`);
    for (const s of (c.states || [])) {
      sV.push(`(${sqlId(s.id)}, ${sqlStr(s.name)}, ${sqlStr(s.native)}, ${sqlId(c.id)}, ${sqlStr(c.iso2)}, ${sqlStr(s.iso2)}, ${sqlStr(s.type)}, ${sqlStr(typeEs(s.type))}, ${sqlNum(s.latitude)}, ${sqlNum(s.longitude)})`);
      for (const ci of (s.cities || [])) {
        ciV.push(`(${sqlId(ci.id)}, ${sqlStr(ci.name)}, ${sqlId(s.id)}, ${sqlId(c.id)}, ${sqlNum(ci.latitude)}, ${sqlNum(ci.longitude)})`);
      }
    }
  }
  flushInserts('countries', ['id', 'name', 'name_es', 'iso2', 'iso3', 'region', 'region_es', 'subregion', 'subregion_es', 'capital', 'currency', 'latitude', 'longitude', 'emoji'], cV, out);
  out.push('');
  flushInserts('states', ['id', 'name', 'native', 'country_id', 'country_code', 'state_code', 'type', 'type_es', 'latitude', 'longitude'], sV, out);
  out.push('');
  flushInserts('cities', ['id', 'name', 'state_id', 'country_id', 'latitude', 'longitude'], ciV, out);
  fs.writeFileSync(file, out.join('\n') + '\n', 'utf8');
}

// ----- Flat cities (dedup + locale sort) -----------------------------------

function flatCities(rawCountry) {
  const seen = new Map();
  for (const s of (rawCountry.states || [])) {
    for (const ci of (s.cities || [])) {
      const name = String(ci.name || '').trim();
      if (!name) continue;
      const key = name.toLocaleLowerCase('es');
      if (!seen.has(key)) seen.set(key, name);
    }
  }
  return Array.from(seen.values()).sort((a, b) => collator.compare(a, b));
}

// ---------------------------------------------------------------------------
// Per-scope file emitters
// ---------------------------------------------------------------------------

// Full multi-format (JSON+CSV+SQL+YAML) for a set of countries.
function emitFull(baseNoExt, trimmedCountries, rawCountries, wrapObj) {
  const jsonPayload = wrapObj ? wrapObj(trimmedCountries) : trimmedCountries;
  writeJSON(baseNoExt + '.json', jsonPayload);
  writeYAML(baseNoExt + '.yml', jsonPayload);
  writeCSV(baseNoExt + '.csv', CITY_COLS, cityRows(trimmedCountries));
  writeSQL(baseNoExt + '.sql', rawCountries);
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  console.log('Downloading dr5hn dataset (~47MB)...');
  const res = await fetch(SRC);
  if (!res.ok) throw new Error('Source download failed: HTTP ' + res.status);
  const fetched = await res.json();
  // Path-safety guard: iso2 is used to build filenames. Drop any entry whose iso2 is not
  // two ASCII letters so a poisoned upstream value cannot escape the output directory.
  const raw = Array.isArray(fetched) ? fetched.filter((c) => c && /^[A-Za-z]{2}$/.test(c.iso2 || '')) : [];
  if (Array.isArray(fetched) && raw.length !== fetched.length) {
    console.warn(`Skipped ${fetched.length - raw.length} entr(ies) with unsafe/invalid iso2.`);
  }
  console.log('Countries:', raw.length);

  const byIso2 = new Map(raw.map((c) => [c.iso2, c]));
  const trimmedByIso2 = new Map(raw.map((c) => [c.iso2, trimCountry(c)]));

  const dirs = {
    countries: path.join(ROOT, 'countries'),
    regions: path.join(ROOT, 'regions'),
    subregions: path.join(ROOT, 'subregions'),
    bundles: path.join(ROOT, 'bundles'),
    flat: path.join(ROOT, 'flat-cities'),
    large: path.join(ROOT, 'large-countries'),
    metadata: path.join(ROOT, 'metadata'),
  };
  Object.values(dirs).forEach(ensureDir);

  let files = 0;

  // 1) Per country (hierarchical, multi-format) + flat cities.
  for (const c of raw) {
    const t = trimmedByIso2.get(c.iso2);
    emitFull(path.join(dirs.countries, c.iso2), [t], [c]);
    files += 4;
    const flat = flatCities(c);
    writeJSON(path.join(dirs.flat, c.iso2 + '.json'), flat);
    writeCSV(path.join(dirs.flat, c.iso2 + '.csv'), ['city'], flat.map((x) => ({ city: x })));
    files += 2;
  }
  console.log('countries/ and flat-cities/ done.');

  // 2) Per region.
  const regionGroups = new Map();
  for (const c of raw) {
    const r = c.region || '';
    if (!r) continue;
    if (!regionGroups.has(r)) regionGroups.set(r, []);
    regionGroups.get(r).push(c);
  }
  const regionsIndex = Object.create(null); // null-proto: keys come from upstream (anti prototype-pollution)
  for (const [region, list] of regionGroups) {
    const s = slug(region);
    regionsIndex[region] = {
      slug: s, name_es: regionEs(region), countries: list.length,
      cities: list.reduce((a, c) => a + (c.states || []).reduce((b, st) => b + (st.cities || []).length, 0), 0),
    };
    emitFull(path.join(dirs.regions, s), list.map((c) => trimmedByIso2.get(c.iso2)), list);
    files += 4;
  }
  console.log('regions/ done:', Object.keys(regionsIndex).length);

  // 3) Per subregion.
  const subGroups = new Map();
  for (const c of raw) {
    const sr = c.subregion || '';
    if (!sr) continue;
    if (!subGroups.has(sr)) subGroups.set(sr, []);
    subGroups.get(sr).push(c);
  }
  const subIndex = Object.create(null); // null-proto (anti prototype-pollution)
  for (const [subregion, list] of subGroups) {
    const s = slug(subregion);
    subIndex[subregion] = { slug: s, name_es: subregionEs(subregion), region: list[0].region || null, region_es: regionEs(list[0].region), countries: list.length };
    emitFull(path.join(dirs.subregions, s), list.map((c) => trimmedByIso2.get(c.iso2)), list);
    files += 4;
  }
  console.log('subregions/ done:', Object.keys(subIndex).length);

  // 4) Curated bundles.
  const bundlesIndex = Object.create(null); // null-proto (anti prototype-pollution)
  for (const [bslug, def] of Object.entries(BUNDLES)) {
    const rawList = def.iso2.map((i) => byIso2.get(i)).filter(Boolean);
    const missing = def.iso2.filter((i) => !byIso2.has(i));
    if (missing.length) console.log('  bundle', bslug, 'missing', missing.join(','));
    bundlesIndex[bslug] = { name: def.name, name_es: def.name_es, countries: rawList.map((c) => c.iso2) };
    emitFull(
      path.join(dirs.bundles, bslug),
      rawList.map((c) => trimmedByIso2.get(c.iso2)),
      rawList,
      (countries) => ({ bundle: bslug, name: def.name, name_es: def.name_es, countries }),
    );
    files += 4;
  }
  console.log('bundles/ done:', Object.keys(bundlesIndex).length);

  // 5) Per-state drill-down for large countries (JSON + CSV).
  for (const iso2 of LARGE_COUNTRIES) {
    const c = byIso2.get(iso2);
    if (!c) continue;
    const dirCountry = path.join(dirs.large, iso2, 'states');
    ensureDir(dirCountry);
    const usedSlugs = new Set();
    for (const s of (c.states || [])) {
      let sslug = slug(s.name) || slug(s.iso2) || ('state-' + s.id);
      if (usedSlugs.has(sslug)) {
        // Two states slug to the same name (e.g. RU Altai Krai vs Altai Republic):
        // disambiguate with the state code/id so neither file is overwritten.
        sslug += '-' + (slug(s.iso2) || ('id-' + s.id));
      }
      usedSlugs.add(sslug);
      const cities = (s.cities || []).map(trimCity);
      writeJSON(path.join(dirCountry, sslug + '.json'), {
        country_iso2: iso2, country_name: c.name, country_name_es: spanishName(c),
        state: s.name, native: s.native || null, state_code: s.iso2 || null, iso3166_2: s.iso3166_2 || null,
        type: s.type || null, type_es: typeEs(s.type),
        cities,
      });
      writeCSV(path.join(dirCountry, sslug + '.csv'), ['city_name', 'latitude', 'longitude'],
        cities.map((ci) => ({ city_name: ci.name, latitude: ci.latitude, longitude: ci.longitude })));
      files += 2;
    }
  }
  console.log('large-countries/ done:', LARGE_COUNTRIES.join(','));

  // 6) Metadata and indexes (multi-format where it applies).
  const meta = raw.map(countryMeta).sort((a, b) => collator.compare(a.name, b.name));
  const metaCols = ['name', 'name_es', 'native', 'iso2', 'iso3', 'numeric_code', 'phonecode', 'capital', 'currency', 'currency_name', 'currency_symbol', 'tld', 'region', 'region_es', 'subregion', 'subregion_es', 'nationality', 'population', 'gdp', 'latitude', 'longitude', 'emoji'];
  writeJSON(path.join(dirs.metadata, 'countries.json'), meta);
  writeYAML(path.join(dirs.metadata, 'countries.yml'), meta);
  writeCSV(path.join(dirs.metadata, 'countries.csv'), metaCols, meta);

  const index = Object.create(null); // null-proto: keyed by upstream iso2 (anti prototype-pollution)
  for (const c of raw) {
    index[c.iso2] = {
      name: c.name, name_es: spanishName(c), iso3: c.iso3,
      region: c.region || null, region_es: regionEs(c.region),
      subregion: c.subregion || null, subregion_es: subregionEs(c.subregion),
    };
  }
  writeJSON(path.join(dirs.metadata, 'index.json'), index);

  // regions.json: region -> subregion -> [iso2]
  const regTree = Object.create(null); // null-proto: keys are upstream region/subregion (anti prototype-pollution)
  for (const c of raw) {
    const r = c.region || 'No region';
    const sr = c.subregion || 'No subregion';
    regTree[r] = regTree[r] || Object.create(null);
    regTree[r][sr] = regTree[r][sr] || [];
    regTree[r][sr].push(c.iso2);
  }
  writeJSON(path.join(dirs.metadata, 'regions.json'), { tree: regTree, index: regionsIndex, subregions: subIndex });
  writeJSON(path.join(dirs.metadata, 'bundles.json'), bundlesIndex);
  files += 5;
  console.log('metadata/ done.');

  const totalCities = raw.reduce((a, c) => a + (c.states || []).reduce((b, s) => b + (s.cities || []).length, 0), 0);
  console.log(`\nSummary: ${raw.length} countries, ${totalCities} cities, ~${files} files generated.`);
}

main().catch((err) => {
  console.error('ERROR:', err.message);
  process.exit(1);
});
