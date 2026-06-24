#!/usr/bin/env python3
"""
derive-postal-zones-4-72.py - derive one representative point per Colombian
postal code from the official 4-72 postal-zone polygons, writing
data/co-postal-zones-4-72.json as { "CODE": [lng, lat], ... }.

Source (CC BY-SA 4.0): Servicios Postales Nacionales 4-72, "Codigos Postales
Nacionales", https://www.datos.gov.co/Ordenamiento-Territorial/C-digos-Postales-Nacionales/ixig-z8b5
Download the shapefile (Shapefile_Codigo_Postal.zip) and unzip it; pass the path
to the .shp (without extension) as the first argument.

Dependencies: pyshp, shapely  (pip install pyshp shapely)

Usage:
  python3 scripts/derive-postal-zones-4-72.py /path/to/CODIGO_POSTAL_COMPLETA
"""
import json
import os
import sys

import shapefile  # pyshp
from shapely.geometry import shape as shp_shape


def main():
    if len(sys.argv) < 2:
        print("usage: derive-postal-zones-4-72.py <shapefile-base-path>", file=sys.stderr)
        sys.exit(2)
    base = sys.argv[1]
    sf = shapefile.Reader(base, encoding="latin-1")
    recs = sf.records()

    out = {}
    for i in range(len(sf)):
        code = str(recs[i]["Codigo_Pos"]).strip()
        if len(code) != 6 or not code.isdigit():
            continue
        # representative_point() is guaranteed to lie inside the polygon, which
        # the area centroid is not (concave zones). Ideal for a map marker.
        p = shp_shape(sf.shape(i).__geo_interface__).representative_point()
        out[code] = [round(p.x, 6), round(p.y, 6)]

    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    dest = os.path.join(root, "data", "co-postal-zones-4-72.json")
    os.makedirs(os.path.dirname(dest), exist_ok=True)
    with open(dest, "w", encoding="utf-8") as f:
        json.dump(out, f, separators=(",", ":"))
    print(f"wrote {len(out)} zone centroids to {dest}")


if __name__ == "__main__":
    main()
