#!/bin/bash
# Double-click in Finder to rebuild the JLCPCB zip.
cd "$(dirname "$0")"
./_export_jlcpcb.sh
status=$?
echo
if [[ $status -eq 0 ]]; then
  echo "Upload this file:"
  echo "  $PWD/fab/PPG-jlcpcb.zip"
  open -R "$PWD/fab/PPG-jlcpcb.zip"
else
  echo "Export failed (exit $status)."
fi
echo
read -n 1 -s -p "Press any key to close..."
echo
exit $status
