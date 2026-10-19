# PPG PCB stackup

Target fab: **JLCPCB 4-layer**, finished thickness **0.8 mm**.

This is JLCPCB’s standard 4-layer 0.8 mm build: no controlled impedance, so it does not add the impedance-control charge. It is the same stackup already used on EchoCarrier.

| Option | Value |
|--------|--------|
| Layers | 4 |
| Thickness | **0.8 mm** |
| Outer copper | **1 oz** (0.035 mm) |
| Inner copper | **0.5 oz** (0.0152 mm) |
| Impedance control | **No** |

| Layer | KiCad | Material | Thickness |
|-------|--------|----------|-----------|
| L1 | `F.Cu` | Copper | **0.035 mm** |
| | dielectric 1 | Prepreg **7628×1** (εr **4.4**) | **0.2104 mm** |
| L2 | `In1.Cu` | Copper | **0.0152 mm** |
| | dielectric 2 | Core FR-4, 0.25 mm (εr **4.6**) | **0.25 mm** |
| L3 | `In2.Cu` | Copper | **0.0152 mm** |
| | dielectric 3 | Prepreg **7628×1** (εr **4.4**) | **0.2104 mm** |
| L4 | `B.Cu` | Copper | **0.035 mm** |

Copper + dielectrics = **0.771 mm** → ordered **0.8 mm**.

Finish: **ENIG**. Via covering: **tented**, front and back. Solder-mask expansion: **0** (1:1 with the pad).

These values are stored in `PPG.kicad_pcb` → Board Setup → Board Stackup. KiCad’s board thickness is **0.8 mm**.

Order file, once the board has an outline: `fab/PPG-jlcpcb.zip`. Rebuild with `PPG-JLCPCB.kicad_jobset` or `Export-JLCPCB.command`.
