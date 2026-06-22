'use strict';
/*
 * postal-write.js - writes the per-country postal files (JSON + CSV) and, for
 * countries over the size threshold (or forced, e.g. CA/NL), splits them by
 * admin1 with a slug-collision guard, mirroring the /large-countries pattern.
 *
 * SPDX-License-Identifier: MIT
 */

const path = require('path');
const { slug, ensureDir, writeJSON, writeCSV } = require('./format.js');
const { POSTAL_COLS } = require('./postal.js');

const SPLIT_THRESHOLD = 15 * 1024 * 1024; // 15 MB

function writeCountry(rootDir, iso2, records, forceSplit) {
  const json = JSON.stringify(records);
  const mustSplit = forceSplit || Buffer.byteLength(json, 'utf8') > SPLIT_THRESHOLD;

  if (!mustSplit) {
    writeJSON(path.join(rootDir, iso2 + '.json'), records);
    writeCSV(path.join(rootDir, iso2 + '.csv'), POSTAL_COLS, records);
    return {
      iso2, records: records.length, split: false,
      files: ['postal-codes/' + iso2 + '.json', 'postal-codes/' + iso2 + '.csv'],
    };
  }

  const dir = path.join(rootDir, iso2);
  ensureDir(dir);
  const groups = new Map();
  for (const r of records) {
    const key = r.admin1 || '_unknown';
    if (!groups.has(key)) groups.set(key, []);
    groups.get(key).push(r);
  }
  const used = new Set();
  const files = [];
  for (const [admin1, recs] of groups) {
    let s = slug(admin1) || 'admin1';
    if (used.has(s)) s += '-' + (slug(recs[0].admin1_code) || ('n' + used.size));
    used.add(s);
    writeJSON(path.join(dir, s + '.json'), recs);
    writeCSV(path.join(dir, s + '.csv'), POSTAL_COLS, recs);
    files.push('postal-codes/' + iso2 + '/' + s + '.json', 'postal-codes/' + iso2 + '/' + s + '.csv');
  }
  return { iso2, records: records.length, split: true, files };
}

module.exports = { writeCountry, SPLIT_THRESHOLD };
