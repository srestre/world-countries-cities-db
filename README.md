# world-countries-cities-db

Worldwide **countries, states and cities database** (JSON, CSV, SQL, YAML), **split into
granular pieces** (by country, region, subregion and bundle) so you can request only what
you need without downloading the full world file (~47MB). A lightweight open-data
alternative to heavier sources like GeoNames for country / state / city lookups and lists.

- **250 countries, 5308 states, 156025 cities.**
- Four formats per level: **JSON, CSV, SQL, YAML**.
- **Bilingual** display labels: English + Spanish (`name` / `name_es`).
- Served straight from a CDN (jsDelivr) or used as flat files in any stack.

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

> This repo is currently **private**, and jsDelivr only serves **public** repositories, so
> these CDN URLs activate once the repo is made public
> (`gh repo edit srestre/world-countries-cities-db --visibility public --accept-visibility-change-consequences`).
> While private, consume the files via clone, the GitHub API, or by self-hosting them.

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

## Scripts (optional, only to regenerate the data)

The data files in this repo are **pre-generated and committed**. To *use* the data you do
**not** need the scripts at all: just fetch the JSON/CSV/SQL/YAML (via the CDN, a clone, or
the GitHub API). The scripts exist only to **(re)generate and update** the data and to
document, reproducibly, how it is derived. There are two because there are two data sources.

| Script | Builds | Reads from | Runtime |
|--------|--------|-----------|---------|
| `scripts/build.js` | the whole worldwide dataset: `/countries`, `/regions`, `/subregions`, `/bundles`, `/flat-cities`, `/large-countries`, `/metadata` (all four formats) | the upstream combined world file (~47MB), downloaded once | ~10s |
| `scripts/build-latam.js` | the richer `/latam` set (20 countries, slug-keyed) | the 20 LATAM country files | ~1s |

Both are plain Node.js (v20+), **zero dependencies**, and re-runnable (each one overwrites
its own output). Run them only when the upstream data changes or when you change the
structure (add a bundle, add a large country, adjust a translation):

```bash
node --max-old-space-size=4096 scripts/build.js   # worldwide data
node scripts/build-latam.js                       # LATAM set
```

## Contributing

The data files are generated. Do not hand-edit them: change `scripts/build.js` or
`scripts/build-latam.js` and re-run. Good first changes: add or adjust a bundle (the
`BUNDLES` object), add a large country for per-state drill-down (`LARGE_COUNTRIES`), or
refine a Spanish translation (`REGION_ES` / `SUBREGION_ES` / `STATE_TYPE_ES`).

## Resumen (español)

Base de datos mundial de **países, estados y ciudades** (JSON, CSV, SQL, YAML), dividida en
piezas granulares por país, región, subregión y grupo (bundle) para hacer llamadas ligeras
por CDN sin descargar todo. Nombres **bilingües inglés/español**. Incluye una sección LATAM
lista para un **select encadenado país -> ciudad** (con Colombia primero).

## Keywords

World cities database, countries states cities JSON, country state city API, list of
countries and cities, world cities CSV / SQL, country city dropdown data, GeoNames
alternative, open data geodata dataset.

Base de datos de países y ciudades, listado de países, base de datos de ciudades del mundo,
países estados ciudades JSON, lista de países y ciudades, select país ciudad.

## Sources, license and acknowledgements

### Sources

This is a derivative database built from two open sources, both under the **Open Database
License (ODbL) v1.0**:

- **[dr5hn/countries-states-cities-database](https://github.com/dr5hn/countries-states-cities-database)**
  (Darshan Gada): the worldwide data (250 countries) and everything outside `/latam`.
- **[Yerikmiller/Countries-States-Cities-JSON](https://github.com/Yerikmiller/Countries-States-Cities-JSON)**
  (a dr5hn derivative): the richer LATAM city lists under `/latam`.

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

This project is **dual-licensed**:

- **Data** (`/countries`, `/regions`, `/subregions`, `/bundles`, `/flat-cities`,
  `/large-countries`, `/latam`, `/metadata`): **Open Database License (ODbL) v1.0**, see
  [`LICENSE`](LICENSE). The data is a derivative of the sources above (both ODbL);
  attribution to both is required and any adapted database must stay under ODbL.
- **Code** (`/scripts`): **MIT License**, Copyright (c) 2026 srestre, see
  [`LICENSE-CODE`](LICENSE-CODE).

### Acknowledgements

Huge thanks to the authors whose open data makes this project possible:

- **Darshan Gada (dr5hn)** for [countries-states-cities-database](https://github.com/dr5hn/countries-states-cities-database),
  the comprehensive worldwide dataset that powers everything outside `/latam`.
- **Yerikmiller** for [Countries-States-Cities-JSON](https://github.com/Yerikmiller/Countries-States-Cities-JSON),
  the richer LATAM city lists used in `/latam`.

Both datasets are released under the Open Database License (ODbL) v1.0. Thank you for keeping
this data open and well maintained. This repository would not exist without your work.
