'use strict';
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { unzip } = require('../scripts/lib/unzip.js');

const EXPECT = 'CO\t050001\tMedellin\tAntioquia\t02\tMedellin\t05001\t\t\t6.2518\t-75.5636\t4\n';

for (const file of ['sample-deflate.zip', 'sample-stored.zip']) {
  test('unzip reads ' + file, () => {
    const buf = fs.readFileSync(path.join(__dirname, 'fixtures', file));
    const map = unzip(buf);
    assert.ok(map.has('sample.txt'), 'has sample.txt');
    assert.equal(map.get('sample.txt').toString('utf8'), EXPECT);
  });
}
