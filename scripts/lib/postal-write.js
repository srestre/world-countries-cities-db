'use strict';
/*
 * postal-write.js - writes the per-country postal files (JSON + CSV). Countries
 * over the size threshold (or forced, e.g. CA/NL) are split by admin1; any
 * admin1 group (or a country with no admin1) that is still too large is further
 * chunked by byte size into numbered parts, so NO output file exceeds the file
 * size ceiling, whatever the admin structure looks like.
 *
 * SPDX-License-Identifier: MIT
 */

const path = require('path');
const { slug, ensureDir, writeJSON, writeCSV } = require('./format.js');
const { POSTAL_COLS } = require('./postal.js');

const SPLIT_THRESHOLD = 15 * 1024 * 1024; // 15 MB: split a country above this
const CHUNK_LIMIT = 14 * 1024 * 1024;     // 14 MB: per-file ceiling with headroom

// Partition records into consecutive chunks whose serialized JSON stays under
// limitBytes. A single record always lands (chunks are never empty).
function chunkBySize(records, limitBytes) {
  const chunks = [];
  let cur = [];
  let size = 2; // the surrounding [] of the JSON array
  for (const r of records) {
    const rs = Buffer.byteLength(JSON.stringify(r)) + 1; // +1 for the comma
    if (cur.length && size + rs > limitBytes) { chunks.push(cur); cur = []; size = 2; }
    cur.push(r);
    size += rs;
  }
  if (cur.length) chunks.push(cur);
  return chunks;
}

// Write one admin1 group (or the no-admin1 group) as one file, or as numbered
// parts when it would exceed the ceiling. Appends repo-relative paths to files.
function writeGroup(dir, iso2, baseSlug, recs, limitBytes, files) {
  const chunks = chunkBySize(recs, limitBytes);
  chunks.forEach((chunk, i) => {
    const name = chunks.length === 1 ? baseSlug : baseSlug + '-' + (i + 1);
    writeJSON(path.join(dir, name + '.json'), chunk);
    writeCSV(path.join(dir, name + '.csv'), POSTAL_COLS, chunk);
    files.push('postal-codes/' + iso2 + '/' + name + '.json', 'postal-codes/' + iso2 + '/' + name + '.csv');
  });
}

function writeCountry(rootDir, iso2, records, forceSplit, maxBytes) {
  const max = maxBytes || SPLIT_THRESHOLD;
  const mustSplit = forceSplit || Buffer.byteLength(JSON.stringify(records), 'utf8') > max;

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
  const limit = Math.min(max, CHUNK_LIMIT);
  for (const [admin1, recs] of groups) {
    let s = slug(admin1) || 'admin1';
    if (used.has(s)) s += '-' + (slug(recs[0].admin1_code) || ('n' + used.size));
    used.add(s);
    writeGroup(dir, iso2, s, recs, limit, files);
  }
  return { iso2, records: records.length, split: true, files };
}

module.exports = { writeCountry, chunkBySize, SPLIT_THRESHOLD };
