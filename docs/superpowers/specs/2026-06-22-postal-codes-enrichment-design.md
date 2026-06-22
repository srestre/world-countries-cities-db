# Diseño: enriquecer el repo con códigos postales mundiales (GeoNames)

- Fecha: 2026-06-22
- Repo: srestre/world-countries-cities-db (público)
- Estado: aprobado (pendiente revisión del spec por el usuario)
- Autor: srestre

## 1. Contexto y objetivo

El repo `world-countries-cities-db` ya entrega países, departamentos/estados y
ciudades del mundo en múltiples formatos (JSON/CSV/SQL/YAML), pero NO contiene
códigos postales. El sitio `codigospostales.co` (repo aparte, hermano) necesita
códigos postales para ofrecer búsqueda indexable de "código postal de X".

Objetivo de este diseño (Parte A): añadir una **capa nueva de códigos postales
mundiales** al repo, como contribución pública abierta, sin tocar los datos
existentes.

Roadmap acordado (todo de una vez, en fases secuenciales, cada una con su spec):
- Fase 1 (este spec): capa de datos `/postal-codes` + CA_full/NL_full.
- Fase 2: el sitio `codigospostales.co` (repo hermano, consume los datos ya
  publicados en jsDelivr). Spec separado.
- Diferido (no descartado): espejo regions/subregions y cruce con ciudades.

Fuente: **GeoNames postal codes** (https://download.geonames.org/export/zip/),
licencia Creative Commons Attribution 4.0 (CC BY 4.0). Cobertura verificada:
121 archivos de país disponibles; formato TSV de 12 columnas. Colombia: 3.681
registros con departamento + municipio + código DANE + coordenadas.

## 2. Decisiones tomadas (cerradas)

1. **Alcance**: mundial, los 121 países con datos en GeoNames. Canadá y Países
   Bajos usan los archivos *_full (códigos completos); GB queda con primera
   parte (GB_full excluido por copyright de Royal Mail).
2. **Formatos**: por país JSON + CSV (ambos, sin recortes). Los 5 bundles
   regionales son manifiestos JSON livianos (NO concatenan datos: la
   concatenación rompería los límites de GitHub/jsDelivr, sobre todo
   north-america con CA_full).
3. **Esquema**: fiel a GeoNames + contexto (country_code, country_name,
   country_name_es, slug). Sin traducir nombres de lugar/departamento (son
   nombres oficiales).
4. **Bundles**: los 5 regionales ya definidos en build.js (latam,
   north-america, central-america, south-america, caribbean), generados como
   manifiestos (lista de países miembro + conteos + rutas a sus archivos), no
   como concatenaciones de datos.
5. **Tamaño aceptado**: el repo crecerá de ~173 MB a ~1.0-1.2 GB (incluye
   CA_full/NL_full). Aceptado.
6. **Sin Git LFS** (jsDelivr no sirve archivos LFS).
7. **Sin dependencias npm nuevas** (se mantiene la política de cero deps).

## 3. Arquitectura

### 3.1. Estructura de archivos (capa nueva, no toca lo existente)

```
/postal-codes/<ISO2>.json                         por país, JSON compacto
/postal-codes/<ISO2>.csv                           por país, CSV
/postal-codes/<ISO2>/<admin1-slug>.{json,csv}      split por depto/estado SOLO si
                                                   el JSON del país superaría ~15 MB
/postal-codes/bundles/<slug>.json                  5 manifiestos regionales (países + conteos + rutas)
/postal-codes/index.json                           manifiesto de cobertura
```

No se modifica `/countries`, `/regions`, `/subregions`, `/bundles`,
`/flat-cities`, `/large-countries` ni `/metadata`.

### 3.2. Esquema de registro

```json
{
  "country_code": "CO",
  "country_name": "Colombia",
  "country_name_es": "Colombia",
  "postal_code": "050001",
  "place": "Medellin",
  "admin1": "Antioquia",  "admin1_code": "02",
  "admin2": "Medellín",   "admin2_code": "05001",
  "admin3": null,         "admin3_code": null,
  "latitude": 6.2518,  "longitude": -75.5636,
  "accuracy": 4,
  "slug": "medellin"
}
```

- `country_name` / `country_name_es`: se leen de `metadata/index.json` (ya
  generado por build.js). Por eso build-postal.js corre DESPUÉS de build.js.
- `slug`: slug del campo `place` (mismo helper slug() del repo).
- Campos GeoNames mapeados 1:1: postal_code, place(=place name), admin1/2/3 +
  sus admin_code, latitude, longitude, accuracy.

### 3.3. Pipeline `scripts/build-postal.js` (cero deps)

1. Descargar `allCountries.zip` de GeoNames (HTTPS hardcoded, ~18.7 MB) y,
   además, `CA_full.csv.zip` y `NL_full.csv.zip` (ver 3.5 para el merge).
2. Descomprimir en memoria con `scripts/lib/unzip.js`: lector ZIP propio basado
   en el End Of Central Directory + central directory + `zlib.inflateRaw`,
   soporta métodos 0 (stored) y 8 (deflate). Mantiene cero deps npm.
3. Parsear el TSV (12 columnas) de forma incremental (línea a línea) para acotar
   memoria, escribiendo por país a medida que se completa cada grupo.
4. Path-safety: descartar filas cuyo `country_code` no sea `^[A-Za-z]{2}$`
   (mismo guard que build.js), para que un valor envenenado no escape del
   directorio de salida.
5. Por país: construir registros con el esquema de 3.2 y escribir JSON + CSV.
   Si el JSON del país superaría ~15 MB, dividir por `admin1` en
   `/postal-codes/<ISO2>/<admin1-slug>.{json,csv}` con guard de colisión de
   slugs (igual que /large-countries en build.js).
6. Bundles (manifiestos): reutilizar los sets de ISO2 de build.js (latam,
   north-america, central-america, south-america, caribbean) y, por cada
   bundle, emitir un JSON liviano con los países miembro, su conteo de CP, si
   fueron split y las rutas a sus archivos. NO concatena datos (evita los
   archivos que romperían GitHub/jsDelivr). Índices con null-proto.
7. Escribir `index.json`: por país {country_code, country_name, records,
   split: bool, files: [...]}, más notas de cobertura parcial por país.
8. Re-ejecutable e idempotente.

### 3.4. Helpers compartidos (refactor acotado)

Extraer de `build.js` a `scripts/lib/format.js` los helpers reutilizables:
`slug`, `num`, `csvField`, `writeJSON`, `writeCSV`, `writeYAML`, `writeSQL`
(y los auxiliares sqlStr/sqlNum/sqlId/yamlScalar/yamlLines que estos usan).
`build.js` y `build-postal.js` lo importan. Objetivo: que el guard anti
formula-injection y los emisores no se dupliquen ni se desincronicen.

El refactor de build.js se limita a reemplazar las definiciones locales por
`require('./lib/format.js')`, sin cambiar comportamiento. Debe verificarse que
build.js produce salida idéntica antes/después (diff de un país de muestra).

### 3.5. Manejo de la fuente y caveats de cobertura

- Base: `allCountries.zip` (un solo request) para los 121 países.
- Canadá y Países Bajos: además se descargan `CA_full.csv.zip` (~6.1 MB zip,
  ~850k registros) y `NL_full.csv.zip` (~3.4 MB zip, ~450k registros). Mismo
  formato tab de 12 columnas pese a la extensión .csv. Para CA y NL los
  registros *_full SUPERSEDEN a los básicos de allCountries (se descartan las
  filas básicas de CA/NL). Por su tamaño, CA y NL se generan SIEMPRE con split
  por admin1 (provincia) para mantener archivos < 15 MB.
- GB_full se excluye a propósito (datos de Royal Mail con copyright); GB queda
  solo con la primera parte de allCountries.
- Caveats documentados en README: AR solo 5 primeras posiciones, BR solo
  códigos mayores (terminados en -000 y el código mayor por municipio),
  CL/CN/IE/MT parciales por copyright, GB solo primera parte.
- Cobertura ~121 países; el resto no tiene sistema postal o no lo publica con
  licencia compatible. Eso es esperado, no un error.

### 3.6. Licencia y atribución (repo público)

- Nuevo archivo `LICENSE-DATA-POSTAL` con el texto/identificación CC BY 4.0 y la
  atribución a GeoNames (link a www.geonames.org).
- Nueva sección en `README.md`: "Postal codes (GeoNames, CC BY 4.0)" con
  estructura de `/postal-codes`, esquema, atribución y los caveats de 3.5.
- Aclarar el triple licenciamiento del repo:
  - Código (`/scripts`): MIT (LICENSE-CODE).
  - Datos países/estados/ciudades (dr5hn): ODbL (LICENSE).
  - Datos códigos postales (GeoNames): CC BY 4.0 (LICENSE-DATA-POSTAL).

### 3.7. Validación `scripts/validate-postal.js`

Sin frameworks (convención del repo). Comprueba:
- Todo path bajo `/postal-codes` usa iso2 seguro (`^[A-Za-z]{2}$`).
- Cada registro tiene `postal_code` no vacío y `country_code` válido.
- Ningún valor de texto empieza con `=+-@` sin el guard de la comilla en CSV.
- `index.json` cuadra con los archivos realmente presentes (conteos y splits).
- Smoke check de muestra: CO tiene ~3.681 registros y "Medellin" está presente
  con admin2_code 05001.

## 4. Implicaciones de tamaño

- Estimación: ~2.8M registros (allCountries ~1.5M + CA_full ~850k + NL_full
  ~450k). JSON + CSV por país (los bundles son manifiestos, peso despreciable).
  Repo total estimado ~1.0-1.2 GB (desde 173 MB). Cruza la recomendación de
  GitHub de <1 GB pero queda muy por debajo del umbral de 5 GB.
- Límites respetados: archivos <15 MB (GitHub bloquea >100 MB; jsDelivr ~20 MB).
  Repo ~1.0-1.2 GB (GitHub recomienda <1 GB, email amistoso >5 GB).
- Riesgo principal: crecimiento del historial `.git` por regeneraciones
  sucesivas. Mitigación: regenerar solo ante updates reales de GeoNames; si
  hiciera falta, aplanar historial más adelante (filter-repo / squash).
- Consumidores usan jsDelivr (no clonan); el peso solo afecta al mantenedor.

## 5. Fuera de alcance (v1)

- Parte B: el sitio `codigospostales.co` (spec separado, Fase 2).
- Espejo de `/regions` y `/subregions` para códigos postales (diferido: las
  agregaciones por región/subregión rompen el límite de archivo de jsDelivr).
- Cruce/mapeo de cada código postal con la ciudad dr5hn existente (diferido: sin
  llave fiable; requeriría un índice aparte con score de confianza).
- GB_full (datos de Royal Mail con copyright).
- Traducción de nombres de lugar/departamento.

## 6. Plan de verificación

1. `node scripts/build.js` corre sin cambios de salida tras el refactor a
   `lib/format.js` (diff de un país de muestra antes/después).
2. `node scripts/build-postal.js` genera `/postal-codes` completo sin error.
3. `node scripts/validate-postal.js` pasa todas las comprobaciones.
4. Spot checks manuales: CO/MX/US presentes; un país grande quedó split; un país
   sin datos GeoNames no aparece en index.json; un archivo servible por jsDelivr
   (<15 MB).
5. README y LICENSE-DATA-POSTAL presentes y correctos antes de commitear datos.

## 7. Secuencia de implementación (alto nivel)

1. Refactor: extraer `scripts/lib/format.js`; adaptar build.js; verificar salida
   idéntica.
2. `scripts/lib/unzip.js` (lector ZIP cero-deps) + test mínimo con CO.zip.
3. `scripts/build-postal.js` (descarga allCountries + CA_full/NL_full, merge
   donde el *_full supersede al básico, parse, por país, split, bundles, index).
4. `scripts/validate-postal.js`.
5. `LICENSE-DATA-POSTAL` + sección de README + package.json scripts
   (build:postal, validate:postal).
6. Generar datos, validar, commitear y push.
