#!/usr/bin/env node
'use strict';
/*
 * validate-postal.js - sanity checks for the generated /postal-codes tree.
 * Mirrors the project convention of a dependency-free validator. Exits 1 on
 * any failure.
 *
 * SPDX-License-Identifier: MIT
 */

const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const DIR = path.join(ROOT, 'postal-codes');

let errors = 0;
function check(cond, msg) { if (!cond) { console.error('FAIL:', msg); errors++; } }

function walkJSON(dir) {
  const out = [];
  for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
    const p = path.join(dir, e.name);
    if (e.isDirectory()) out.push(...walkJSON(p));
    else if (e.name.endsWith('.json')) out.push(p);
  }
  return out;
}

function main() {
  check(fs.existsSync(DIR), 'postal-codes/ exists');
  if (!fs.existsSync(DIR)) { process.exit(1); }

  // Path-safety: country dirs and files must be safe iso2.
  for (const name of fs.readdirSync(DIR)) {
    const full = path.join(DIR, name);
    if (fs.statSync(full).isDirectory()) {
      if (name === 'bundles') continue;
      check(/^[A-Za-z]{2}$/.test(name), 'safe iso2 dir: ' + name);
    } else if (name.endsWith('.json') && name !== 'index.json') {
      check(/^[A-Za-z]{2}\.json$/.test(name), 'safe iso2 file: ' + name);
    }
  }

  // Colombia spot check.
  const coPath = path.join(DIR, 'CO.json');
  if (fs.existsSync(coPath)) {
    const co = JSON.parse(fs.readFileSync(coPath, 'utf8'));
    check(Array.isArray(co) && co.length > 3000, 'CO has >3000 records, got ' + (co.length || 0));
    const med = co.find((r) => r.admin2_code === '05001');
    check(med && /medellin/i.test(med.place), 'CO contains Medellin (admin2_code 05001)');
  } else {
    check(false, 'CO.json present');
  }

  // Every record has a postal_code and a safe country_code.
  for (const f of walkJSON(DIR)) {
    const base = path.basename(f);
    if (base === 'index.json') continue;
    if (f.split(path.sep).includes('bundles')) continue;
    const arr = JSON.parse(fs.readFileSync(f, 'utf8'));
    if (!Array.isArray(arr)) continue;
    for (const r of arr) {
      if (!r.postal_code) { check(false, 'record missing postal_code in ' + f); break; }
      if (!/^[A-Za-z]{2}$/.test(r.country_code || '')) { check(false, 'bad country_code in ' + f); break; }
    }
  }

  // Index matches files on disk.
  const index = JSON.parse(fs.readFileSync(path.join(DIR, 'index.json'), 'utf8'));
  for (const iso2 of Object.keys(index)) {
    const ok = index[iso2].split
      ? fs.existsSync(path.join(DIR, iso2))
      : fs.existsSync(path.join(DIR, iso2 + '.json'));
    check(ok, 'index matches files for ' + iso2);
  }

  if (errors) { console.error('\n' + errors + ' check(s) failed.'); process.exit(1); }
  console.log('validate-postal: all checks passed.');
}

main();
