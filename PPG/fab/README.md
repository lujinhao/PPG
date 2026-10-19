# PPG — JLCPCB fab package

PCB-only order. Upload **`PPG-jlcpcb.zip`** at [jlcpcb.com](https://jlcpcb.com/).

## Rebuild

1. **In KiCad** — open `PPG.kicad_pro`, double-click **`PPG-JLCPCB.kicad_jobset`**, then **Generate** on **JLCPCB zip**.
2. **In Finder** — double-click **`Export-JLCPCB.command`**.

Both use Protel Gerber names, all four copper layers, separate PTH and NPTH drills, and millimetre units.

| Path | What |
|------|------|
| `PPG-jlcpcb.zip` | Gerbers + PTH/NPTH drills — the order file |
| `jlcpcb/` | Unpacked copy of the zip |
| `review/` | Layer PDF and drill maps. Do not upload |

## JLCPCB order form

Match `../docs/stackup.md`. Leave impedance control off.

| Option | Set to |
|--------|--------|
| Base material | FR-4 |
| Layers | **4** |
| PCB thickness | **0.8 mm** |
| Outer copper weight | **1 oz** |
| Inner copper weight | **0.5 oz** |
| Impedance control | **No** |
| Surface finish | **ENIG** |
| Via covering | **Tented vias** |
| PCB color / silkscreen | Green / white, or your choice |
| Castellated holes | **Yes** — plated holes sit on the left and right edges |
| Gold fingers, edge plating | No |
| Assembly | None, unless you add an assembly BOM later |

JLCPCB’s 4-layer **0.8 mm / 1 oz outer / 0.5 oz inner / no impedance** stack is the 7628 build in the KiCad stackup (prepreg 0.2104 / core 0.25 / prepreg 0.2104).
