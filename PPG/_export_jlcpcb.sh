#!/usr/bin/env bash
# Export PPG Gerbers + drills for a JLCPCB PCB-only order.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
PCB="$ROOT/PPG.kicad_pcb"
FAB="$ROOT/fab"
OUT="$FAB/jlcpcb"
KICAD="${KICAD_CLI:-/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli}"

if [[ ! -x "$KICAD" ]]; then
  echo "kicad-cli not found at $KICAD" >&2
  exit 1
fi

rm -rf "$OUT"
mkdir -p "$OUT" "$FAB"

echo "DRC..."
"$KICAD" pcb drc \
  --refill-zones \
  --format report \
  --units mm \
  --severity-error \
  --severity-warning \
  -o "$FAB/PPG-drc.rpt" \
  "$PCB"

echo "Board stats..."
"$KICAD" pcb export stats \
  -o "$FAB/PPG-board-stats.txt" \
  "$PCB"

echo "Gerbers..."
"$KICAD" pcb export gerbers \
  --output "$OUT" \
  --layers "F.Cu,In1.Cu,In2.Cu,B.Cu,F.Paste,B.Paste,F.SilkS,B.SilkS,F.Mask,B.Mask,Edge.Cuts" \
  --subtract-soldermask \
  --check-zones \
  --exclude-value \
  "$PCB"

echo "Drills..."
"$KICAD" pcb export drill \
  --output "$OUT" \
  --format excellon \
  --drill-origin absolute \
  --excellon-zeros-format decimal \
  --excellon-oval-format alternate \
  --excellon-units mm \
  --excellon-separate-th \
  --generate-map \
  --map-format pdf \
  --generate-report \
  --report-path "$OUT/PPG-drill-report.txt" \
  "$PCB"

mkdir -p "$FAB/review"
mv -f "$OUT"/*-drl_map.pdf "$OUT"/*-drill-report.txt "$FAB/review/" 2>/dev/null || true
rm -f "$OUT"/*.gbrjob

echo "Layer PDF..."
"$KICAD" pcb export pdf \
  --output "$FAB/review/PPG-layers.pdf" \
  --layers "F.Cu,In1.Cu,In2.Cu,B.Cu,F.Mask,B.Mask,F.SilkS,B.SilkS,F.Paste,B.Paste,Edge.Cuts" \
  --mode-single \
  --exclude-value \
  --subtract-soldermask \
  "$PCB"

ZIP="$FAB/PPG-jlcpcb.zip"
rm -f "$ZIP"
(
  cd "$OUT"
  zip -q -X "$ZIP" ./*
)

echo "Wrote $ZIP"
ls -1 "$OUT"
