#!/usr/bin/env node
/*
 * build-latam.js
 * Builds the Elementor-ready LATAM section under /latam.
 *
 * This is the richer LATAM dataset (more cities than the dr5hn snapshot), sourced from
 * Yerikmiller/Countries-States-Cities-JSON (derived from dr5hn), under ODbL. It is kept
 * alongside the dr5hn world data so you can choose either source:
 *   - /latam/...                  Yerikmiller (this script) - richer, slug-keyed, bilingual
 *   - /bundles/latam.json         dr5hn (build.js) - same 20 countries, ISO2-keyed hierarchy
 *   - /flat-cities/<ISO2>.json    dr5hn (build.js) - flat city arrays by ISO2
 *
 * Source raw:
 *   https://raw.githubusercontent.com/Yerikmiller/Countries-States-Cities-JSON/main/countries/<ISO3>.json
 *   Shape: { "states": [ { "cities": ["name", ...] } ] }
 *
 * Outputs (under repo /latam):
 *   /latam/cities/<slug>.json   flat city array per country (dedup + locale-es sort)
 *   /latam/countries.json       ordered countries with EN + ES names (Colombia first)
 *   /latam/index.json           { slug: { name_en, name_es, iso2, iso3 } }
 *   /latam/latam-cities.json    consolidated { slug: [cities...] }
 *
 * English slugs, bilingual names. JSON compact, UTF-8, non-ASCII unescaped. Re-runnable.
 */

'use strict';

const fs = require('fs');
const path = require('path');

// English name, Spanish name, English slug, ISO3, ISO2. Colombia first (primary market);
// the rest are sorted alphabetically by English name at output time.
const COUNTRIES = [
  { name_en: 'Colombia', name_es: 'Colombia', slug: 'colombia', iso3: 'COL', iso2: 'CO' },
  { name_en: 'Argentina', name_es: 'Argentina', slug: 'argentina', iso3: 'ARG', iso2: 'AR' },
  { name_en: 'Bolivia', name_es: 'Bolivia', slug: 'bolivia', iso3: 'BOL', iso2: 'BO' },
  { name_en: 'Brazil', name_es: 'Brasil', slug: 'brazil', iso3: 'BRA', iso2: 'BR' },
  { name_en: 'Chile', name_es: 'Chile', slug: 'chile', iso3: 'CHL', iso2: 'CL' },
  { name_en: 'Costa Rica', name_es: 'Costa Rica', slug: 'costa-rica', iso3: 'CRI', iso2: 'CR' },
  { name_en: 'Cuba', name_es: 'Cuba', slug: 'cuba', iso3: 'CUB', iso2: 'CU' },
  { name_en: 'Dominican Republic', name_es: 'República Dominicana', slug: 'dominican-republic', iso3: 'DOM', iso2: 'DO' },
  { name_en: 'Ecuador', name_es: 'Ecuador', slug: 'ecuador', iso3: 'ECU', iso2: 'EC' },
  { name_en: 'El Salvador', name_es: 'El Salvador', slug: 'el-salvador', iso3: 'SLV', iso2: 'SV' },
  { name_en: 'Guatemala', name_es: 'Guatemala', slug: 'guatemala', iso3: 'GTM', iso2: 'GT' },
  { name_en: 'Honduras', name_es: 'Honduras', slug: 'honduras', iso3: 'HND', iso2: 'HN' },
  { name_en: 'Mexico', name_es: 'México', slug: 'mexico', iso3: 'MEX', iso2: 'MX' },
  { name_en: 'Nicaragua', name_es: 'Nicaragua', slug: 'nicaragua', iso3: 'NIC', iso2: 'NI' },
  { name_en: 'Panama', name_es: 'Panamá', slug: 'panama', iso3: 'PAN', iso2: 'PA' },
  { name_en: 'Paraguay', name_es: 'Paraguay', slug: 'paraguay', iso3: 'PRY', iso2: 'PY' },
  { name_en: 'Peru', name_es: 'Perú', slug: 'peru', iso3: 'PER', iso2: 'PE' },
  { name_en: 'Puerto Rico', name_es: 'Puerto Rico', slug: 'puerto-rico', iso3: 'PRI', iso2: 'PR' },
  { name_en: 'Uruguay', name_es: 'Uruguay', slug: 'uruguay', iso3: 'URY', iso2: 'UY' },
  { name_en: 'Venezuela', name_es: 'Venezuela', slug: 'venezuela', iso3: 'VEN', iso2: 'VE' },
];

// Puerto Rico ships with 0 cities in the source: fill manually (already sorted).
const PUERTO_RICO_CITIES = [
  'Aguadilla', 'Arecibo', 'Bayamón', 'Caguas', 'Carolina',
  'Guaynabo', 'Mayagüez', 'Ponce', 'San Juan', 'Trujillo Alto',
];

const RAW_BASE = 'https://raw.githubusercontent.com/Yerikmiller/Countries-States-Cities-JSON/main/countries';

const ROOT = path.resolve(__dirname, '..');
const DIR_LATAM = path.join(ROOT, 'latam');
const DIR_CITIES = path.join(DIR_LATAM, 'cities');

const collator = new Intl.Collator('es', { sensitivity: 'accent' });

function normalizeCities(list) {
  const seen = new Map();
  for (const raw of list) {
    if (typeof raw !== 'string') continue;
    const name = raw.trim();
    if (!name) continue;
    const key = name.toLocaleLowerCase('es');
    if (!seen.has(key)) seen.set(key, name);
  }
  return Array.from(seen.values()).sort((a, b) => collator.compare(a, b));
}

function flattenCities(data) {
  const out = [];
  const states = Array.isArray(data && data.states) ? data.states : [];
  for (const st of states) {
    const cities = Array.isArray(st && st.cities) ? st.cities : [];
    for (const c of cities) out.push(c);
  }
  return out;
}

async function downloadCountry(iso3) {
  const url = `${RAW_BASE}/${iso3}.json`;
  const res = await fetch(url);
  if (!res.ok) throw new Error(`Download failed ${iso3}: HTTP ${res.status}`);
  return res.json();
}

function writeJSON(file, obj) {
  fs.writeFileSync(file, JSON.stringify(obj), 'utf8');
}

async function main() {
  fs.mkdirSync(DIR_CITIES, { recursive: true });

  const consolidated = {};
  const index = {};
  const counts = [];

  for (const c of COUNTRIES) {
    let cities;
    if (c.iso3 === 'PRI') {
      cities = normalizeCities(PUERTO_RICO_CITIES);
    } else {
      const data = await downloadCountry(c.iso3);
      cities = normalizeCities(flattenCities(data));
    }

    writeJSON(path.join(DIR_CITIES, `${c.slug}.json`), cities);
    consolidated[c.slug] = cities;
    index[c.slug] = { name_en: c.name_en, name_es: c.name_es, iso2: c.iso2, iso3: c.iso3 };
    counts.push({ name_en: c.name_en, slug: c.slug, n: cities.length });
    console.log(`  ${c.name_en.padEnd(20)} ${String(cities.length).padStart(5)} cities -> latam/cities/${c.slug}.json`);
  }

  const first = COUNTRIES.find((c) => c.slug === 'colombia');
  const rest = COUNTRIES.filter((c) => c.slug !== 'colombia')
    .sort((a, b) => collator.compare(a.name_en, b.name_en));
  const ordered = [first, ...rest].map((c) => ({
    slug: c.slug, name_en: c.name_en, name_es: c.name_es, iso2: c.iso2, iso3: c.iso3,
  }));
  writeJSON(path.join(DIR_LATAM, 'countries.json'), ordered);
  writeJSON(path.join(DIR_LATAM, 'index.json'), index);
  writeJSON(path.join(DIR_LATAM, 'latam-cities.json'), consolidated);

  const total = counts.reduce((a, c) => a + c.n, 0);
  console.log(`\nLATAM: ${counts.length} countries, ${total} cities (Yerikmiller source).`);
}

main().catch((err) => {
  console.error('ERROR:', err.message);
  process.exit(1);
});
