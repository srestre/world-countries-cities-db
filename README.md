# world-countries-cities-db

Worldwide **countries, states and cities database** (JSON, CSV, SQL, YAML) derived from
[dr5hn/countries-states-cities-database](https://github.com/dr5hn/countries-states-cities-database),
**split into granular pieces** (by country, region, subregion and bundle) so you can request
only what you need without downloading the full world file (~47MB). A lightweight open-data
alternative to heavier sources like GeoNames for country / state / city lookups and lists.

Built to be served over the **jsDelivr CDN** (once the repo is public) and to seed different
stacks: frontend (chained Country -> City selects), spreadsheets (CSV), databases (SQL) and
config (YAML).

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

There is also a dedicated **`/latam` section** ready for a chained Country -> City select
in any form or frontend (slug-keyed, bilingual, Colombia first).

> **Visibility / jsDelivr note:** this repo is **private**. jsDelivr only serves **public**
> repositories, so jsDelivr CDN URLs do **not** work while it is private. To serve the JSON
> to a browser (e.g. a Country -> City select) you have to either:
> 1. make the repo public (`gh repo edit srestre/world-countries-cities-db --visibility public --accept-visibility-change-consequences`) so jsDelivr URLs activate, or
> 2. host the JSON files you need on your own site/CDN, or
> 3. proxy GitHub `raw` through your server with a token.
>
> While private, the data is consumed via clone or the GitHub API.

## Sources and attribution

Two sources, both under the **Open Database License (ODbL) v1.0**, both credited:

- **dr5hn/countries-states-cities-database** (Darshan Gada): the whole world (250 countries)
  and everything outside `/latam`.
- **Yerikmiller/Countries-States-Cities-JSON** (a dr5hn derivative): the richer LATAM city
  lists under `/latam` (more cities than the dr5hn snapshot, e.g. Colombia 1220 vs 1038).

See the "License" and "Acknowledgements" sections below.

## Why it exists (the problem)

The source `countries+states+cities.json` is **47MB**: impossible to load in a frontend or
to request whole every time. Here it is split into **~2250 files** across several
granularity levels, so each call fetches only its slice.

## Call levels (the point)

| You want... | Request this file |
|-------------|-------------------|
| One country | `/countries/CO.json`, `/countries/US.json` |
| One country's flat city list (for a city dropdown) | `/flat-cities/CO.json` |
| A whole region | `/regions/europe.json`, `/regions/americas.json` |
| A subregion | `/subregions/south-america.json`, `/subregions/caribbean.json` |
| A business group (LATAM, North America...) | `/bundles/latam.json`, `/bundles/north-america.json` |
| One state of a large country | `/large-countries/US/states/california.json` |
| Metadata for every country | `/metadata/countries.json` |
| LATAM country list, ready for a dropdown (richer) | `/latam/countries.json` |
| LATAM city list for a country (richer) | `/latam/cities/colombia.json` |

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
/flat-cities/<ISO2>.{json,csv}                  flat array of city names (dedup + locale sort)
/large-countries/<ISO2>/states/<slug>.{json,csv}   per-state drill-down (US, BR, MX, IN, CA, AU, RU, CN)
/latam/                                         ready-to-use LATAM section for dropdowns (Yerikmiller source)
    countries.json                              20 countries, bilingual, Colombia first, slug + iso2
    index.json                                  { slug: { name_en, name_es, iso2, iso3 } }
    cities/<slug>.json                          flat city array per country (richer than dr5hn)
    latam-cities.json                           consolidated { slug: [cities...] }
/scripts/build.js                               world data (dr5hn)
/scripts/build-latam.js                         LATAM section (Yerikmiller)
```

### dr5hn vs Yerikmiller for LATAM (both available)

For the 20 LATAM countries you have two interchangeable options in this same repo:

| | Source | Keyed by | Shape | Cities (Colombia) |
|-|--------|----------|-------|------------------:|
| `/latam/cities/<slug>.json` | Yerikmiller | slug (`colombia`) | flat names | 1220 |
| `/flat-cities/<ISO2>.json` | dr5hn | ISO2 (`CO`) | flat names | 1038 |
| `/bundles/latam.json` | dr5hn | ISO2 | full hierarchy | - |

Use `/latam/...` for the richer dropdown; use the dr5hn paths when you want one single
source consistent with the rest of the world data.

> Note: the `/latam` files use `name_en` as the English key, while the rest of the repo uses
> `name`. Both use `name_es` for Spanish.

## Formats per level

| Level | JSON | CSV | SQL | YAML |
|-------|:----:|:---:|:---:|:----:|
| countries, regions, subregions, bundles, metadata | yes | yes | yes | yes |
| flat-cities, large-countries/states | yes | yes | - | - |
| latam | yes | - | - | - |

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

## jsDelivr URLs (live once the repo is public)

Pattern:

```
https://cdn.jsdelivr.net/gh/srestre/world-countries-cities-db@main/<path>
```

Examples:

```
.../bundles/latam.json
.../regions/europe.json
.../countries/CO.json
.../flat-cities/MX.json
.../latam/countries.json
.../large-countries/US/states/california.json
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

> Taxonomy note: the source places **Mexico in "Northern America"**, not Central America.
> That is why the curated **bundles** exist (LATAM is not a region/subregion in the source).

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
- **~2250** files generated, ~203MB total. Largest single file is under 10MB (well within GitHub limits).

## Note on source noise

The ODbL data can carry some noise (misclassified names, entries that are neighborhoods, or
cities that appear in the wrong country due to upstream errors). It is served as-is; if you
need a curated list for a country, filter on your application side.

## Usage: chained Country -> City select (via the `/latam` section)

Framework-agnostic vanilla JavaScript. Point the two `querySelector` calls at whatever
`<select>` elements your form/app uses. Works once the repo is public (jsDelivr) or if you
serve these JSON files yourself. Switch `name_es` to `name_en` for English labels.

```html
<select id="country"></select>
<select id="city"></select>
<script>
(function () {
  // Public jsDelivr base (active only when the repo is public):
  var CDN = 'https://cdn.jsdelivr.net/gh/srestre/world-countries-cities-db@main/latam';
  var selCountry = document.querySelector('#country');
  var selCity = document.querySelector('#city');
  if (!selCountry || !selCity) return;
  fetch(CDN + '/countries.json').then(function (r) { return r.json(); }).then(function (countries) {
    selCountry.innerHTML = '<option value="">Country</option>';
    countries.forEach(function (c) {
      var o = document.createElement('option'); o.value = c.slug; o.textContent = c.name_es; selCountry.appendChild(o);
    });
  });
  selCountry.addEventListener('change', function () {
    var slug = selCountry.value; selCity.innerHTML = '<option value="">City</option>'; if (!slug) return;
    fetch(CDN + '/cities/' + slug + '.json').then(function (r) { return r.json(); }).then(function (cities) {
      cities.forEach(function (c) { var o = document.createElement('option'); o.value = c; o.textContent = c; selCity.appendChild(o); });
    });
  });
})();
</script>
```

The same pattern works for the worldwide data: use `/flat-cities/<ISO2>.json` keyed by ISO2
code instead of the `/latam` slug files.

## Regenerate

```bash
node --max-old-space-size=4096 scripts/build.js   # world data (dr5hn)
node scripts/build-latam.js                       # LATAM section (Yerikmiller)
```

Each script downloads its source and rewrites its files. Re-runnable.

## Contributing

The data files are generated. Do not hand-edit them: change `scripts/build.js` or
`scripts/build-latam.js` and re-run. Good first changes: add or adjust a bundle (the
`BUNDLES` object), add a large country for per-state drill-down (`LARGE_COUNTRIES`), or
refine a Spanish translation (`REGION_ES` / `SUBREGION_ES` / `STATE_TYPE_ES`).

## License

This project is **dual-licensed**:

- **Data** (`/countries`, `/regions`, `/subregions`, `/bundles`, `/flat-cities`,
  `/large-countries`, `/latam`, `/metadata`): **Open Database License (ODbL) v1.0**, see
  [`LICENSE`](LICENSE). The data is a derivative of dr5hn and Yerikmiller (both ODbL);
  attribution to both is required and any adapted database must stay under ODbL.
- **Code** (`/scripts`): **MIT License**, Copyright (c) 2026 srestre, see
  [`LICENSE-CODE`](LICENSE-CODE).

## Acknowledgements

Huge thanks to the authors whose open data makes this project possible:

- **Darshan Gada (dr5hn)** for [countries-states-cities-database](https://github.com/dr5hn/countries-states-cities-database),
  the comprehensive worldwide dataset that powers everything outside `/latam`.
- **Yerikmiller** for [Countries-States-Cities-JSON](https://github.com/Yerikmiller/Countries-States-Cities-JSON),
  the richer LATAM city lists used in `/latam`.

Both datasets are released under the Open Database License (ODbL) v1.0. Thank you for
keeping this data open and well maintained. This repository would not exist without your work.

## Resumen (español)

Base de datos mundial de **países, estados y ciudades** (JSON, CSV, SQL, YAML), dividida en
piezas granulares por país, región, subregión y grupo (bundle) para hacer llamadas ligeras
por CDN sin descargar todo. Nombres **bilingües inglés/español**. Incluye una sección LATAM
lista para un **select encadenado país -> ciudad** (con Colombia primero). Datos de dr5hn y
Yerikmiller bajo licencia ODbL.

## Keywords

World cities database, countries states cities JSON, country state city API, list of
countries and cities, world cities CSV / SQL, country city dropdown data, GeoNames
alternative, open data geodata dataset.

Base de datos de países y ciudades, listado de países, base de datos de ciudades del mundo,
países estados ciudades JSON, lista de países y ciudades, select país ciudad.
