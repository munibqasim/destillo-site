#!/usr/bin/env bash
# Downloads the institution logos used on the homepage into this folder.
# Run once from the repo root:   bash logos/get-logos.sh
# Then check each file opens, and commit the logos folder.
#
# These addresses come from each institution's own website header.
# If one fails or looks wrong, save that logo by hand under the same file name.
# Until a file exists here, the page loads the logo from the institution's own site,
# and if that is blocked too, it shows the institution's name as text.

set -u
cd "$(dirname "$0")"

get () {
  local file="$1" url="$2"
  if curl -fsSL -A "Mozilla/5.0" -o "$file" "$url"; then
    echo "ok      $file"
  else
    rm -f "$file"
    echo "FAILED  $file  (save it by hand from $url)"
  fi
}

# adb.png, mcc.svg, ecg.png and oxford-blavatnik.png are already saved and trimmed by hand.
# Only re-download if one of them goes missing:
# get adb.png          "https://www.adb.org/themes/custom/adb_theme/components/header/assets/adb-blue-block.png"
# get mcc.svg          "https://assets.mcc.gov/content/uploads/sig-mcc-horz.svg"

echo
echo "Later, once the pilot is signed: ebrd.svg"
