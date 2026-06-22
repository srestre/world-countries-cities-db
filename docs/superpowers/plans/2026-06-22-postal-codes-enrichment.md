# Worldwide Postal Codes Enrichment Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a worldwide postal-codes data layer (`/postal-codes`) to the repo from GeoNames, in JSON+CSV per country plus lightweight regional manifest bundles, without touching the existing data.

**Architecture:** A new standalone pipeline (`scripts/build-postal.js`) downloads the GeoNames `allCountries.zip` (plus `CA_full`/`NL_full`), unzips it with a zero-dependency reader, transforms each row to a faithful record enriched with country context and a slug, writes one JSON+CSV per country (splitting countries over ~15 MB by admin1), and emits per-region manifest indexes. Generic formatters and the bundle config are extracted from `build.js` into `scripts/lib/` so both pipelines share one copy. Verification is via Node's built-in test runner plus a `validate-postal.js` script (no new dependencies).

**Tech Stack:** Node.js >=20 (built-in `fetch`, `zlib`, `node:test`, `node:assert`). Zero npm dependencies.

## Global Constraints

- Node.js >=20. Zero npm dependencies (no `npm install`, ever). Tests use `node --test` with `node:test` + `node:assert/strict`.
- No em-dash / en-dash anywhere (code, comments, docs, commits). Only the ASCII hyphen `-`. Enforced by a hook.
- Commits: frequent, one per task minimum, never add a `Co-Authored-By` trailer.
- Network: only hardcoded HTTPS URLs to `https://download.geonames.org/`. No other hosts.
- Path-safety guard: any value used to build a filename must match `^[A-Za-z]{2}$` (country code) or be a `slug()` output; drop anything else.
- CSV formula-injection guard: text cells starting with `= + - @ TAB CR` get a leading apostrophe (already in `csvField`).
- Anti prototype-pollution: index objects keyed by upstream values use `Object.create(null)`.
- File size: no generated file may exceed 15 MB (jsDelivr serves <~20 MB; GitHub blocks >100 MB). Countries over 15 MB and always CA/NL are split by admin1.
- Data license: GeoNames postal data is CC BY 4.0 and MUST be attributed (link to www.geonames.org). Code stays MIT; existing dr5hn data stays ODbL.
- JSON output is compact (no pretty-print), UTF-8, non-ASCII left unescaped, matching `build.js`.

---

### Task 1: Extract shared formatters and bundle config into `scripts/lib/`

**Files:**
- Create: `scripts/lib/format.js`
- Create: `scripts/lib/groups.js`
- Create: `test/format.test.js`
- Modify: `scripts/build.js` (replace local helper definitions with requires)

**Interfaces:**
- Produces: `scripts/lib/format.js` exporting `slug(s)`, `num(v)`, `ensureDir(dir)`, `writeJSON(file, obj)`, `csvField(v)`, `writeCSV(file, columns, rows)`, `writeYAML(file, obj)`, `yamlScalar(v)`, `yamlLines(value, indent, out)`, `sqlStr(v)`, `sqlNum(v)`, `sqlId(v)`, `flushInserts(table, cols, valuesArr, out)`.
- Produces: `scripts/lib/groups.js` exporting `BUNDLES` (object keyed by bundle slug, each `{ name, name_es, iso2: string[] }`).

- [ ] **Step 1: Write the failing test**

Create `test/format.test.js`:

```js
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
```

- [ ] **Step 2: Run test to verify it fails**

Run: `cd world-countries-cities-db && node --test test/format.test.js`
Expected: FAIL with "Cannot find module '../scripts/lib/format.js'".

- [ ] **Step 3: Create `scripts/lib/format.js`**

Move these functions verbatim out of `scripts/build.js` (lines ~200-436): `slug`, `ensureDir`, `writeJSON`, `num`, `csvField`, `writeCSV`, `yamlScalar`, `yamlLines`, `writeYAML`, `sqlStr`, `sqlNum`, `sqlId`, `flushInserts`. Wrap with the header and exports:

```js
'use strict';
/*
 * format.js - generic, reusable output helpers shared by build.js and
 * build-postal.js (slugs, number coercion, JSON/CSV/YAML emitters and SQL
 * value escaping). Domain-specific emitters (trimCountry, writeSQL schema,
 * cityRows) stay in build.js.
 *
 * SPDX-License-Identifier: MIT
 */
const fs = require('fs');

// ... paste slug, ensureDir, writeJSON, num, csvField, writeCSV, yamlScalar,
// yamlLines, writeYAML, sqlStr, sqlNum, sqlId, flushInserts verbatim ...

module.exports = {
  slug, num, ensureDir, writeJSON, csvField, writeCSV,
  yamlScalar, yamlLines, writeYAML, sqlStr, sqlNum, sqlId, flushInserts,
};
```

- [ ] **Step 4: Create `scripts/lib/groups.js`**

Move the `BUNDLES` object verbatim out of `scripts/build.js` (lines ~44-53):

```js
'use strict';
/*
 * groups.js - curated regional bundle definitions (sets of ISO2 codes) shared
 * by build.js (city bundles) and build-postal.js (postal manifest bundles).
 * SPDX-License-Identifier: MIT
 */
const BUNDLES = {
  latam: {
    name: 'Latin America', name_es: 'América Latina',
    iso2: ['CO', 'AR', 'BO', 'BR', 'CL', 'CR', 'CU', 'EC', 'SV', 'GT', 'HN', 'MX', 'NI', 'PA', 'PY', 'PE', 'PR', 'DO', 'UY', 'VE'],
  },
  'north-america': { name: 'North America', name_es: 'Norteamérica', iso2: ['US', 'CA', 'MX'] },
  'central-america': { name: 'Central America', name_es: 'Centroamérica', iso2: ['BZ', 'CR', 'SV', 'GT', 'HN', 'NI', 'PA'] },
  'south-america': { name: 'South America', name_es: 'Sudamérica', iso2: ['AR', 'BO', 'BR', 'CL', 'CO', 'EC', 'GY', 'PY', 'PE', 'SR', 'UY', 'VE'] },
  caribbean: { name: 'Caribbean', name_es: 'Caribe', iso2: ['CU', 'DO', 'PR', 'HT', 'JM', 'TT', 'BS', 'BB', 'DM', 'GD', 'KN', 'LC', 'VC', 'AG'] },
};

module.exports = { BUNDLES };
```

- [ ] **Step 5: Rewire `scripts/build.js`**

At the top of `build.js`, after `const path = require('path');`, add:

```js
const {
  slug, num, ensureDir, writeJSON, csvField, writeCSV,
  yamlScalar, yamlLines, writeYAML, sqlStr, sqlNum, sqlId, flushInserts,
} = require('./lib/format.js');
const { BUNDLES } = require('./lib/groups.js');
```

Then DELETE from `build.js` the now-duplicated definitions of: `BUNDLES`, `slug`, `ensureDir`, `writeJSON`, `num`, `csvField`, `writeCSV`, `yamlScalar`, `yamlLines`, `writeYAML`, `sqlStr`, `sqlNum`, `sqlId`, `flushInserts`. Keep everything else (`trimCountry`, `cityRows`, `writeSQL`, `SQL_SCHEMA`, region maps, `main`, etc.) untouched.

- [ ] **Step 6: Run unit tests to verify they pass**

Run: `node --test test/format.test.js`
Expected: PASS (5 tests).

- [ ] **Step 7: Characterization check - build.js output must be byte-identical**

Run: `node --max-old-space-size=4096 scripts/build.js && git status --porcelain`
Expected: command succeeds and `git status --porcelain` prints NOTHING (no data file changed by the refactor). If any data file changed, the extraction altered behavior; fix before committing.

- [ ] **Step 8: Commit**

```bash
git add scripts/lib/format.js scripts/lib/groups.js scripts/build.js test/format.test.js
git commit -m "Refactor: extract shared formatters and bundle config to scripts/lib"
```

---

### Task 2: Zero-dependency ZIP reader `scripts/lib/unzip.js`

**Files:**
- Create: `scripts/lib/unzip.js`
- Create: `test/unzip.test.js`
- Create: `test/fixtures/sample-deflate.zip`, `test/fixtures/sample-stored.zip` (binary fixtures)

**Interfaces:**
- Produces: `scripts/lib/unzip.js` exporting `unzip(buffer)` returning a `Map<string, Buffer>` of entry filename to uncompressed bytes.

- [ ] **Step 1: Generate the test fixtures**

Run (creates two tiny zips containing the same `sample.txt`, one deflated, one stored):

```bash
mkdir -p test/fixtures
python3 - <<'PY'
import zipfile
content = b"CO\t050001\tMedellin\tAntioquia\t02\tMedellin\t05001\t\t\t6.2518\t-75.5636\t4\n"
for name, comp in [("sample-deflate.zip", zipfile.ZIP_DEFLATED), ("sample-stored.zip", zipfile.ZIP_STORED)]:
    with zipfile.ZipFile("test/fixtures/" + name, "w", comp) as z:
        z.writestr("sample.txt", content)
print("fixtures written")
PY
```

- [ ] **Step 2: Write the failing test**

Create `test/unzip.test.js`:

```js
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
```

- [ ] **Step 3: Run test to verify it fails**

Run: `node --test test/unzip.test.js`
Expected: FAIL with "Cannot find module '../scripts/lib/unzip.js'".

- [ ] **Step 4: Create `scripts/lib/unzip.js`**

```js
'use strict';
/*
 * unzip.js - minimal, dependency-free ZIP reader. Parses the End Of Central
 * Directory + central directory and inflates each entry with zlib. Supports
 * compression method 0 (stored) and 8 (deflate). Assumes non-ZIP64 archives
 * (entry/archive sizes fit in 32 bits), which holds for the GeoNames postal
 * dumps. SPDX-License-Identifier: MIT
 */
const zlib = require('zlib');

const EOCD_SIG = 0x06054b50;
const CEN_SIG = 0x02014b50;
const LOC_SIG = 0x04034b50;

function findEOCD(buf) {
  const min = Math.max(0, buf.length - 22 - 0xffff);
  for (let i = buf.length - 22; i >= min; i--) {
    if (buf.readUInt32LE(i) === EOCD_SIG) return i;
  }
  throw new Error('unzip: End Of Central Directory not found');
}

function unzip(buf) {
  const eocd = findEOCD(buf);
  const count = buf.readUInt16LE(eocd + 10);
  let p = buf.readUInt32LE(eocd + 16);
  const out = new Map();
  for (let n = 0; n < count; n++) {
    if (buf.readUInt32LE(p) !== CEN_SIG) throw new Error('unzip: bad central directory entry');
    const method = buf.readUInt16LE(p + 10);
    const compSize = buf.readUInt32LE(p + 20);
    const nameLen = buf.readUInt16LE(p + 28);
    const extraLen = buf.readUInt16LE(p + 30);
    const commentLen = buf.readUInt16LE(p + 32);
    const localOff = buf.readUInt32LE(p + 42);
    const name = buf.toString('utf8', p + 46, p + 46 + nameLen);
    if (buf.readUInt32LE(localOff) !== LOC_SIG) throw new Error('unzip: bad local header');
    const locNameLen = buf.readUInt16LE(localOff + 26);
    const locExtraLen = buf.readUInt16LE(localOff + 28);
    const dataStart = localOff + 30 + locNameLen + locExtraLen;
    const comp = buf.subarray(dataStart, dataStart + compSize);
    let data;
    if (method === 0) data = Buffer.from(comp);
    else if (method === 8) data = zlib.inflateRawSync(comp);
    else throw new Error('unzip: unsupported compression method ' + method);
    out.set(name, data);
    p += 46 + nameLen + extraLen + commentLen;
  }
  return out;
}

module.exports = { unzip };
```

- [ ] **Step 5: Run tests to verify they pass**

Run: `node --test test/unzip.test.js`
Expected: PASS (2 tests).

- [ ] **Step 6: Commit**

```bash
git add scripts/lib/unzip.js test/unzip.test.js test/fixtures/sample-deflate.zip test/fixtures/sample-stored.zip
git commit -m "Add zero-dependency ZIP reader for GeoNames dumps"
```

---

### Task 3: Postal row parsing and record transform `scripts/lib/postal.js`

**Files:**
- Create: `scripts/lib/postal.js`
- Create: `test/postal.test.js`

**Interfaces:**
- Consumes: `slug`, `num` from `scripts/lib/format.js`.
- Produces: `scripts/lib/postal.js` exporting `POSTAL_COLS` (string[]), `parseLine(line)` returning a 12-field row object, `toRecord(row, countryName, countryNameEs)` returning the postal record object, `nullify(s)`.

- [ ] **Step 1: Write the failing test**

Create `test/postal.test.js`:

```js
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
```

- [ ] **Step 2: Run test to verify it fails**

Run: `node --test test/postal.test.js`
Expected: FAIL with "Cannot find module '../scripts/lib/postal.js'".

- [ ] **Step 3: Create `scripts/lib/postal.js`**

```js
'use strict';
/*
 * postal.js - pure helpers for GeoNames postal rows: TSV parsing and the
 * faithful-plus-context record transform. SPDX-License-Identifier: MIT
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
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `node --test test/postal.test.js`
Expected: PASS (3 tests).

- [ ] **Step 5: Commit**

```bash
git add scripts/lib/postal.js test/postal.test.js
git commit -m "Add GeoNames postal row parsing and record transform"
```

---

### Task 4: Per-country writing with admin1 split `scripts/lib/postal-write.js`

**Files:**
- Create: `scripts/lib/postal-write.js`
- Create: `test/postal-write.test.js`

**Interfaces:**
- Consumes: `slug`, `ensureDir`, `writeJSON`, `writeCSV` from `format.js`; `POSTAL_COLS` from `postal.js`.
- Produces: `scripts/lib/postal-write.js` exporting `SPLIT_THRESHOLD` (number) and `writeCountry(rootDir, iso2, records, forceSplit)` returning `{ iso2, records: number, split: boolean, files: string[] }` where `files` are repo-relative paths.

- [ ] **Step 1: Write the failing test**

Create `test/postal-write.test.js`:

```js
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
```

- [ ] **Step 2: Run test to verify it fails**

Run: `node --test test/postal-write.test.js`
Expected: FAIL with "Cannot find module '../scripts/lib/postal-write.js'".

- [ ] **Step 3: Create `scripts/lib/postal-write.js`**

```js
'use strict';
/*
 * postal-write.js - writes the per-country postal files (JSON + CSV) and, for
 * countries over the size threshold (or forced, e.g. CA/NL), splits them by
 * admin1 with a slug-collision guard, mirroring the /large-countries pattern.
 * SPDX-License-Identifier: MIT
 */
const path = require('path');
const { slug, ensureDir, writeJSON, writeCSV } = require('./format.js');
const { POSTAL_COLS } = require('./postal.js');

const SPLIT_THRESHOLD = 15 * 1024 * 1024; // 15 MB

function writeCountry(rootDir, iso2, records, forceSplit) {
  const json = JSON.stringify(records);
  const mustSplit = forceSplit || Buffer.byteLength(json, 'utf8') > SPLIT_THRESHOLD;

  if (!mustSplit) {
    writeJSON(path.join(rootDir, iso2 + '.json'), records);
    writeCSV(path.join(rootDir, iso2 + '.csv'), POSTAL_COLS, records);
    return {
      iso2, records: records.length, split: false,
      files: ['postal-codes/' + iso2 + '.json', 'postal-codes/' + iso2 + '.csv'],
    };
  }

  const dir = path.join(rootDir, iso2);
  ensureDir(dir);
  const groups = new Map();
  for (const r of records) {
    const key = r.admin1 || '_unknown';
    if (!groups.has(key)) groups.set(key, []);
    groups.get(key).push(r);
  }
  const used = new Set();
  const files = [];
  for (const [admin1, recs] of groups) {
    let s = slug(admin1) || 'admin1';
    if (used.has(s)) s += '-' + (slug(recs[0].admin1_code) || ('n' + used.size));
    used.add(s);
    writeJSON(path.join(dir, s + '.json'), recs);
    writeCSV(path.join(dir, s + '.csv'), POSTAL_COLS, recs);
    files.push('postal-codes/' + iso2 + '/' + s + '.json', 'postal-codes/' + iso2 + '/' + s + '.csv');
  }
  return { iso2, records: records.length, split: true, files };
}

module.exports = { writeCountry, SPLIT_THRESHOLD };
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `node --test test/postal-write.test.js`
Expected: PASS (3 tests).

- [ ] **Step 5: Commit**

```bash
git add scripts/lib/postal-write.js test/postal-write.test.js
git commit -m "Add per-country postal writer with admin1 split"
```

---

### Task 5: Bundle manifests and global index `scripts/lib/postal-index.js`

**Files:**
- Create: `scripts/lib/postal-index.js`
- Create: `test/postal-index.test.js`

**Interfaces:**
- Consumes: `writeJSON` from `format.js`; `BUNDLES` from `groups.js`. Entry objects of shape `{ iso2, records, split, files, country_name, country_name_es }` keyed by iso2 in a `Map`.
- Produces: `scripts/lib/postal-index.js` exporting `buildIndex(entriesByIso2)` returning a null-proto object `iso2 -> { country_name, records, split }`, and `writeBundles(bundlesDir, entriesByIso2)` writing one `<slug>.json` manifest per bundle and returning the list of slugs written.

- [ ] **Step 1: Write the failing test**

Create `test/postal-index.test.js`:

```js
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
```

- [ ] **Step 2: Run test to verify it fails**

Run: `node --test test/postal-index.test.js`
Expected: FAIL with "Cannot find module '../scripts/lib/postal-index.js'".

- [ ] **Step 3: Create `scripts/lib/postal-index.js`**

```js
'use strict';
/*
 * postal-index.js - builds the global coverage index and the lightweight
 * regional bundle manifests (member countries + counts + file paths). Bundles
 * are manifests, not data concatenations, so they stay small and jsDelivr-safe.
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
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `node --test test/postal-index.test.js`
Expected: PASS (2 tests).

- [ ] **Step 5: Commit**

```bash
git add scripts/lib/postal-index.js test/postal-index.test.js
git commit -m "Add postal bundle manifests and global coverage index"
```

---

### Task 6: Pipeline orchestration `scripts/build-postal.js`

**Files:**
- Create: `scripts/build-postal.js`

**Interfaces:**
- Consumes: `ensureDir` from `format.js`; `unzip` from `unzip.js`; `parseLine`, `toRecord` from `postal.js`; `writeCountry` from `postal-write.js`; `buildIndex`, `writeBundles` from `postal-index.js`; `metadata/index.json` (produced by `build.js`).
- Produces: the `/postal-codes` tree. Honors `POSTAL_ONLY=CO,MX` env var to limit countries (for fast smoke runs).

- [ ] **Step 1: Create `scripts/build-postal.js`**

```js
#!/usr/bin/env node
'use strict';
/*
 * build-postal.js - builds /postal-codes from GeoNames (CC BY 4.0). Downloads
 * allCountries.zip (plus CA_full/NL_full), writes one JSON+CSV per country
 * (splitting >15 MB and always CA/NL by admin1), and emits regional manifest
 * bundles + a coverage index. Country names come from metadata/index.json, so
 * run build.js first. Set POSTAL_ONLY=CO,MX to limit countries.
 *
 * Source: GeoNames postal code files, https://www.geonames.org/ (CC BY 4.0).
 * SPDX-License-Identifier: MIT  (code). Data: CC BY 4.0 (see LICENSE-DATA-POSTAL).
 */
const fs = require('fs');
const path = require('path');
const { ensureDir } = require('./lib/format.js');
const { unzip } = require('./lib/unzip.js');
const { parseLine, toRecord } = require('./lib/postal.js');
const { writeCountry } = require('./lib/postal-write.js');
const { buildIndex, writeBundles } = require('./lib/postal-index.js');

const ROOT = path.resolve(__dirname, '..');
const BASE = 'https://download.geonames.org/export/zip/';
const ALL = BASE + 'allCountries.zip';
const FULL = { CA: BASE + 'CA_full.csv.zip', NL: BASE + 'NL_full.csv.zip' };
const FORCE_SPLIT = new Set(['CA', 'NL']);

async function download(url) {
  const res = await fetch(url);
  if (!res.ok) throw new Error('download failed ' + url + ' HTTP ' + res.status);
  return Buffer.from(await res.arrayBuffer());
}

function firstTxt(map) {
  for (const [name, data] of map) if (name.endsWith('.txt')) return data;
  throw new Error('no .txt entry in archive');
}

function loadNames() {
  const p = path.join(ROOT, 'metadata', 'index.json');
  if (!fs.existsSync(p)) throw new Error('metadata/index.json missing - run build.js first');
  return JSON.parse(fs.readFileSync(p, 'utf8'));
}

function ingest(text, only, sink) {
  let start = 0;
  while (start < text.length) {
    let nl = text.indexOf('\n', start);
    if (nl === -1) nl = text.length;
    const line = text.slice(start, nl);
    start = nl + 1;
    if (!line) continue;
    const row = parseLine(line);
    if (!/^[A-Za-z]{2}$/.test(row.country_code)) continue; // path-safety
    if (only && !only.has(row.country_code)) continue;
    sink(row);
  }
}

async function main() {
  const only = process.env.POSTAL_ONLY ? new Set(process.env.POSTAL_ONLY.split(',')) : null;
  const names = loadNames();
  const dir = path.join(ROOT, 'postal-codes');
  ensureDir(dir);
  ensureDir(path.join(dir, 'bundles'));

  const byCountry = new Map();
  const add = (row) => {
    const nm = names[row.country_code] || {};
    const rec = toRecord(row, nm.name || row.country_code, nm.name_es || nm.name || row.country_code);
    if (!byCountry.has(row.country_code)) byCountry.set(row.country_code, []);
    byCountry.get(row.country_code).push(rec);
  };

  console.log('Downloading allCountries.zip ...');
  ingest(firstTxt(unzip(await download(ALL))).toString('utf8'), only, add);

  for (const iso2 of Object.keys(FULL)) {
    if (only && !only.has(iso2)) continue;
    console.log('Downloading', iso2, 'full ...');
    byCountry.set(iso2, []); // *_full supersedes the basic rows
    ingest(firstTxt(unzip(await download(FULL[iso2]))).toString('utf8'), new Set([iso2]), add);
  }

  const entries = new Map();
  for (const [iso2, records] of byCountry) {
    const nm = names[iso2] || {};
    const res = writeCountry(dir, iso2, records, FORCE_SPLIT.has(iso2));
    entries.set(iso2, Object.assign(res, {
      country_name: nm.name || iso2, country_name_es: nm.name_es || nm.name || iso2,
    }));
  }

  writeBundles(path.join(dir, 'bundles'), entries);
  fs.writeFileSync(path.join(dir, 'index.json'), JSON.stringify(buildIndex(entries)), 'utf8');

  const total = [...entries.values()].reduce((a, e) => a + e.records, 0);
  console.log('Done: ' + entries.size + ' countries, ' + total + ' postal records.');
}

main().catch((e) => { console.error('ERROR:', e.message); process.exit(1); });
```

- [ ] **Step 2: Ensure metadata exists (dependency of build-postal)**

Run: `test -f metadata/index.json || node --max-old-space-size=4096 scripts/build.js`
Expected: `metadata/index.json` is present afterward.

- [ ] **Step 3: Smoke run on a subset and inspect**

Run: `POSTAL_ONLY=CO node --max-old-space-size=4096 scripts/build-postal.js`
Expected: prints "Done: 1 countries, NNNN postal records." with NNNN > 3000.

Then verify by hand:

```bash
node -e "const a=require('./postal-codes/CO.json'); console.log(a.length, a.find(r=>r.admin2_code==='05001')?.place)"
```
Expected: a count > 3000 and a Medellin place name.

- [ ] **Step 4: Verify bundle manifest and index were written**

Run: `node -e "console.log(JSON.parse(require('fs').readFileSync('postal-codes/bundles/latam.json')).countries.map(c=>c.iso2))"`
Expected: `[ 'CO' ]` (only CO present in this subset run).

- [ ] **Step 5: Clean the subset output before the real run**

Run: `rm -rf postal-codes`
Expected: the partial subset output is removed (the full generation happens in Task 9).

- [ ] **Step 6: Commit the script (no data yet)**

```bash
git add scripts/build-postal.js
git commit -m "Add build-postal.js pipeline orchestration"
```

---

### Task 7: Validation `scripts/validate-postal.js`

**Files:**
- Create: `scripts/validate-postal.js`

**Interfaces:**
- Consumes: the `/postal-codes` tree on disk.
- Produces: exits non-zero on any failed check; prints a pass line otherwise.

- [ ] **Step 1: Create `scripts/validate-postal.js`**

```js
#!/usr/bin/env node
'use strict';
/*
 * validate-postal.js - sanity checks for the generated /postal-codes tree.
 * Mirrors the project convention of a dependency-free validator. Exits 1 on
 * any failure. SPDX-License-Identifier: MIT
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
```

- [ ] **Step 2: Generate a subset and validate it**

Run: `POSTAL_ONLY=CO,MX node --max-old-space-size=4096 scripts/build-postal.js && node scripts/validate-postal.js`
Expected: "validate-postal: all checks passed."

- [ ] **Step 3: Clean the subset output**

Run: `rm -rf postal-codes`
Expected: subset removed (full run is Task 9).

- [ ] **Step 4: Commit**

```bash
git add scripts/validate-postal.js
git commit -m "Add validate-postal.js checks"
```

---

### Task 8: License, README and package.json wiring

**Files:**
- Create: `LICENSE-DATA-POSTAL`
- Modify: `README.md` (add a postal-codes section)
- Modify: `package.json` (add scripts + update license note)

**Interfaces:**
- Produces: documentation and npm scripts `build:postal`, `validate:postal`, `test`.

- [ ] **Step 1: Create `LICENSE-DATA-POSTAL`**

```text
Postal code data in /postal-codes is sourced from GeoNames
(https://www.geonames.org/) and is licensed under the
Creative Commons Attribution 4.0 License (CC BY 4.0):
https://creativecommons.org/licenses/by/4.0/

Attribution: "Postal code data (c) GeoNames, CC BY 4.0,
https://www.geonames.org/".

Coverage notes (from the GeoNames readme):
- Roughly 121 countries are covered; countries without a postal system or
  without compatibly licensed data are absent.
- Partial data: Argentina (first 5 positions), Brazil (major codes only),
  Chile / China / Ireland / Malta (partial for copyright), Canada / Netherlands
  / United Kingdom (first part only in the base dump).
- CA and NL use the fuller CA_full / NL_full dumps. GB_full is intentionally
  excluded (contains Royal Mail copyrighted data).

This file covers ONLY the postal data. Repository code is MIT (LICENSE-CODE).
Country / state / city data from dr5hn is ODbL (LICENSE).
```

- [ ] **Step 2: Add the README section**

Append to `README.md` a new top-level section (place it after the existing data-description sections, before any license footer):

```markdown
## Postal codes (GeoNames, CC BY 4.0)

Worldwide postal codes live under `/postal-codes`, one file per country:

- `postal-codes/<ISO2>.json` and `postal-codes/<ISO2>.csv` - all postal codes
  for one country.
- `postal-codes/<ISO2>/<admin1-slug>.{json,csv}` - for large countries (over
  15 MB, and always CA / NL) the data is split by first-level admin region.
- `postal-codes/bundles/<region>.json` - lightweight regional manifests
  (member countries, record counts and file paths). Bundles are indexes, not
  data concatenations.
- `postal-codes/index.json` - per-country coverage (record count, split flag).

Each record: `country_code`, `country_name`, `country_name_es`, `postal_code`,
`place`, `admin1` (+ `admin1_code`), `admin2` (+ `admin2_code`), `admin3`
(+ `admin3_code`), `latitude`, `longitude`, `accuracy`, `slug`.

Example (jsDelivr): `https://cdn.jsdelivr.net/gh/srestre/world-countries-cities-db@main/postal-codes/CO.json`

Source: GeoNames (https://www.geonames.org/), CC BY 4.0. Coverage is about 121
countries; some are partial (AR, BR, CL, CN, IE, MT, GB). See
`LICENSE-DATA-POSTAL` for attribution and the full coverage notes.
```

- [ ] **Step 3: Update `package.json`**

Change the `scripts` block and the `//license` note:

```json
  "//license": "MIT applies to the code in /scripts (see LICENSE-CODE). Country/state/city DATA is under ODbL v1.0 (see LICENSE). Postal-code DATA is under CC BY 4.0 (see LICENSE-DATA-POSTAL).",
  "scripts": {
    "build": "node --max-old-space-size=4096 scripts/build.js",
    "build:latam": "node scripts/build-latam.js",
    "build:postal": "node --max-old-space-size=4096 scripts/build-postal.js",
    "build:all": "npm run build && npm run build:latam && npm run build:postal",
    "validate": "node scripts/validate.js",
    "validate:postal": "node scripts/validate-postal.js",
    "test": "node --test"
  },
```

- [ ] **Step 4: Run the full unit test suite**

Run: `node --test`
Expected: all tests from Tasks 1-5 PASS.

- [ ] **Step 5: Commit**

```bash
git add LICENSE-DATA-POSTAL README.md package.json
git commit -m "Document postal codes: license, README section, npm scripts"
```

---

### Task 9: Full generation, validation and publish

**Files:**
- Create (generated, committed): the entire `/postal-codes` tree.

- [ ] **Step 1: Ensure metadata is fresh**

Run: `node --max-old-space-size=4096 scripts/build.js`
Expected: regenerates the existing data (no unexpected diff) and `metadata/index.json` is present.

- [ ] **Step 2: Full worldwide generation**

Run: `node --max-old-space-size=4096 scripts/build-postal.js`
Expected: "Done: ~121 countries, ~2.8M postal records." If the process runs out of memory, raise the flag to `--max-old-space-size=8192` and re-run.

- [ ] **Step 3: Validate the generated tree**

Run: `node scripts/validate-postal.js`
Expected: "validate-postal: all checks passed."

- [ ] **Step 4: Enforce the file-size ceiling (no file over 15 MB)**

Run: `find postal-codes -type f -size +15M`
Expected: NO output. If any file is listed, that country needs splitting - add its ISO2 to `FORCE_SPLIT` in `build-postal.js`, re-run Steps 2-4.

- [ ] **Step 5: Sanity-check coverage and a split country**

Run:
```bash
node -e "const i=require('./postal-codes/index.json'); console.log('countries', Object.keys(i).length, 'CA split', i.CA && i.CA.split)"
```
Expected: roughly 121 countries and `CA split true`.

- [ ] **Step 6: Commit the data**

```bash
git add postal-codes
git commit -m "Add worldwide postal codes data from GeoNames (CC BY 4.0)"
```

- [ ] **Step 7: Push**

```bash
git push origin main
```
Expected: push succeeds (no file rejected for size). If GitHub rejects a file over 100 MB, it means a split was missed; fix `FORCE_SPLIT`, regenerate, amend, and push again.

- [ ] **Step 8: Verify on jsDelivr (CDN serves the new files)**

After the push, fetch a published file:
```bash
curl -sI "https://cdn.jsdelivr.net/gh/srestre/world-countries-cities-db@main/postal-codes/CO.json" | head -1
```
Expected: `HTTP/2 200` (CDN may take a moment to populate the first time).

---

## Self-Review

**Spec coverage:**
- Per-country JSON+CSV: Task 4 + Task 6. Covered.
- Split >15 MB / force CA-NL: Task 4 (logic) + Task 9 Step 4 (enforcement). Covered.
- Faithful + context schema with slug: Task 3. Covered.
- Bundles as manifests: Task 5. Covered.
- Global index.json: Task 5 + Task 6. Covered.
- Zero-dep unzip: Task 2. Covered.
- Shared lib refactor: Task 1. Covered.
- CA_full/NL_full supersede: Task 6 (FULL + byCountry.set reset). Covered.
- GB_full excluded: not downloaded anywhere (only allCountries + CA/NL full). Covered by omission; documented in Task 8.
- Licensing (CC BY, triple license): Task 8. Covered.
- README coverage caveats: Task 8. Covered.
- validate-postal: Task 7. Covered.
- Hardening reuse (path-safety, formula-injection, null-proto): path-safety in Task 6 ingest; formula-injection via csvField in Task 1; null-proto in Task 5 buildIndex. Covered.

**Placeholder scan:** No TBD/TODO; every code step shows complete code. Pass.

**Type consistency:** `writeCountry` returns `{ iso2, records, split, files }` (Task 4) and Task 6 augments it with `country_name`/`country_name_es`; `writeBundles`/`buildIndex` consume exactly those fields (Task 5). `POSTAL_COLS` defined once (Task 3) and consumed in Task 4. `unzip` returns `Map` (Task 2) consumed via `firstTxt` (Task 6). Consistent.
