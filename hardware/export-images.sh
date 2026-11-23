#!/bin/sh
# Regenerate the project screenshots from the schematic and PCB.
# Usage: ./export-images.sh   (run from anywhere; needs KiCad ≥ 10, rsvg-convert and ImageMagick 7)
set -eu
cd "$(dirname "$0")"

img="../images"

rm -f "$img/pcb.svg"
kicad-cli pcb export svg --mode-single --fit-page-to-board --exclude-drawing-sheet --layers B.Silkscreen,B.Cu,F.Cu,F.Silkscreen,F.Fab,Edge.Cuts -o "$img/pcb.svg" "Rfid em.kicad_pcb"
rsvg-convert -w 1600 -b '#001023' "$img/pcb.svg" -o "$img/Screenshot 2026-03-31 210803.png"
kicad-cli pcb render --side top --quality high --background opaque -w 1600 --height 1000 --zoom 1.2 -o "$img/Screenshot 2026-03-31 210818.png" "Rfid em.kicad_pcb"
kicad-cli sch export svg --exclude-drawing-sheet -o "$img" "Rfid em.kicad_sch"
rsvg-convert -w 4000 -b white "$img/Rfid em.svg" | magick - -trim +repage -fuzz 2% -trim +repage -bordercolor "#f5f4ef" -border 40 "$img/Screenshot 2026-03-31 210833.png"
rm "$img/pcb.svg" "$img/Rfid em.svg"
