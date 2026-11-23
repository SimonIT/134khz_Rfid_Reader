#!/bin/sh
# Regenerate the BOM CSV from the schematic.
# Usage: ./export-bom.sh [output.csv]   (defaults to the committed BOM file)
set -eu
cd "$(dirname "$0")"
out="${1:-BOM/Bill_of_Materials_for_Rfid_143.2kHz - Sheet1.csv}"

kicad-cli sch export bom \
  --fields 'Name,Reference,${QUANTITY},Value,Footprint,Datasheet,Buying Links,Manufacturer,MPN' \
  --labels 'Name,Reference,Qty,Value,Footprint,Datasheet,Buying Links,Manufacturer,MPN' \
  --group-by 'Value,Footprint,MPN' \
  --exclude-dnp \
  -o "$out" "Rfid em.kicad_sch"

# keep the original CSV style (CRLF line endings, quotes only where needed)
python3 -c "import csv,sys; r=list(csv.reader(open(sys.argv[1],newline='',encoding='utf-8'))); csv.writer(open(sys.argv[1],'w',newline='',encoding='utf-8'),lineterminator='\r\n').writerows(r)" "$out"
