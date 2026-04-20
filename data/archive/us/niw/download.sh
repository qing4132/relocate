#!/usr/bin/env bash
ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36"

mkdir -p "$ROOT/uscis"
: > "$LOG"

fetch() {
  local url="$1"
  local rel="$2"
  local out="$ROOT/$rel"
  echo "GET  $rel  <- $url" | tee -a "$LOG"
  if curl -fsSL --http1.1 -A "$UA" --retry 3 --retry-delay 2 --connect-timeout 20 --max-time 120 \
        "$url" -o "$out.tmp"; then
    mv "$out.tmp" "$out"
    echo "OK   $rel  $(wc -c < "$out") bytes" | tee -a "$LOG"
  else
    echo "FAIL $rel  <- $url" | tee -a "$LOG"
    rm -f "$out.tmp"
  fi
}

fetch "https://www.uscis.gov/working-in-the-united-states/permanent-workers/employment-based-immigration-second-preference-eb-2" "uscis/eb2_overview.html"
fetch "https://www.uscis.gov/policy-manual/volume-6-part-f-chapter-5" "uscis/pm_vol6_partF_ch5_eb2-advanced-degree.html"
fetch "https://www.justice.gov/eoir/page/file/920996/dl" "uscis/matter-of-dhanasar.pdf"
fetch "https://www.uscis.gov/newsroom/alerts/uscis-updates-guidance-on-national-interest-waivers" "uscis/2022-stem-niw-alert.html"

echo "---- done ----" | tee -a "$LOG"
