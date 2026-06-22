'use strict';
/*
 * postal.js - pure helpers for GeoNames postal rows: TSV parsing and the
 * faithful-plus-context record transform.
 *
 * SPDX-License-Identifier: MIT
 */

const { slug, num } = require('./format.js');

const POSTAL_COLS = [
  'country_code', 'country_name', 'country_name_es', 'postal_code', 'place',
  'admin1', 'admin1_code', 'admin2', 'admin2_code', 'admin3', 'admin3_code',
  'latitude', 'longitude', 'accuracy', 'slug',
];

// GeoNames postal dump: tab-separated, 12 columns.
function parseLine(line) {
  const f = line.split('\t');
  return {
    country_code: f[0] || '',
    postal_code: f[1] || '',
    place: f[2] || '',
    admin1: f[3] || '',
    admin1_code: f[4] || '',
    admin2: f[5] || '',
    admin2_code: f[6] || '',
    admin3: f[7] || '',
    admin3_code: f[8] || '',
    latitude: f[9] || '',
    longitude: f[10] || '',
    accuracy: f[11] || '',
  };
}

function nullify(s) {
  return s === '' || s == null ? null : s;
}

function toRecord(row, countryName, countryNameEs) {
  return {
    country_code: row.country_code,
    country_name: countryName,
    country_name_es: countryNameEs,
    postal_code: row.postal_code,
    place: row.place,
    admin1: nullify(row.admin1),
    admin1_code: nullify(row.admin1_code),
    admin2: nullify(row.admin2),
    admin2_code: nullify(row.admin2_code),
    admin3: nullify(row.admin3),
    admin3_code: nullify(row.admin3_code),
    latitude: num(row.latitude),
    longitude: num(row.longitude),
    accuracy: num(row.accuracy),
    slug: slug(row.place),
  };
}

module.exports = { POSTAL_COLS, parseLine, toRecord, nullify };
