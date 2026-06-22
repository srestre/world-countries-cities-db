'use strict';
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { writeCountry } = require('../scripts/lib/postal-write.js');

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
