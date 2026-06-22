'use strict';
const { test } = require('node:test');
const assert = require('node:assert/strict');
const { parseLine, toRecord, POSTAL_COLS } = require('../scripts/lib/postal.js');

const LINE = 'CO\t050001\tMedellin\tAntioquia\t02\tMedellín\t05001\t\t\t6.2518\t-75.5636\t4';

test('parseLine splits 12 GeoNames columns', () => {
  const r = parseLine(LINE);
  assert.equal(r.country_code, 'CO');
  assert.equal(r.postal_code, '050001');
  assert.equal(r.place, 'Medellin');
  assert.equal(r.admin1, 'Antioquia');
  assert.equal(r.admin2_code, '05001');
  assert.equal(r.latitude, '6.2518');
});

test('toRecord builds faithful record with context and slug', () => {
  const rec = toRecord(parseLine(LINE), 'Colombia', 'Colombia');
  assert.equal(rec.country_code, 'CO');
  assert.equal(rec.country_name, 'Colombia');
  assert.equal(rec.postal_code, '050001');
  assert.equal(rec.admin2_code, '05001');
  assert.equal(rec.admin3, null);
  assert.equal(rec.latitude, 6.2518);
  assert.equal(rec.accuracy, 4);
  assert.equal(rec.slug, 'medellin');
});

test('POSTAL_COLS lists 15 columns in order', () => {
  assert.equal(POSTAL_COLS.length, 15);
  assert.equal(POSTAL_COLS[0], 'country_code');
  assert.equal(POSTAL_COLS[POSTAL_COLS.length - 1], 'slug');
});
