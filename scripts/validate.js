#!/usr/bin/env node
/*
 * validate.js
 * Integrity check for the generated data. Run it after build.js / build-latam.js to make
 * sure a regeneration did not silently break anything (e.g. a slug collision overwriting
 * a file, a stale format, a missing Spanish label).
 *
 * Zero dependencies, Node.js v20+. Exits with code 1 if any ERROR is found (so it can gate
 * a commit or CI), 0 otherwise. WARNINGS never fail the run.
 *
 * Checks: JSON parses + is compact, CSV field counts match the header (quote-aware),
 * SQL has the schema + inserts, YAML is structurally sane, no slug collisions, cross-format
 * city counts agree, bilingual labels are complete, and no file exceeds the GitHub limit.
 *
 * SPDX-License-Identifier: MIT
 * Copyright (c) 2026 srestre. Code under MIT (LICENSE-CODE); data under ODbL (LICENSE).
 */

'use strict';

const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const MAX_FILE_BYTES = 100 * 1024 * 1024; // GitHub hard limit per file
const WARN_FILE_BYTES = 50 * 1024 * 1024;

const errors = [];
const warnings = [];
const info = [];
function fail(msg) { errors.push(msg); }
function warn(msg) { warnings.push(msg); }
function note(msg) { info.push(msg); }

function readJSON(file) {
  return JSON.parse(fs.readFileSync(file, 'utf8'));
}

function walk(dir, out = []) {
  if (!fs.existsSync(dir)) return out;
  for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
    if (e.name === '.git' || e.name === 'node_modules') continue;
    const p = path.join(dir, e.name);
    if (e.isDirectory()) walk(p, out);
    else out.push(p);
  }
  return out;
}

function rel(p) { return path.relative(ROOT, p); }
function listJSON(dir) {
  const d = path.join(ROOT, dir);
  return fs.existsSync(d) ? fs.readdirSync(d).filter((f) => f.endsWith('.json')) : [];
}

// Quote-aware CSV record parser: returns an array with the field count of each record
// (handles quoted commas, escaped "" quotes and embedded newlines per RFC 4180).
function csvFieldCounts(text) {
  const counts = [];
  let fields = 1, inQuotes = false, started = false;
  for (let i = 0; i < text.length; i++) {
    const ch = text[i];
    started = true;
    if (inQuotes) {
      if (ch === '"') {
        if (text[i + 1] === '"') i++; // escaped quote
        else inQuotes = false;
      }
    } else if (ch === '"') {
      inQuotes = true;
    } else if (ch === ',') {
      fields++;
    } else if (ch === '\n') {
      counts.push(fields);
      fields = 1; started = false;
    } else if (ch === '\r') {
      // ignore, CRLF tolerated
    }
  }
  if (started) counts.push(fields); // last line without trailing newline
  return counts;
}

// -------- Walk and per-file format checks ----------------------------------

const allFiles = walk(ROOT);
let nJson = 0, nCsv = 0, nSql = 0, nYml = 0;

for (const file of allFiles) {
  const r = rel(file);
  if (r.startsWith('scripts' + path.sep) || r === 'scripts') continue; // skip code
  const base = path.basename(file);
  if (base === 'package.json' || base === 'package-lock.json') continue; // config, not data
  const ext = path.extname(file);
  let size;
  try { size = fs.statSync(file).size; } catch (e) { continue; }
  if (size > MAX_FILE_BYTES) fail(`${r}: ${(size / 1048576).toFixed(1)}MB exceeds GitHub 100MB limit`);
  else if (size > WARN_FILE_BYTES) warn(`${r}: ${(size / 1048576).toFixed(1)}MB (over 50MB)`);

  if (ext === '.json') {
    nJson++;
    let text;
    try { text = fs.readFileSync(file, 'utf8'); } catch (e) { fail(`${r}: cannot read (${e.message})`); continue; }
    try { JSON.parse(text); } catch (e) { fail(`${r}: invalid JSON (${e.message})`); continue; }
    if (text.includes('\n')) warn(`${r}: JSON is not compact (contains newlines)`);
    if (/\\u[0-9a-fA-F]{4}/.test(text)) warn(`${r}: JSON has \\u escapes (non-ASCII should be raw UTF-8)`);
  } else if (ext === '.csv') {
    nCsv++;
    const text = fs.readFileSync(file, 'utf8');
    const counts = csvFieldCounts(text);
    if (!counts.length) { fail(`${r}: empty CSV`); continue; }
    const header = counts[0];
    const badLine = counts.findIndex((c, i) => i > 0 && c !== header);
    if (badLine > 0) fail(`${r}: row ${badLine + 1} has ${counts[badLine]} fields, header has ${header}`);
  } else if (ext === '.sql') {
    nSql++;
    const text = fs.readFileSync(file, 'utf8');
    if (!text.includes('CREATE TABLE IF NOT EXISTS countries')) fail(`${r}: missing CREATE TABLE schema`);
    if (!text.includes('INSERT INTO')) fail(`${r}: no INSERT statements`);
  } else if (ext === '.yml') {
    nYml++;
    const lines = fs.readFileSync(file, 'utf8').split('\n');
    for (let i = 0; i < lines.length; i++) {
      const line = lines[i];
      if (line === '') continue;
      if (line.includes('\t')) { warn(`${r}: tab indentation at line ${i + 1}`); break; }
      const indent = line.length - line.trimStart().length;
      if (indent % 2 !== 0) { warn(`${r}: odd indent at line ${i + 1}`); break; }
    }
  }
}
note(`Parsed ${nJson} JSON, ${nCsv} CSV, ${nSql} SQL, ${nYml} YAML files.`);

// -------- Structural / relational invariants -------------------------------

const EXPECTED_DIRS = ['countries', 'regions', 'subregions', 'bundles', 'flat-cities', 'large-countries', 'metadata', 'latam', 'scripts'];
for (const d of EXPECTED_DIRS) {
  if (!fs.existsSync(path.join(ROOT, d))) fail(`missing expected directory: /${d}`);
}

let meta = null;
try { meta = readJSON(path.join(ROOT, 'metadata', 'countries.json')); } catch (e) { fail(`metadata/countries.json unreadable: ${e.message}`); }

if (Array.isArray(meta)) {
  const L = meta.length;
  const nCountryFiles = listJSON('countries').length;
  const nFlatFiles = listJSON('flat-cities').length;
  if (nCountryFiles !== L) fail(`countries/ has ${nCountryFiles} json files but metadata lists ${L} countries`);
  if (nFlatFiles !== L) fail(`flat-cities/ has ${nFlatFiles} json files but metadata lists ${L} countries`);

  // index.json keys
  try {
    const index = readJSON(path.join(ROOT, 'metadata', 'index.json'));
    if (Object.keys(index).length !== L) fail(`metadata/index.json has ${Object.keys(index).length} keys, expected ${L}`);
  } catch (e) { fail(`metadata/index.json unreadable: ${e.message}`); }

  // bilingual completeness (countries)
  let missEs = 0, missRegionEs = 0, missSubEs = 0;
  for (const c of meta) {
    if (!c.name || !c.name_es) missEs++;
    if (c.region && !c.region_es) missRegionEs++;
    if (c.subregion && !c.subregion_es) missSubEs++;
  }
  if (missEs) fail(`${missEs} countries missing name/name_es in metadata`);
  if (missRegionEs) fail(`${missRegionEs} countries have region but no region_es`);
  if (missSubEs) fail(`${missSubEs} countries have subregion but no subregion_es`);

  let totalStates = 0, totalCities = 0, missTypeEs = 0;
  for (const f of listJSON('countries')) {
    let arr;
    try { arr = readJSON(path.join(ROOT, 'countries', f)); } catch (e) { continue; } // parse error already reported in the file pass
    const c = Array.isArray(arr) ? arr[0] : arr;
    if (!c || !c.name || !c.name_es) { fail(`countries/${f}: missing name/name_es`); continue; }
    for (const s of (c.states || [])) {
      totalStates++;
      totalCities += (s.cities || []).length;
      if (s.type && !s.type_es) missTypeEs++;
    }
  }
  if (missTypeEs) fail(`${missTypeEs} states have type but no type_es`);
  note(`Totals: ${L} countries, ${totalStates} states, ${totalCities} cities.`);
}

// regions / subregions indexes vs files
try {
  const regions = readJSON(path.join(ROOT, 'metadata', 'regions.json'));
  for (const [name, o] of Object.entries(regions.index || {})) {
    for (const ext of ['json', 'csv', 'sql', 'yml']) {
      const f = path.join(ROOT, 'regions', `${o.slug}.${ext}`);
      if (!fs.existsSync(f)) fail(`region "${name}" expects regions/${o.slug}.${ext} (missing)`);
    }
    if (!o.name_es) warn(`region "${name}" has no name_es in regions.json index`);
  }
  for (const [name, o] of Object.entries(regions.subregions || {})) {
    for (const ext of ['json', 'csv', 'sql', 'yml']) {
      const f = path.join(ROOT, 'subregions', `${o.slug}.${ext}`);
      if (!fs.existsSync(f)) fail(`subregion "${name}" expects subregions/${o.slug}.${ext} (missing)`);
    }
    if (!o.name_es) warn(`subregion "${name}" has no name_es`);
  }
} catch (e) { fail(`metadata/regions.json unreadable: ${e.message}`); }

// bundles index vs files + name_es
try {
  const bundles = readJSON(path.join(ROOT, 'metadata', 'bundles.json'));
  for (const [slug, o] of Object.entries(bundles)) {
    for (const ext of ['json', 'csv', 'sql', 'yml']) {
      const f = path.join(ROOT, 'bundles', `${slug}.${ext}`);
      if (!fs.existsSync(f)) fail(`bundle "${slug}" expects bundles/${slug}.${ext} (missing)`);
    }
    if (!o.name || !o.name_es) fail(`bundle "${slug}" missing name/name_es in bundles.json`);
  }
} catch (e) { fail(`metadata/bundles.json unreadable: ${e.message}`); }

// large-countries: per-state file count must equal source states (slug-collision guard)
const largeDir = path.join(ROOT, 'large-countries');
if (fs.existsSync(largeDir)) {
  for (const iso2 of fs.readdirSync(largeDir)) {
    const statesDir = path.join(largeDir, iso2, 'states');
    if (!fs.existsSync(statesDir)) { fail(`large-countries/${iso2}: no states/ dir`); continue; }
    const nFiles = fs.readdirSync(statesDir).filter((f) => f.endsWith('.json')).length;
    let srcStates = null;
    try { srcStates = (readJSON(path.join(ROOT, 'countries', `${iso2}.json`))[0].states || []).length; } catch (e) { /* */ }
    if (srcStates === null) fail(`large-countries/${iso2}: no countries/${iso2}.json to compare`);
    else if (nFiles !== srcStates) fail(`large-countries/${iso2}: ${nFiles} state files but country has ${srcStates} states (slug collision?)`);
  }
}

// cross-format city counts for a sample (hierarchy == CSV city rows; flat <= hierarchy)
for (const iso2 of ['CO', 'US', 'MX', 'BR', 'DE', 'IN']) {
  try {
    const cf = path.join(ROOT, 'countries', `${iso2}.json`);
    if (!fs.existsSync(cf)) continue;
    const c = readJSON(cf)[0];
    const hier = (c.states || []).reduce((a, s) => a + (s.cities || []).length, 0);
    // CSV city rows (non-empty city_name): total records - header - empty-city rows
    const csv = fs.readFileSync(path.join(ROOT, 'countries', `${iso2}.csv`), 'utf8').split('\n').filter(Boolean);
    const cityRows = csv.length - 1; // minus header (placeholder rows for empty states count as cities=0, acceptable tolerance)
    if (cityRows < hier) fail(`${iso2}: CSV has ${cityRows} data rows but hierarchy has ${hier} cities`);
    const flat = readJSON(path.join(ROOT, 'flat-cities', `${iso2}.json`));
    if (flat.length > hier) fail(`${iso2}: flat-cities (${flat.length}) > hierarchy cities (${hier})`);
  } catch (e) { /* parse errors already reported in the file pass */ }
}

// latam section consistency
try {
  const lc = readJSON(path.join(ROOT, 'latam', 'countries.json'));
  const li = readJSON(path.join(ROOT, 'latam', 'index.json'));
  const lcons = readJSON(path.join(ROOT, 'latam', 'latam-cities.json'));
  const nLatamFiles = listJSON('latam/cities').length;
  if (lc.length !== nLatamFiles) fail(`latam: countries.json lists ${lc.length} but latam/cities has ${nLatamFiles} files`);
  if (Object.keys(li).length !== lc.length) fail(`latam/index.json has ${Object.keys(li).length} keys, expected ${lc.length}`);
  if (Object.keys(lcons).length !== lc.length) fail(`latam-cities.json has ${Object.keys(lcons).length} keys, expected ${lc.length}`);
  if (lc[0] && lc[0].slug !== 'colombia') warn(`latam/countries.json: first entry is "${lc[0] && lc[0].slug}", expected colombia`);
  for (const c of lc) if (!c.name_en || !c.name_es) { fail('latam/countries.json: an entry is missing name_en/name_es'); break; }
} catch (e) { fail(`latam section unreadable: ${e.message}`); }

// -------- Report -----------------------------------------------------------

console.log('\n=== validate.js ===');
for (const m of info) console.log('  info: ' + m);
for (const w of warnings) console.log('  WARN: ' + w);
for (const e of errors) console.log('  ERROR: ' + e);
console.log(`\n${errors.length} error(s), ${warnings.length} warning(s).`);
if (errors.length) {
  console.error('FAILED: fix the errors above (or re-run the build scripts).');
  process.exit(1);
}
console.log('OK: data is valid.');
