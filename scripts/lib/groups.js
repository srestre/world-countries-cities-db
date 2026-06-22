'use strict';
/*
 * groups.js - curated regional bundle definitions (sets of ISO2 codes) shared
 * by build.js (city bundles) and build-postal.js (postal manifest bundles).
 *
 * SPDX-License-Identifier: MIT
 */

// Curated business bundles (sets of ISO2 codes), with English + Spanish names.
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
