'use strict';
/*
 * postal-index.js - builds the global coverage index and the lightweight
 * regional bundle manifests (member countries + counts + file paths). Bundles
 * are manifests, not data concatenations, so they stay small and jsDelivr-safe.
 *
 * SPDX-License-Identifier: MIT
 */

const path = require('path');
const { writeJSON } = require('./format.js');
const { BUNDLES } = require('./groups.js');

function buildIndex(entriesByIso2) {
  const index = Object.create(null); // null-proto: keys are upstream iso2
  for (const [iso2, e] of entriesByIso2) {
    index[iso2] = { country_name: e.country_name, records: e.records, split: e.split };
  }
  return index;
}

function writeBundles(bundlesDir, entriesByIso2) {
  const written = [];
  for (const [bslug, def] of Object.entries(BUNDLES)) {
    const countries = [];
    let total = 0;
    for (const iso2 of def.iso2) {
      const e = entriesByIso2.get(iso2);
      if (!e) continue;
      countries.push({ iso2, name: e.country_name, records: e.records, split: e.split, files: e.files });
      total += e.records;
    }
    writeJSON(path.join(bundlesDir, bslug + '.json'), {
      bundle: bslug, name: def.name, name_es: def.name_es, total_records: total, countries,
    });
    written.push(bslug);
  }
  return written;
}

module.exports = { buildIndex, writeBundles };
