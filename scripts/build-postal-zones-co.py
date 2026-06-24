#!/usr/bin/env python3
"""
build-postal-zones-co.py - simplified per-CODE GeoJSON of Colombian postal-code
ZONES from the official 4-72 shapefile, for painting a code's area on a map.

Outputs postal-zones/co/<DD>/<code>.geojson - one small FeatureCollection per
6-digit code (nested by department DD = first two digits), so a page can fetch
just the zone it needs. Polygons are simplified and coordinates rounded to keep
each file light for the web (a few KB).

Source (CC BY-SA 4.0): Servicios Postales Nacionales 4-72, "Codigos Postales
Nacionales", https://www.datos.gov.co/Ordenamiento-Territorial/C-digos-Postales-Nacionales/ixig-z8b5
Download Shapefile_Codigo_Postal.zip, unzip it, and pass the .shp base path.

Dependencies: pyshp, shapely  (pip install pyshp shapely)

Usage:
  python3 scripts/build-postal-zones-co.py /path/to/CODIGO_POSTAL_COMPLETA [tolerance]
"""
import json
import os
import sys

import shapefile  # pyshp
from shapely.geometry import shape, mapping


def round_coords(obj, nd=5):
    if isinstance(obj, float):
        return round(obj, nd)
    if isinstance(obj, list):
        return [round_coords(x, nd) for x in obj]
    if isinstance(obj, dict):
        return {k: round_coords(v, nd) for k, v in obj.items()}
    return obj


def main():
    if len(sys.argv) < 2:
        print("usage: build-postal-zones-co.py <shapefile-base-path> [tolerance]", file=sys.stderr)
        sys.exit(2)
    base = sys.argv[1]
    tol = float(sys.argv[2]) if len(sys.argv) > 2 else 0.001  # ~110 m

    sf = shapefile.Reader(base, encoding="latin-1")
    recs = sf.records()

    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    out = os.path.join(root, "postal-zones", "co")
    os.makedirs(out, exist_ok=True)

    count = 0
    for i in range(len(sf)):
        code = str(recs[i]["Codigo_Pos"]).strip()
        if len(code) != 6 or not code.isdigit():
            continue
        g = shape(sf.shape(i).__geo_interface__)
        if not g.is_valid:
            g = g.buffer(0)
        gs = g.simplify(tol, preserve_topology=True)
        if gs.is_empty:
            gs = g
        feat = {"type": "Feature", "properties": {"code": code}, "geometry": round_coords(mapping(gs))}
        fc = {"type": "FeatureCollection", "features": [feat]}
        d = os.path.join(out, code[:2])
        os.makedirs(d, exist_ok=True)
        with open(os.path.join(d, code + ".geojson"), "w", encoding="utf-8") as f:
            json.dump(fc, f, separators=(",", ":"))
        count += 1

    print(f"wrote {count} per-code zone files under {out}")


if __name__ == "__main__":
    main()
