#!/usr/bin/env node
'use strict';
/*
 * build-postal.js - builds /postal-codes from GeoNames (CC BY 4.0). Downloads
 * allCountries.zip (plus CA_full/NL_full), writes one JSON+CSV per country
 * (splitting >15 MB and always CA/NL by admin1), and emits regional manifest
 * bundles + a coverage index. Country names come from metadata/index.json, so
 * run build.js first if it is missing. Set POSTAL_ONLY=CO,MX to limit countries.
 *
 * Source: GeoNames postal code files, https://www.geonames.org/ (CC BY 4.0).
 * SPDX-License-Identifier: MIT (code). Data: CC BY 4.0 (see LICENSE-DATA-POSTAL).
 */

const fs = require('fs');
const path = require('path');
const { ensureDir } = require('./lib/format.js');
const { unzip } = require('./lib/unzip.js');
const { parseLine, toRecord } = require('./lib/postal.js');
const { writeCountry } = require('./lib/postal-write.js');
const { buildIndex, writeBundles } = require('./lib/postal-index.js');

const ROOT = path.resolve(__dirname, '..');
const BASE = 'https://download.geonames.org/export/zip/';
const ALL = BASE + 'allCountries.zip';
const FULL = { CA: BASE + 'CA_full.csv.zip', NL: BASE + 'NL_full.csv.zip' };
const FORCE_SPLIT = new Set(['CA', 'NL']);

async function download(url) {
  const res = await fetch(url);
  if (!res.ok) throw new Error('download failed ' + url + ' HTTP ' + res.status);
  return Buffer.from(await res.arrayBuffer());
}

function firstTxt(map) {
  for (const [name, data] of map) if (name.endsWith('.txt')) return data;
  throw new Error('no .txt entry in archive');
}

function loadNames() {
  const p = path.join(ROOT, 'metadata', 'index.json');
  if (!fs.existsSync(p)) throw new Error('metadata/index.json missing - run build.js first');
  return JSON.parse(fs.readFileSync(p, 'utf8'));
}

function ingest(text, only, sink) {
  let start = 0;
  while (start < text.length) {
    let nl = text.indexOf('\n', start);
    if (nl === -1) nl = text.length;
    const line = text.slice(start, nl);
    start = nl + 1;
    if (!line) continue;
    const row = parseLine(line);
    if (!/^[A-Za-z]{2}$/.test(row.country_code)) continue; // path-safety
    if (only && !only.has(row.country_code)) continue;
    sink(row);
  }
}

async function main() {
  const only = process.env.POSTAL_ONLY ? new Set(process.env.POSTAL_ONLY.split(',')) : null;
  const names = loadNames();
  const dir = path.join(ROOT, 'postal-codes');
  ensureDir(dir);
  ensureDir(path.join(dir, 'bundles'));

  const byCountry = new Map();
  const add = (row) => {
    const nm = names[row.country_code] || {};
    const rec = toRecord(row, nm.name || row.country_code, nm.name_es || nm.name || row.country_code);
    if (!byCountry.has(row.country_code)) byCountry.set(row.country_code, []);
    byCountry.get(row.country_code).push(rec);
  };

  console.log('Downloading allCountries.zip ...');
  ingest(firstTxt(unzip(await download(ALL))).toString('utf8'), only, add);

  for (const iso2 of Object.keys(FULL)) {
    if (only && !only.has(iso2)) continue;
    console.log('Downloading', iso2, 'full ...');
    byCountry.set(iso2, []); // *_full supersedes the basic rows
    ingest(firstTxt(unzip(await download(FULL[iso2]))).toString('utf8'), new Set([iso2]), add);
  }

  const entries = new Map();
  for (const [iso2, records] of byCountry) {
    const nm = names[iso2] || {};
    const res = writeCountry(dir, iso2, records, FORCE_SPLIT.has(iso2));
    entries.set(iso2, Object.assign(res, {
      country_name: nm.name || iso2, country_name_es: nm.name_es || nm.name || iso2,
    }));
  }

  writeBundles(path.join(dir, 'bundles'), entries);
  fs.writeFileSync(path.join(dir, 'index.json'), JSON.stringify(buildIndex(entries)), 'utf8');

  const total = [...entries.values()].reduce((a, e) => a + e.records, 0);
  console.log('Done: ' + entries.size + ' countries, ' + total + ' postal records.');
}

main().catch((e) => { console.error('ERROR:', e.message); process.exit(1); });
