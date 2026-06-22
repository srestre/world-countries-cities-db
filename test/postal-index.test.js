'use strict';
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { buildIndex, writeBundles } = require('../scripts/lib/postal-index.js');

function entries() {
  return new Map([
    ['CO', { iso2: 'CO', records: 3681, split: false, files: ['postal-codes/CO.json'], country_name: 'Colombia', country_name_es: 'Colombia' }],
    ['MX', { iso2: 'MX', records: 152000, split: false, files: ['postal-codes/MX.json'], country_name: 'Mexico', country_name_es: 'México' }],
  ]);
}

test('buildIndex summarizes per country', () => {
  const idx = buildIndex(entries());
  assert.equal(idx.CO.records, 3681);
  assert.equal(idx.CO.country_name, 'Colombia');
  assert.equal(idx.MX.split, false);
});

test('writeBundles emits a manifest listing only present members', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'pi-'));
  const written = writeBundles(dir, entries());
  assert.ok(written.includes('latam'));
  const latam = JSON.parse(fs.readFileSync(path.join(dir, 'latam.json'), 'utf8'));
  assert.equal(latam.bundle, 'latam');
  const isos = latam.countries.map((c) => c.iso2).sort();
  assert.deepEqual(isos, ['CO', 'MX']); // only members that exist in entries
  assert.equal(latam.total_records, 3681 + 152000);
});
