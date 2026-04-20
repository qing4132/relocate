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

# EB-1A 类别说明页（USCIS 2023 重组后独立深链）
fetch "https://www.uscis.gov/working-in-the-united-states/permanent-workers/employment-based-immigration-first-preference-eb-1" \
      "uscis/eb1a_overview.html"

# Policy Manual Vol 6 Part F Ch 2 · EB-1 Extraordinary Ability
# 含 Kazarian 两段论、10 条标准逐条释义、"comparable evidence" 规则
fetch "https://www.uscis.gov/policy-manual/volume-6-part-f-chapter-2" \
      "uscis/policy-manual_vol6-part-f-ch2_eb1a.html"

echo "---" | tee -a "$LOG"
echo "done. see $LOG" | tee -a "$LOG"
