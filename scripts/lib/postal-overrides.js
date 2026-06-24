'use strict';
/*
 * postal-overrides.js - replaces GeoNames municipality centroids with the real
 * per-zone centroids from Colombia's official 4-72 postal shapefile.
 *
 * GeoNames' Colombian postal codes are exactly the 4-72 codes but every code in
 * a municipality carries that municipality's single centroid (so all the codes
 * of a city share one point). This swaps in each code's actual zone point,
 * derived (shapely representative_point) from the official 4-72 polygons.
 *
 * Source: Servicios Postales Nacionales 4-72, "Códigos Postales Nacionales",
 * https://www.datos.gov.co/Ordenamiento-Territorial/C-digos-Postales-Nacionales/ixig-z8b5
 * Licensed CC BY-SA 4.0. See LICENSE-DATA-POSTAL.
 *
 * SPDX-License-Identifier: MIT (code)
 */

const fs = require('fs');
const path = require('path');

// Mutates the CO records in place, overriding latitude/longitude from the 4-72
// zone centroids file. Returns how many records were updated.
function applyCO(records, root) {
  const p = path.join(root, 'data', 'co-postal-zones-4-72.json');
  if (!fs.existsSync(p)) return { applied: 0 };
  const cents = JSON.parse(fs.readFileSync(p, 'utf8'));
  let applied = 0;
  for (const r of records) {
    const c = cents[r.postal_code];
    if (c) { r.longitude = c[0]; r.latitude = c[1]; applied++; }
  }
  return { applied };
}

module.exports = { applyCO };
