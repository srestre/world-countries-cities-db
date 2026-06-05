# world-countries-cities-db

Worldwide **countries, states and cities** database derived from
[dr5hn/countries-states-cities-database](https://github.com/dr5hn/countries-states-cities-database),
**split into granular pieces** so you can request only what you need (one country, one
region, one subregion or a business bundle) without downloading the full world file (~47MB).

Built to be served over the **jsDelivr CDN** (once the repo is public) and to seed different
stacks: frontend (chained Country -> City selects), spreadsheets (CSV), databases (SQL) and
config (YAML).

Country display names are provided in **English (`name`) and Spanish (`name_es`)**.

There is also a dedicated **`/latam/` section** that is ready to plug into an Elementor
chained Country -> City select (slug-keyed, bilingual, Colombia first).

> **Visibility / jsDelivr note:** this repo is **private**. jsDelivr only serves **public**
> repositories, so jsDelivr CDN URLs do **not** work while it is private. To serve the JSON
> to a browser (e.g. the Elementor select) you have to either:
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

This repo is a derivative and keeps the same license. See `LICENSE`.

## Why it exists (the problem)

The source `countries+states+cities.json` is **47MB**: impossible to load in a frontend or
to request whole every time. Here it is split into **~2200 files** across several
granularity levels, so each call fetches only its slice.

## Call levels (the point)

| You want... | Request this file |
|-------------|-------------------|
| One country | `/countries/CO.json`, `/countries/US.json` |
| One country's flat city list (Elementor) | `/flat-cities/CO.json` |
| A whole region | `/regions/europe.json`, `/regions/americas.json` |
| A subregion | `/subregions/south-america.json`, `/subregions/caribbean.json` |
| A business group (LATAM, North America...) | `/bundles/latam.json`, `/bundles/north-america.json` |
| One state of a large country | `/large-countries/US/states/california.json` |
| Metadata for every country | `/metadata/countries.json` |
| LATAM country list for Elementor (richer) | `/latam/countries.json` |
| LATAM city list for a country (richer) | `/latam/cities/colombia.json` |

## Structure

```
/metadata/
    countries.json|.csv|.yml   250 countries with metadata (ISO2/3, region, currency, flag, population...)
    index.json                 { iso2: { name, name_es, iso3, region, subregion } }
    regions.json               tree region -> subregion -> [iso2] + indexes with counts
    bundles.json               each bundle -> [iso2]
/countries/<ISO2>.{json,csv,sql,yml}            hierarchical: country -> states -> cities (multi-format)
/regions/<slug>.{json,csv,sql,yml}              every country in a region (multi-format)
/subregions/<slug>.{json,csv,sql,yml}           every country in a subregion (multi-format)
/bundles/<slug>.{json,csv,sql,yml}              curated groups (multi-format)
/flat-cities/<ISO2>.{json,csv}                  flat array of city names (dedup + locale sort)
/large-countries/<ISO2>/states/<slug>.{json,csv}   per-state drill-down (US, BR, MX, IN, CA, AU, RU, CN)
/latam/                                         Elementor-ready LATAM section (Yerikmiller source)
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

Use `/latam/...` for the richer Elementor dropdown; use the dr5hn paths when you want one
single source consistent with the rest of the world data.

### Formats per level

| Level | JSON | CSV | SQL | YAML |
|-------|:----:|:---:|:---:|:----:|
| countries, regions, subregions, bundles, metadata | yes | yes | yes | yes |
| flat-cities, large-countries/states | yes | yes | - | - |

- **JSON**: frontend and APIs. Hierarchical (country -> states -> cities with `name`, `latitude`, `longitude`). Country objects carry `name` and `name_es`.
- **CSV**: one row per city (`country_iso2, country_name, region, subregion, state_code, state_name, city_name, latitude, longitude`). Great for spreadsheets or data science.
- **SQL**: `CREATE TABLE IF NOT EXISTS` for `countries`, `states`, `cities` + `INSERT`s using the **original source ids** (referential integrity). Seed a database with just the slice you need.
- **YAML**: same hierarchy as the JSON, for configs.

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
.../large-countries/US/states/california.json
```

For production, pin to a commit: replace `@main` with `@<commit-hash>`.

## Regions

| Region | slug | Countries | Cities |
|--------|------|----------:|-------:|
| Asia | asia | 50 | 25344 |
| Europe | europe | 53 | 75598 |
| Africa | africa | 60 | 4724 |
| Oceania | oceania | 27 | 4740 |
| Americas | americas | 57 | 45619 |
| Polar | polar | 1 | 0 |

## American subregions

| Subregion | slug | Countries |
|-----------|------|----------:|
| Caribbean | caribbean | 28 |
| South America | south-america | 15 |
| Central America | central-america | 7 |
| Northern America | northern-america | 7 |

> Taxonomy note: the source places **Mexico in "Northern America"**, not Central America.
> That is why the curated **bundles** exist (LATAM is not a region/subregion in the source).

## Curated bundles

| Bundle slug | Name | Countries | ISO2 |
|-------------|------|----------:|------|
| latam | Latin America | 20 | CO, AR, BO, BR, CL, CR, CU, EC, SV, GT, HN, MX, NI, PA, PY, PE, PR, DO, UY, VE |
| north-america | North America | 3 | US, CA, MX |
| central-america | Central America | 7 | BZ, CR, SV, GT, HN, NI, PA |
| south-america | South America | 12 | AR, BO, BR, CL, CO, EC, GY, PY, PE, SR, UY, VE |
| caribbean | Caribbean | 14 | CU, DO, PR, HT, JM, TT, BS, BB, DM, GD, KN, LC, VC, AG |

Edit the `BUNDLES` object in `scripts/build.js` to add or change groups.

## Totals

- **250** countries, **5308** states, **156025** cities.
- **~2200** files generated, ~173MB total.

## Note on source noise

The ODbL data can carry some noise (misclassified names, entries that are neighborhoods, or
cities that appear in the wrong country due to upstream errors). It is served as-is; if you
need a curated list for a country, filter on your application side.

## Elementor usage (chained Country -> City), via the `/latam` section

Works once the repo is public (jsDelivr) or if you serve these JSON files yourself. Switch
`name_es` to `name_en` for English labels.

```html
<script>
(function () {
  // Public jsDelivr base (active only when the repo is public):
  var CDN = 'https://cdn.jsdelivr.net/gh/srestre/world-countries-cities-db@main/latam';
  var selCountry = document.querySelector('select[name="form_fields[country]"]');
  var selCity = document.querySelector('select[name="form_fields[city]"]');
  if (!selCountry || !selCity) return;
  fetch(CDN + '/countries.json').then(function (r) { return r.json(); }).then(function (countries) {
    selCountry.innerHTML = '<option value="">Pais</option>';
    countries.forEach(function (c) {
      var o = document.createElement('option'); o.value = c.slug; o.textContent = c.name_es; selCountry.appendChild(o);
    });
  });
  selCountry.addEventListener('change', function () {
    var slug = selCountry.value; selCity.innerHTML = '<option value="">Ciudad</option>'; if (!slug) return;
    fetch(CDN + '/cities/' + slug + '.json').then(function (r) { return r.json(); }).then(function (cities) {
      cities.forEach(function (c) { var o = document.createElement('option'); o.value = c; o.textContent = c; selCity.appendChild(o); });
    });
  });
})();
</script>
```

## Regenerate

```bash
node --max-old-space-size=4096 scripts/build.js   # world data (dr5hn)
node scripts/build-latam.js                       # LATAM section (Yerikmiller)
```

Each script downloads its source and rewrites its files. Re-runnable.
