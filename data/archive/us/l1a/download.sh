#!/usr/bin/env bash
set -u

ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
: > "$LOG"

UA='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 relocate-archive'

fetch() {
  local url="$1" rel="$2"
  local out="$ROOT/$rel"
  mkdir -p "$(dirname "$out")"
  if [[ -s "$out" ]]; then
    echo "SKIP  $rel" | tee -a "$LOG"
    return 0
  fi
  if curl -fsSL -A "$UA" --retry 2 --max-time 60 -o "$out" "$url"; then
    printf 'OK    %-72s  <- %s\n' "$rel" "$url" | tee -a "$LOG"
  else
    printf 'FAIL  %-72s  <- %s\n' "$rel" "$url" | tee -a "$LOG"
    rm -f "$out"
  fi
}

fetch "https://www.uscis.gov/working-in-the-united-states/temporary-workers/l-1a-intracompany-transferee-executive-or-manager" \
      "uscis/l1a_overview.html"

# EB-1C 说明页过去有独立深链；USCIS 2023 重组后该深链 404，其内容合并进 EB-1 总览页。
fetch "https://www.uscis.gov/working-in-the-united-states/permanent-workers/employment-based-immigration-first-preference-eb-1" \
      "uscis/eb1_overview.html"

fetch "https://www.uscis.gov/policy-manual/volume-2-part-l" \
      "uscis/policy-manual_vol2-part-l.html"

fetch "https://www.uscis.gov/policy-manual/volume-6-part-f-chapter-5" \
      "uscis/policy-manual_vol6-part-f-ch5_eb1c.html"

echo "---" | tee -a "$LOG"
echo "done. see $LOG" | tee -a "$LOG"
