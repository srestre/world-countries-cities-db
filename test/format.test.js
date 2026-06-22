'use strict';
const { test } = require('node:test');
const assert = require('node:assert/strict');
const os = require('node:os');
const fs = require('node:fs');
const path = require('node:path');
const { slug, num, csvField, writeJSON, writeCSV } = require('../scripts/lib/format.js');
const { BUNDLES } = require('../scripts/lib/groups.js');

test('slug strips accents and lowercases', () => {
  assert.equal(slug('Medellín'), 'medellin');
  assert.equal(slug('Bogotá D.C.'), 'bogota-d-c');
  assert.equal(slug(''), '');
});

test('num parses or returns null', () => {
  assert.equal(num('6.25'), 6.25);
  assert.equal(num(''), null);
  assert.equal(num('x'), null);
});

test('csvField guards formula injection but not numbers', () => {
  assert.equal(csvField('=cmd'), "'=cmd");
  assert.equal(csvField(-75.5), '-75.5');
  assert.equal(csvField('a,b'), '"a,b"');
});

test('writeCSV writes header and guarded rows', () => {
  const f = path.join(os.tmpdir(), 'fmt-' + process.pid + '.csv');
  writeCSV(f, ['a', 'b'], [{ a: '=x', b: 1 }]);
  const out = fs.readFileSync(f, 'utf8');
  assert.equal(out, "a,b\n'=x,1\n");
  fs.unlinkSync(f);
});

test('BUNDLES has the 5 regional groups', () => {
  assert.deepEqual(
    Object.keys(BUNDLES).sort(),
    ['caribbean', 'central-america', 'latam', 'north-america', 'south-america'],
  );
  assert.ok(BUNDLES.latam.iso2.includes('CO'));
});
