#!/usr/bin/env python3
"""
derive-airports.py - download OurAirports airports.csv (public domain), filter
to useful airports, and write airports/airports.json + airports/airports.csv.

Filter: keep type in {large_airport, medium_airport} OR a non-empty iata_code;
always drop type == 'closed'. Result is roughly 9,000 to 15,000 airports.

Source (public domain): OurAirports, https://ourairports.com/ ; CSV dump at
https://davidmegginson.github.io/ourairports-data/airports.csv

Output record: { ident, type, name, iata, icao, iso_country, municipality, lat, lng }
  - icao = gps_code if present, else ident.
  - lat/lng rounded to 5 decimals.
  - iata / municipality are '' when absent (never null) for stable CSV/JSON.

Usage:
  python3 scripts/derive-airports.py
"""
import csv
import io
import json
import os
import urllib.request

SOURCE = "https://davidmegginson.github.io/ourairports-data/airports.csv"
KEEP_TYPES = {"large_airport", "medium_airport"}


def keep(row):
    t = (row.get("type") or "").strip()
    if t == "closed":
        return False
    iata = (row.get("iata_code") or "").strip()
    return t in KEEP_TYPES or bool(iata)


def to_record(row):
    ident = (row.get("ident") or "").strip()
    gps = (row.get("gps_code") or "").strip()
    return {
        "ident": ident,
        "type": (row.get("type") or "").strip(),
        "name": (row.get("name") or "").strip(),
        "iata": (row.get("iata_code") or "").strip(),
        "icao": gps or ident,
        "iso_country": (row.get("iso_country") or "").strip(),
        "municipality": (row.get("municipality") or "").strip(),
        "lat": round(float(row["latitude_deg"]), 5),
        "lng": round(float(row["longitude_deg"]), 5),
    }


def main():
    with urllib.request.urlopen(SOURCE) as resp:
        text = resp.read().decode("utf-8")
    reader = csv.DictReader(io.StringIO(text))

    out = []
    for row in reader:
        if not keep(row):
            continue
        # Skip rows without usable coordinates.
        if not (row.get("latitude_deg") or "").strip() or not (row.get("longitude_deg") or "").strip():
            continue
        out.append(to_record(row))

    out.sort(key=lambda r: (r["iso_country"], r["name"]))

    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    dest_dir = os.path.join(root, "airports")
    os.makedirs(dest_dir, exist_ok=True)

    json_path = os.path.join(dest_dir, "airports.json")
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(out, f, ensure_ascii=False, separators=(",", ":"))

    fields = ["ident", "type", "name", "iata", "icao", "iso_country", "municipality", "lat", "lng"]
    csv_path = os.path.join(dest_dir, "airports.csv")
    with open(csv_path, "w", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for r in out:
            w.writerow(r)

    print(f"wrote {len(out)} airports to {json_path} and {csv_path}")


if __name__ == "__main__":
    main()
