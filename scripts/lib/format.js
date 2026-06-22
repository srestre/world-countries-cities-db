'use strict';
/*
 * format.js - generic, reusable output helpers shared by build.js and
 * build-postal.js (slugs, number coercion, JSON/CSV/YAML emitters and SQL
 * value escaping). Domain-specific emitters (trimCountry, the writeSQL schema,
 * cityRows) stay in build.js.
 *
 * SPDX-License-Identifier: MIT
 */

const fs = require('fs');

function slug(s) {
  return String(s == null ? '' : s)
    .normalize('NFD').replace(/[̀-ͯ]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

function ensureDir(dir) {
  fs.mkdirSync(dir, { recursive: true });
}

function writeJSON(file, obj) {
  fs.writeFileSync(file, JSON.stringify(obj), 'utf8');
}

function num(v) {
  if (v === null || v === undefined || v === '') return null;
  const n = Number(v);
  return Number.isFinite(n) ? n : null;
}

// ----- CSV ------------------------------------------------------------------

function csvField(v) {
  if (v === null || v === undefined) return '';
  let s = String(v);
  // CSV formula-injection guard: a spreadsheet (Excel/Sheets) treats a text cell starting
  // with = + - @ TAB or CR as a formula. Numbers (lat/long) are typeof 'number', so a
  // negative coordinate is never touched; only risky text values get a leading apostrophe.
  if (typeof v === 'string' && /^[=+\-@\t\r]/.test(s)) s = "'" + s;
  if (/[",\n\r]/.test(s) || s !== s.trim()) return '"' + s.replace(/"/g, '""') + '"';
  return s;
}

function writeCSV(file, columns, rows) {
  const out = [columns.join(',')];
  for (const r of rows) out.push(columns.map((c) => csvField(r[c])).join(','));
  fs.writeFileSync(file, out.join('\n') + '\n', 'utf8');
}

// ----- YAML (minimal block emitter) ----------------------------------------

function yamlScalar(v) {
  if (v === null || v === undefined) return 'null';
  if (typeof v === 'number' || typeof v === 'boolean') return String(v);
  return JSON.stringify(String(v)); // double-quoted is valid YAML and escapes everything
}

function yamlLines(value, indent, out) {
  const pad = '  '.repeat(indent);
  if (Array.isArray(value)) {
    if (!value.length) { out.push(pad + '[]'); return; }
    for (const item of value) {
      if (item !== null && typeof item === 'object') {
        out.push(pad + '-');
        yamlLines(item, indent + 1, out);
      } else {
        out.push(pad + '- ' + yamlScalar(item));
      }
    }
    return;
  }
  if (value !== null && typeof value === 'object') {
    const keys = Object.keys(value);
    if (!keys.length) { out.push(pad + '{}'); return; }
    for (const k of keys) {
      const v = value[k];
      if (v !== null && typeof v === 'object') {
        out.push(pad + k + ':');
        yamlLines(v, indent + 1, out);
      } else {
        out.push(pad + k + ': ' + yamlScalar(v));
      }
    }
    return;
  }
  out.push(pad + yamlScalar(value));
}

function writeYAML(file, obj) {
  const out = [];
  yamlLines(obj, 0, out);
  fs.writeFileSync(file, out.join('\n') + '\n', 'utf8');
}

// ----- SQL value escaping ---------------------------------------------------

function sqlStr(v) {
  if (v === null || v === undefined || v === '') return 'NULL';
  // Double backslashes (MySQL default mode treats \ as an escape) and single quotes.
  return "'" + String(v).replace(/\\/g, '\\\\').replace(/'/g, "''") + "'";
}

function sqlNum(v) {
  const n = num(v);
  return n === null ? 'NULL' : String(n);
}

function sqlId(v) {
  if (v === null || v === undefined || v === '') return 'NULL';
  const n = Number(v);
  return Number.isFinite(n) ? String(Math.trunc(n)) : 'NULL';
}

function flushInserts(table, cols, valuesArr, out) {
  const CHUNK = 500;
  for (let i = 0; i < valuesArr.length; i += CHUNK) {
    const chunk = valuesArr.slice(i, i + CHUNK);
    out.push(`INSERT INTO ${table} (${cols.join(', ')}) VALUES\n` + chunk.join(',\n') + ';');
  }
}

module.exports = {
  slug, num, ensureDir, writeJSON, csvField, writeCSV,
  yamlScalar, yamlLines, writeYAML, sqlStr, sqlNum, sqlId, flushInserts,
};
