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
 * Country display names are provided in English (name) and Spanish (name_es, from the
 * source translations). JSON is compact, UTF-8, non-ASCII left unescaped. Re-runnable.
 */

'use strict';

const fs = require('fs');
const path = require('path');

const SRC = 'https://raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/json/countries%2Bstates%2Bcities.json';
const ROOT = path.resolve(__dirname, '..');

const collator = new Intl.Collator('es', { sensitivity: 'accent' });

// Large countries that get per-state drill-down files.
const LARGE_COUNTRIES = ['US', 'BR', 'MX', 'IN', 'CA', 'AU', 'RU', 'CN'];

// Curated business bundles (sets of ISO2 codes).
const BUNDLES = {
  latam: {
    name: 'Latin America',
    iso2: ['CO', 'AR', 'BO', 'BR', 'CL', 'CR', 'CU', 'EC', 'SV', 'GT', 'HN', 'MX', 'NI', 'PA', 'PY', 'PE', 'PR', 'DO', 'UY', 'VE'],
  },
  'north-america': { name: 'North America', iso2: ['US', 'CA', 'MX'] },
  'central-america': { name: 'Central America', iso2: ['BZ', 'CR', 'SV', 'GT', 'HN', 'NI', 'PA'] },
  'south-america': { name: 'South America', iso2: ['AR', 'BO', 'BR', 'CL', 'CO', 'EC', 'GY', 'PY', 'PE', 'SR', 'UY', 'VE'] },
  caribbean: { name: 'Caribbean', iso2: ['CU', 'DO', 'PR', 'HT', 'JM', 'TT', 'BS', 'BB', 'DM', 'GD', 'KN', 'LC', 'VC', 'AG'] },
};

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function slug(s) {
  return String(s || '')
    .normalize('NFD').replace(/[̀-ͯ]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

function ensureDir(dir) {
  fs.mkdirSync(dir, { recursive: true });
}

function writeJSON(file, obj) {
  fs.writeFileSync(file, JSON.stringify(obj), 'utf8');
}

function num(v) {
  if (v === null || v === undefined || v === '') return null;
  const n = Number(v);
  return Number.isFinite(n) ? n : null;
}

// Spanish country name from the source translations, falling back to English.
function spanishName(c) {
  let t = c.translations;
  if (typeof t === 'string') { try { t = JSON.parse(t); } catch (e) { t = null; } }
  if (t && typeof t === 'object' && t.es) return t.es;
  return c.name;
}

// ----- Trimmed views (JSON / YAML) -----------------------------------------

function trimCity(ci) {
  return { name: ci.name, latitude: num(ci.latitude), longitude: num(ci.longitude) };
}

function trimState(s) {
  return {
    name: s.name,
    code: s.iso2 || null,
    iso3166_2: s.iso3166_2 || null,
    type: s.type || null,
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
    subregion: c.subregion || null,
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
    subregion: c.subregion || null,
    nationality: c.nationality || null,
    population: num(c.population),
    gdp: num(c.gdp),
    latitude: num(c.latitude),
    longitude: num(c.longitude),
    emoji: c.emoji || null,
  };
}

// ----- CSV ------------------------------------------------------------------

function csvField(v) {
  if (v === null || v === undefined) return '';
  const s = String(v);
  if (/[",\n\r]/.test(s)) return '"' + s.replace(/"/g, '""') + '"';
  return s;
}

function writeCSV(file, columns, rows) {
  const out = [columns.join(',')];
  for (const r of rows) out.push(columns.map((c) => csvField(r[c])).join(','));
  fs.writeFileSync(file, out.join('\n') + '\n', 'utf8');
}

// City-level rows for a set of trimmed countries.
function cityRows(countries) {
  const rows = [];
  for (const c of countries) {
    for (const s of c.states) {
      if (!s.cities.length) {
        rows.push({
          country_iso2: c.iso2, country_name: c.name, region: c.region, subregion: c.subregion,
          state_code: s.code, state_name: s.name, city_name: '', latitude: '', longitude: '',
        });
        continue;
      }
      for (const ci of s.cities) {
        rows.push({
          country_iso2: c.iso2, country_name: c.name, region: c.region, subregion: c.subregion,
          state_code: s.code, state_name: s.name, city_name: ci.name,
          latitude: ci.latitude, longitude: ci.longitude,
        });
      }
    }
  }
  return rows;
}

const CITY_COLS = ['country_iso2', 'country_name', 'region', 'subregion', 'state_code', 'state_name', 'city_name', 'latitude', 'longitude'];

// ----- YAML (minimal block emitter) ----------------------------------------

function yamlScalar(v) {
  if (v === null || v === undefined) return 'null';
  if (typeof v === 'number' || typeof v === 'boolean') return String(v);
  return JSON.stringify(String(v)); // double-quoted is valid YAML and escapes everything
}

function yamlLines(value, indent, out) {
  const pad = '  '.repeat(indent);
  if (Array.isArray(value)) {
    if (!value.length) { out.push(pad + '[]'); return; }
    for (const item of value) {
      if (item !== null && typeof item === 'object') {
        out.push(pad + '-');
        yamlLines(item, indent + 1, out);
      } else {
        out.push(pad + '- ' + yamlScalar(item));
      }
    }
    return;
  }
  if (value !== null && typeof value === 'object') {
    const keys = Object.keys(value);
    if (!keys.length) { out.push(pad + '{}'); return; }
    for (const k of keys) {
      const v = value[k];
      if (v !== null && typeof v === 'object') {
        out.push(pad + k + ':');
        yamlLines(v, indent + 1, out);
      } else {
        out.push(pad + k + ': ' + yamlScalar(v));
      }
    }
    return;
  }
  out.push(pad + yamlScalar(value));
}

function writeYAML(file, obj) {
  const out = [];
  yamlLines(obj, 0, out);
  fs.writeFileSync(file, out.join('\n') + '\n', 'utf8');
}

// ----- SQL (scoped CREATE + INSERT, using original ids) --------------------

const SQL_SCHEMA = [
  'CREATE TABLE IF NOT EXISTS countries (',
  '  id INTEGER PRIMARY KEY, name VARCHAR(100), iso2 CHAR(2), iso3 CHAR(3),',
  '  region VARCHAR(100), subregion VARCHAR(100), capital VARCHAR(100),',
  '  currency VARCHAR(255), latitude DECIMAL(10,8), longitude DECIMAL(11,8), emoji VARCHAR(16)',
  ');',
  'CREATE TABLE IF NOT EXISTS states (',
  '  id INTEGER PRIMARY KEY, name VARCHAR(255), country_id INTEGER, country_code CHAR(2),',
  '  state_code VARCHAR(10), type VARCHAR(191), latitude DECIMAL(10,8), longitude DECIMAL(11,8)',
  ');',
  'CREATE TABLE IF NOT EXISTS cities (',
  '  id INTEGER PRIMARY KEY, name VARCHAR(255), state_id INTEGER, country_id INTEGER,',
  '  latitude DECIMAL(10,8), longitude DECIMAL(11,8)',
  ');',
  '',
].join('\n');

function sqlStr(v) {
  if (v === null || v === undefined || v === '') return 'NULL';
  return "'" + String(v).replace(/'/g, "''") + "'";
}

function sqlNum(v) {
  const n = num(v);
  return n === null ? 'NULL' : String(n);
}

function flushInserts(table, cols, valuesArr, out) {
  const CHUNK = 500;
  for (let i = 0; i < valuesArr.length; i += CHUNK) {
    const chunk = valuesArr.slice(i, i + CHUNK);
    out.push(`INSERT INTO ${table} (${cols.join(', ')}) VALUES\n` + chunk.join(',\n') + ';');
  }
}

// Takes the RAW country objects (with ids) in scope.
function writeSQL(file, rawCountries) {
  const out = [SQL_SCHEMA];
  const cV = [], sV = [], ciV = [];
  for (const c of rawCountries) {
    cV.push(`(${c.id}, ${sqlStr(c.name)}, ${sqlStr(c.iso2)}, ${sqlStr(c.iso3)}, ${sqlStr(c.region)}, ${sqlStr(c.subregion)}, ${sqlStr(c.capital)}, ${sqlStr(c.currency)}, ${sqlNum(c.latitude)}, ${sqlNum(c.longitude)}, ${sqlStr(c.emoji)})`);
    for (const s of (c.states || [])) {
      sV.push(`(${s.id}, ${sqlStr(s.name)}, ${c.id}, ${sqlStr(c.iso2)}, ${sqlStr(s.iso2)}, ${sqlStr(s.type)}, ${sqlNum(s.latitude)}, ${sqlNum(s.longitude)})`);
      for (const ci of (s.cities || [])) {
        ciV.push(`(${ci.id}, ${sqlStr(ci.name)}, ${s.id}, ${c.id}, ${sqlNum(ci.latitude)}, ${sqlNum(ci.longitude)})`);
      }
    }
  }
  flushInserts('countries', ['id', 'name', 'iso2', 'iso3', 'region', 'subregion', 'capital', 'currency', 'latitude', 'longitude', 'emoji'], cV, out);
  out.push('');
  flushInserts('states', ['id', 'name', 'country_id', 'country_code', 'state_code', 'type', 'latitude', 'longitude'], sV, out);
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
  const raw = await res.json();
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
  const regionsIndex = {};
  for (const [region, list] of regionGroups) {
    const s = slug(region);
    regionsIndex[region] = {
      slug: s, countries: list.length,
      cities: list.reduce((a, c) => a + c.states.reduce((b, st) => b + (st.cities || []).length, 0), 0),
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
  const subIndex = {};
  for (const [subregion, list] of subGroups) {
    const s = slug(subregion);
    subIndex[subregion] = { slug: s, region: list[0].region || null, countries: list.length };
    emitFull(path.join(dirs.subregions, s), list.map((c) => trimmedByIso2.get(c.iso2)), list);
    files += 4;
  }
  console.log('subregions/ done:', Object.keys(subIndex).length);

  // 4) Curated bundles.
  const bundlesIndex = {};
  for (const [bslug, def] of Object.entries(BUNDLES)) {
    const rawList = def.iso2.map((i) => byIso2.get(i)).filter(Boolean);
    const missing = def.iso2.filter((i) => !byIso2.has(i));
    if (missing.length) console.log('  bundle', bslug, 'missing', missing.join(','));
    bundlesIndex[bslug] = { name: def.name, countries: rawList.map((c) => c.iso2) };
    emitFull(
      path.join(dirs.bundles, bslug),
      rawList.map((c) => trimmedByIso2.get(c.iso2)),
      rawList,
      (countries) => ({ bundle: bslug, name: def.name, countries }),
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
    for (const s of (c.states || [])) {
      const sslug = slug(s.name) || slug(s.iso2) || ('state-' + s.id);
      const cities = (s.cities || []).map(trimCity);
      writeJSON(path.join(dirCountry, sslug + '.json'), {
        country_iso2: iso2, country_name: c.name,
        state: s.name, state_code: s.iso2 || null, iso3166_2: s.iso3166_2 || null, type: s.type || null,
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
  const metaCols = ['name', 'name_es', 'native', 'iso2', 'iso3', 'numeric_code', 'phonecode', 'capital', 'currency', 'currency_name', 'currency_symbol', 'tld', 'region', 'subregion', 'nationality', 'population', 'gdp', 'latitude', 'longitude', 'emoji'];
  writeJSON(path.join(dirs.metadata, 'countries.json'), meta);
  writeYAML(path.join(dirs.metadata, 'countries.yml'), meta);
  writeCSV(path.join(dirs.metadata, 'countries.csv'), metaCols, meta);

  const index = {};
  for (const c of raw) index[c.iso2] = { name: c.name, name_es: spanishName(c), iso3: c.iso3, region: c.region || null, subregion: c.subregion || null };
  writeJSON(path.join(dirs.metadata, 'index.json'), index);

  // regions.json: region -> subregion -> [iso2]
  const regTree = {};
  for (const c of raw) {
    const r = c.region || 'No region';
    const sr = c.subregion || 'No subregion';
    regTree[r] = regTree[r] || {};
    regTree[r][sr] = regTree[r][sr] || [];
    regTree[r][sr].push(c.iso2);
  }
  writeJSON(path.join(dirs.metadata, 'regions.json'), { tree: regTree, index: regionsIndex, subregions: subIndex });
  writeJSON(path.join(dirs.metadata, 'bundles.json'), bundlesIndex);
  files += 5;
  console.log('metadata/ done.');

  const totalCities = raw.reduce((a, c) => a + c.states.reduce((b, s) => b + (s.cities || []).length, 0), 0);
  console.log(`\nSummary: ${raw.length} countries, ${totalCities} cities, ~${files} files generated.`);
}

main().catch((err) => {
  console.error('ERROR:', err.message);
  process.exit(1);
});
