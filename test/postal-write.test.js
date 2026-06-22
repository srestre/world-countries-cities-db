'use strict';
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { writeCountry, chunkBySize } = require('../scripts/lib/postal-write.js');

function rec(admin1, admin1_code, pc) {
  return {
    country_code: 'CO', country_name: 'Colombia', country_name_es: 'Colombia',
    postal_code: pc, place: 'X', admin1, admin1_code, admin2: null, admin2_code: null,
    admin3: null, admin3_code: null, latitude: 1, longitude: 2, accuracy: 4, slug: 'x',
  };
}

test('small country writes a single JSON+CSV pair', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'pw-'));
  const e = writeCountry(dir, 'CO', [rec('Antioquia', '02', '050001')], false);
  assert.equal(e.split, false);
  assert.equal(e.records, 1);
  assert.ok(fs.existsSync(path.join(dir, 'CO.json')));
  assert.ok(fs.existsSync(path.join(dir, 'CO.csv')));
  assert.deepEqual(e.files, ['postal-codes/CO.json', 'postal-codes/CO.csv']);
});

test('forceSplit writes one file pair per admin1 under iso2 dir', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'pw-'));
  const e = writeCountry(dir, 'CA', [rec('Ontario', 'ON', 'K1A'), rec('Quebec', 'QC', 'H0H')], true);
  assert.equal(e.split, true);
  assert.ok(fs.existsSync(path.join(dir, 'CA', 'ontario.json')));
  assert.ok(fs.existsSync(path.join(dir, 'CA', 'quebec.json')));
  assert.ok(e.files.includes('postal-codes/CA/ontario.json'));
});

test('split disambiguates colliding admin1 slugs', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'pw-'));
  const e = writeCountry(dir, 'XX', [rec('Saint Anne', 'A1', '1'), rec('Saint-Anne', 'A2', '2')], true);
  const names = fs.readdirSync(path.join(dir, 'XX')).filter((f) => f.endsWith('.json')).sort();
  assert.equal(names.length, 2);
  assert.notEqual(names[0], names[1]);
});

test('chunkBySize keeps every chunk under the byte limit', () => {
  const recs = Array.from({ length: 10 }, (_, i) => rec('A', '1', String(i)));
  const chunks = chunkBySize(recs, 300);
  assert.ok(chunks.length > 1, 'splits into multiple chunks');
  for (const c of chunks) {
    assert.ok(Buffer.byteLength(JSON.stringify(c)) <= 300 || c.length === 1, 'chunk under limit');
  }
  assert.equal(chunks.reduce((a, c) => a + c.length, 0), 10); // no records lost
});

test('an oversized admin1 group is chunked into numbered parts', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'pw-'));
  const recs = Array.from({ length: 6 }, (_, i) => rec('Antioquia', '02', String(i)));
  const e = writeCountry(dir, 'CO', recs, true, 150); // tiny maxBytes forces sub-chunking
  assert.equal(e.split, true);
  const names = fs.readdirSync(path.join(dir, 'CO')).filter((f) => f.endsWith('.json')).sort();
  assert.ok(names.length >= 2, 'multiple numbered parts, got ' + names.join(','));
  assert.ok(names.every((f) => /^antioquia(-\d+)?\.json$/.test(f)));
  assert.ok(e.files.some((f) => /antioquia-1\.json$/.test(f)));
});
