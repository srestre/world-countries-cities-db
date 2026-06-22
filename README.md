<div align="center">

# World Countries, States & Cities Database

Granular, **bilingual (EN/ES)** dataset of **countries, states and cities** in
**JSON, CSV, SQL and YAML**, split by country, region, subregion and bundle for
lightweight CDN calls. A lightweight open-data alternative to heavier sources like
GeoNames for country / state / city lookups and lists.

[![License](https://img.shields.io/badge/license-MIT_%2B_ODbL-blue?style=for-the-badge)](#license)
[![Stars](https://img.shields.io/github/stars/srestre/world-countries-cities-db?style=for-the-badge)](https://github.com/srestre/world-countries-cities-db/stargazers)
[![Last commit](https://img.shields.io/github/last-commit/srestre/world-countries-cities-db?style=for-the-badge)](https://github.com/srestre/world-countries-cities-db/commits/main)
[![CDN](https://img.shields.io/badge/CDN-jsDelivr-e84d3d?style=for-the-badge)](https://www.jsdelivr.com/package/gh/srestre/world-countries-cities-db)

![Countries](https://img.shields.io/badge/countries-250-brightgreen?style=for-the-badge)
![States](https://img.shields.io/badge/states-5%2C308-brightgreen?style=for-the-badge)
![Cities](https://img.shields.io/badge/cities-156%2C025-brightgreen?style=for-the-badge)
![Formats](https://img.shields.io/badge/formats-JSON_CSV_SQL_YAML-orange?style=for-the-badge)
![Labels](https://img.shields.io/badge/labels-EN_%2F_ES-blueviolet?style=for-the-badge)

| Regions | Subregions | Countries | States | Cities | Formats |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 6 | 22 | 250 | 5,308 | 156,025 | 4 |

</div>

## Bilingual data (English + Spanish)

Display labels are provided in both languages so a frontend can render either one:

| Field | English | Spanish |
|-------|---------|---------|
| Country name | `name` | `name_es` |
| Region name | `region` | `region_es` |
| Subregion name | `subregion` | `subregion_es` |
| State/division type | `type` | `type_es` |
| Bundle name | `name` | `name_es` |

Plus `native` (the local name) for countries and states. **City names are proper nouns
and have a single form** (the same in both languages). Structure, slugs, JSON keys and code
stay in English; only the human-facing labels are bilingual.

## Why it exists (the problem)

The full combined world file is **47MB**: impossible to load in a frontend or to request
whole every time. Here it is split into **~2250 files** across several granularity levels,
so each call fetches only its slice.

## Call levels (the point)

Every level is an independent file. Pick the smallest one that answers your need:

| You want... | Request this file |
|-------------|-------------------|
| One country (full hierarchy) | `/countries/CO.json`, `/countries/US.json` |
| One country's flat city list (for a dropdown) | `/flat-cities/CO.json` |
| A whole region | `/regions/europe.json`, `/regions/americas.json` |
| A subregion | `/subregions/south-america.json`, `/subregions/caribbean.json` |
| A curated business group | `/bundles/latam.json`, `/bundles/north-america.json` |
| One state of a large country | `/large-countries/US/states/california.json` |
| Metadata for every country | `/metadata/countries.json` |
| A richer, ready-to-use LATAM country/city set | `/latam/countries.json`, `/latam/cities/colombia.json` |

## Structure

```
/metadata/
    countries.json|.csv|.yml   250 countries with metadata (bilingual names, ISO2/3, region/subregion, currency, flag, population...)
    index.json                 { iso2: { name, name_es, iso3, region, region_es, subregion, subregion_es } }
    regions.json               tree region -> subregion -> [iso2] + bilingual indexes with counts
    bundles.json               { slug: { name, name_es, countries: [iso2] } }
/countries/<ISO2>.{json,csv,sql,yml}            hierarchical: country -> states -> cities (multi-format, bilingual)
/regions/<slug>.{json,csv,sql,yml}              every country in a region (multi-format)
/subregions/<slug>.{json,csv,sql,yml}           every country in a subregion (multi-format)
/bundles/<slug>.{json,csv,sql,yml}              curated groups (multi-format)
/flat-cities/<ISO2>.{json,csv}                  flat array of city names per country (dedup + locale sort)
/large-countries/<ISO2>/states/<slug>.{json,csv}   per-state drill-down (US, BR, MX, IN, CA, AU, RU, CN)
/latam/                                         richer, ready-to-use LATAM set for dropdowns (slug-keyed, bilingual, Colombia first)
    countries.json                              20 countries: { slug, name_en, name_es, iso2, iso3 }
    index.json                                  { slug: { name_en, name_es, iso2, iso3 } }
    cities/<slug>.json                          flat city array per country
    latam-cities.json                           consolidated { slug: [cities...] }
/scripts/build.js                               builds the worldwide data
/scripts/build-latam.js                         builds the LATAM set
/scripts/validate.js                            integrity check of the generated output
/package.json                                   npm scripts: build, build:latam, build:all, validate
```

## Formats per level

Every level is listed below with the formats it ships. JSON is always present; the richer
levels also ship CSV, SQL and YAML.

| Level | Path | JSON | CSV | SQL | YAML |
|-------|------|:----:|:---:|:---:|:----:|
| Countries | `/countries/<ISO2>` | yes | yes | yes | yes |
| Regions | `/regions/<slug>` | yes | yes | yes | yes |
| Subregions | `/subregions/<slug>` | yes | yes | yes | yes |
| Bundles | `/bundles/<slug>` | yes | yes | yes | yes |
| Metadata | `/metadata/*` | yes | yes | yes | yes |
| Flat cities | `/flat-cities/<ISO2>` | yes | yes | - | - |
| Large countries (per state) | `/large-countries/<ISO2>/states/<slug>` | yes | yes | - | - |
| LATAM set | `/latam/*` | yes | - | - | - |

## Data schema reference

**JSON (hierarchical, e.g. `/countries/CO.json`)** is an array of country objects:

```
country: name, name_es, native, iso2, iso3, numeric_code, phonecode, capital,
         currency, currency_name, currency_symbol, tld, region, region_es,
         subregion, subregion_es, latitude, longitude, emoji, states[]
  state: name, native, code, iso3166_2, type, type_es, latitude, longitude, cities[]
   city: name, latitude, longitude
```

**CSV (hierarchical)** is one row per city, header:

```
country_iso2, country_name, country_name_es, region, region_es, subregion, subregion_es,
state_code, state_name, state_type, state_type_es, city_name, latitude, longitude
```

**SQL** creates `countries`, `states`, `cities` (with the source `id`s for joins) and
inserts the scoped rows. Bilingual columns included:

```
countries(id, name, name_es, iso2, iso3, region, region_es, subregion, subregion_es,
          capital, currency, latitude, longitude, emoji)
states(id, name, native, country_id, country_code, state_code, type, type_es,
       latitude, longitude)
cities(id, name, state_id, country_id, latitude, longitude)
```

**YAML** mirrors the JSON hierarchy. **`/flat-cities`** is a plain array of city-name
strings (JSON) or a single `city` column (CSV). JSON is compact, UTF-8, non-ASCII unescaped.

## jsDelivr URLs

Every file is served over the jsDelivr CDN.

> Note: jsDelivr's website file browser and Statistics page do not list this repo because it
> is larger than jsDelivr's 50MB package-explorer limit. This does not affect delivery:
> individual files load normally over `cdn.jsdelivr.net/gh/...`. To browse all files, use the
> GitHub repository.

Pattern:

```
https://cdn.jsdelivr.net/gh/srestre/world-countries-cities-db@main/<path>
```

Examples across the different levels:

```
.../countries/CO.json
.../flat-cities/MX.json
.../regions/europe.json
.../subregions/south-america.json
.../bundles/latam.json
.../large-countries/US/states/california.json
.../latam/countries.json
```

For production, pin to a commit: replace `@main` with `@<commit-hash>`.

### Versioning and caching

- `@main` serves the latest commit, but jsDelivr caches it (about 12h on the CDN, up to
  7 days in the browser), so a push is not reflected instantly. Force a refresh with
  `https://purge.jsdelivr.net/gh/srestre/world-countries-cities-db@main/<path>`.
- `@<commit-hash>` (and git tags / semver like `@v1.0.0` or `@1`) are immutable and cached
  permanently. Pin a commit or a tag in production.
- Files are served with `Access-Control-Allow-Origin: *`, so you can `fetch` them directly
  from any browser or site.

## Regions

| Region | slug | name_es | Countries | Cities |
|--------|------|---------|----------:|-------:|
| Asia | asia | Asia | 50 | 25344 |
| Europe | europe | Europa | 53 | 75598 |
| Africa | africa | África | 60 | 4724 |
| Oceania | oceania | Oceanía | 27 | 4740 |
| Americas | americas | América | 57 | 45619 |
| Polar | polar | Regiones polares | 1 | 0 |

## American subregions

| Subregion | slug | name_es | Countries |
|-----------|------|---------|----------:|
| Caribbean | caribbean | Caribe | 28 |
| South America | south-america | Sudamérica | 15 |
| Central America | central-america | Centroamérica | 7 |
| Northern America | northern-america | Norteamérica | 7 |

> Taxonomy note: the upstream source places **Mexico in "Northern America"**, not Central
> America. That is why the curated **bundles** exist (LATAM is not a region/subregion in the
> source).

## Curated bundles

Bundle files carry `name` and `name_es`.

| Bundle slug | name | name_es | Countries | ISO2 |
|-------------|------|---------|----------:|------|
| latam | Latin America | América Latina | 20 | CO, AR, BO, BR, CL, CR, CU, EC, SV, GT, HN, MX, NI, PA, PY, PE, PR, DO, UY, VE |
| north-america | North America | Norteamérica | 3 | US, CA, MX |
| central-america | Central America | Centroamérica | 7 | BZ, CR, SV, GT, HN, NI, PA |
| south-america | South America | Sudamérica | 12 | AR, BO, BR, CL, CO, EC, GY, PY, PE, SR, UY, VE |
| caribbean | Caribbean | Caribe | 14 | CU, DO, PR, HT, JM, TT, BS, BB, DM, GD, KN, LC, VC, AG |

Edit the `BUNDLES` object in `scripts/build.js` to add or change groups.

## Totals

- **250** countries, **5308** states, **156025** cities.
- **~2250** files, ~203MB total. Largest single file is under 10MB (well within GitHub limits).
- These totals cover the country/state/city data only. Postal codes (see below) add their own `/postal-codes` tree.

## Postal codes (GeoNames, CC BY 4.0)

Worldwide postal codes live under `/postal-codes`, one file per country. **121 countries,
3,190,093 postal codes** (~1.3 GB across ~708 files; every file stays under 15 MB).

- `postal-codes/<ISO2>.json` and `postal-codes/<ISO2>.csv` - all postal codes for one country.
- `postal-codes/<ISO2>/<admin1-slug>.{json,csv}` - for large countries (over 15MB, and always CA / NL) the data is split by first-level admin region.
- `postal-codes/bundles/<region>.json` - lightweight regional manifests (member countries, record counts and file paths). Bundles are indexes, not data concatenations.
- `postal-codes/index.json` - per-country coverage (record count, split flag).

Each record: `country_code`, `country_name`, `country_name_es`, `postal_code`, `place`, `admin1` (+ `admin1_code`), `admin2` (+ `admin2_code`), `admin3` (+ `admin3_code`), `latitude`, `longitude`, `accuracy`, `slug`.

Example (jsDelivr): `https://cdn.jsdelivr.net/gh/srestre/world-countries-cities-db@main/postal-codes/CO.json`

Source: GeoNames (https://www.geonames.org/), CC BY 4.0. Coverage is limited to the countries
GeoNames publishes; some are partial (AR, BR, CL, CN, IE, MT, GB) and CA / NL use the fuller
`*_full` dumps. The data is served as-is. See [`LICENSE-DATA-POSTAL`](LICENSE-DATA-POSTAL) for
attribution and the full coverage notes.

## Note on source noise

The data can carry some noise (misclassified names, entries that are neighborhoods, or
cities that appear in the wrong country due to upstream errors). It is served as-is; if you
need a curated list for a country, filter on your application side.

## Usage examples

Framework-agnostic vanilla JavaScript. Everything is plain `fetch` over static JSON, so it
works in any stack.

**Load a whole region, subregion or bundle (one request):**

```js
const BASE = 'https://cdn.jsdelivr.net/gh/srestre/world-countries-cities-db@main';
const europe = await (await fetch(BASE + '/regions/europe.json')).json();        // 53 countries
const latam  = await (await fetch(BASE + '/bundles/latam.json')).json();          // 20 countries
const sa     = await (await fetch(BASE + '/subregions/south-america.json')).json();
```

**Chained Country -> City select (worldwide, keyed by ISO2 code):**

```js
const BASE = 'https://cdn.jsdelivr.net/gh/srestre/world-countries-cities-db@main';
// 1) country list from metadata (name + name_es), 2) cities from /flat-cities/<ISO2>.json
const countries = await (await fetch(BASE + '/metadata/countries.json')).json();
const cities = await (await fetch(BASE + '/flat-cities/CO.json')).json();
```

**Chained Country -> City select (LATAM, richer list, slug-keyed):**

```html
<select id="country"></select>
<select id="city"></select>
<script>
(function () {
  var BASE = 'https://cdn.jsdelivr.net/gh/srestre/world-countries-cities-db@main/latam';
  var selCountry = document.querySelector('#country');
  var selCity = document.querySelector('#city');
  if (!selCountry || !selCity) return;
  fetch(BASE + '/countries.json').then(function (r) { return r.json(); }).then(function (countries) {
    selCountry.innerHTML = '<option value="">Country</option>';
    countries.forEach(function (c) {
      var o = document.createElement('option'); o.value = c.slug; o.textContent = c.name_es; selCountry.appendChild(o);
    });
  });
  selCountry.addEventListener('change', function () {
    var slug = selCountry.value; selCity.innerHTML = '<option value="">City</option>'; if (!slug) return;
    fetch(BASE + '/cities/' + slug + '.json').then(function (r) { return r.json(); }).then(function (cities) {
      cities.forEach(function (c) { var o = document.createElement('option'); o.value = c; o.textContent = c; selCity.appendChild(o); });
    });
  });
})();
</script>
```

Switch `name_es` to `name_en` (LATAM) or `name` (worldwide metadata) for English labels.

## Scripts (optional, only to regenerate or validate the data)

The data files in this repo are **pre-generated and committed**. To *use* the data you do
**not** need the scripts at all: just fetch the JSON/CSV/SQL/YAML (via the CDN, a clone, or
the GitHub API). The scripts exist only to **(re)generate, update and validate** the data and
to document, reproducibly, how it is derived. There are two builders (one per data source)
plus one validator.

| Script | Purpose | Reads from | Runtime |
|--------|---------|-----------|---------|
| `scripts/build.js` | builds the whole worldwide dataset: `/countries`, `/regions`, `/subregions`, `/bundles`, `/flat-cities`, `/large-countries`, `/metadata` (all four formats) | the upstream combined world file (~47MB), downloaded once | ~10s |
| `scripts/build-latam.js` | builds the richer `/latam` set (20 countries, slug-keyed) | the 20 LATAM country files | ~1s |
| `scripts/validate.js` | integrity check of the generated output: JSON/CSV/SQL/YAML parse, format consistency, slug collisions, bilingual completeness, file sizes. Exits non-zero on any error | the files already in the repo | ~3s |

All three are plain Node.js (v20+), **zero dependencies**, and re-runnable. Run the builders
only when the upstream data changes or when you change the structure (add a bundle, add a
large country, adjust a translation), then run the validator before committing.

Using the `package.json` scripts:

```bash
npm run build        # worldwide data  (scripts/build.js)
npm run build:latam  # LATAM set       (scripts/build-latam.js)
npm run build:all    # both builders
npm run validate     # integrity check (scripts/validate.js)
```

Or directly with node:

```bash
node --max-old-space-size=4096 scripts/build.js
node scripts/build-latam.js
node scripts/validate.js
```

## Contributing

The data files are generated. Do not hand-edit them: change `scripts/build.js` or
`scripts/build-latam.js` and re-run, then run `npm run validate` before committing. Good
first changes: add or adjust a bundle (the `BUNDLES` object), add a large country for
per-state drill-down (`LARGE_COUNTRIES`), or refine a Spanish translation
(`REGION_ES` / `SUBREGION_ES` / `STATE_TYPE_ES`).

## Resumen (español)

Base de datos mundial de **países, estados y ciudades** (JSON, CSV, SQL, YAML), dividida en
piezas granulares por país, región, subregión y grupo (bundle) para hacer llamadas ligeras
por CDN sin descargar todo. Nombres **bilingües inglés/español**. Incluye una sección LATAM
lista para un **select encadenado país -> ciudad** (con Colombia primero).

## Sources, license and acknowledgements

### Sources

This is a derivative database built from open sources. The country / state / city data comes
from two sources under the **Open Database License (ODbL) v1.0**; the postal codes come from
**GeoNames** under **CC BY 4.0**:

- **[dr5hn/countries-states-cities-database](https://github.com/dr5hn/countries-states-cities-database)**
  (Darshan Gada): the worldwide data (250 countries) and everything outside `/latam`. ODbL.
- **[Yerikmiller/Countries-States-Cities-JSON](https://github.com/Yerikmiller/Countries-States-Cities-JSON)**
  (a dr5hn derivative): the richer LATAM city lists under `/latam`. ODbL.
- **[GeoNames](https://www.geonames.org/)**: the worldwide postal codes under `/postal-codes`. CC BY 4.0.

For the 20 LATAM countries you therefore have two interchangeable options in this same repo:

| Path | Source | Keyed by | Shape | Cities (Colombia) |
|------|--------|----------|-------|------------------:|
| `/latam/cities/<slug>.json` | Yerikmiller | slug (`colombia`) | flat names | 1220 |
| `/flat-cities/<ISO2>.json` | dr5hn | ISO2 (`CO`) | flat names | 1038 |
| `/bundles/latam.json` | dr5hn | ISO2 | full hierarchy | - |

Use `/latam/...` for the richer dropdown; use the dr5hn paths when you want a single source
consistent with the rest of the world data. Note: the `/latam` files use `name_en` for the
English key, while the rest of the repo uses `name`. Both use `name_es` for Spanish.

### License

This project is **triple-licensed** by area:

- **City data** (`/countries`, `/regions`, `/subregions`, `/bundles`, `/flat-cities`,
  `/large-countries`, `/latam`, `/metadata`): **Open Database License (ODbL) v1.0**, see
  [`LICENSE`](LICENSE). The data is a derivative of the two ODbL sources above;
  attribution to both is required and any adapted database must stay under ODbL.
- **Postal data** (`/postal-codes`): **Creative Commons Attribution 4.0 (CC BY 4.0)**, see
  [`LICENSE-DATA-POSTAL`](LICENSE-DATA-POSTAL); attribution to GeoNames (link to
  www.geonames.org) is required.
- **Code** (`/scripts`): **MIT License**, Copyright (c) 2026 srestre, see
  [`LICENSE-CODE`](LICENSE-CODE).

### Acknowledgements

Huge thanks to the authors whose open data makes this project possible:

- **Darshan Gada (dr5hn)** for [countries-states-cities-database](https://github.com/dr5hn/countries-states-cities-database),
  the comprehensive worldwide dataset that powers everything outside `/latam`.
- **Yerikmiller** for [Countries-States-Cities-JSON](https://github.com/Yerikmiller/Countries-States-Cities-JSON),
  the richer LATAM city lists used in `/latam`.
- **GeoNames** for the worldwide [postal code data](https://www.geonames.org/) under `/postal-codes`.

The dr5hn and Yerikmiller datasets are released under the Open Database License (ODbL) v1.0;
the GeoNames postal data under CC BY 4.0. Thank you for keeping this data open and well
maintained. This repository would not exist without your work.

> Built with AI assistance (tooling, scripts and docs). The data itself comes from the cited ODbL sources, not generated by AI.
>
> Hecho con asistencia de IA (herramientas, scripts y documentación). Los datos provienen de las fuentes ODbL citadas, no fueron generados por IA.