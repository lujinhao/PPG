# PPG design rules

Target fab: **JLCPCB 4-layer**, **0.8 mm**, outer **1 oz** / inner **0.5 oz** (see `stackup.md`).

Set in `PPG.kicad_pro` Board Setup → Design Rules / Net Classes. Re-check the live [JLCPCB capabilities](https://jlcpcb.com/capabilities/pcb-capabilities) page before tape-out.

| Parameter | Value | Notes |
|-----------|--------|--------|
| Min track width | **0.09 mm** (3.5 mil) | 4-layer absolute minimum |
| Min clearance | **0.09 mm** | DRC floor matches this |
| Default track | **0.15 mm** | Net class used while routing |
| Min via hole | **0.15 mm** | Absolute; prefer **0.20 mm** or larger |
| Default via | **0.45 / 0.30 mm** | Pad / drill. Same as EchoCarrier stitching vias |
| Min via annular ring | **0.05 mm** | Prefer **0.075 mm** |
| Copper to board edge | **0.20 mm** | Use 0.30 mm if the panel is V-cut |
| Hole to hole | **0.25 mm** | |
| Copper to hole | **0.20 mm** | |
| Solder mask expansion | **0 mm** | `pad_to_mask_clearance` |
| Min silk clearance | **0.15 mm** | |
| Min silk text height / thickness | **1.0 / 0.15 mm** | |
| Via covering | **Tented** | Front and back |

Preset track widths: 0.09, 0.10, 0.15, 0.20, 0.30, 0.50 mm.

Preset vias (pad / drill): 0.25 / 0.15, 0.35 / 0.20, 0.45 / 0.30, 0.60 / 0.30 mm.
