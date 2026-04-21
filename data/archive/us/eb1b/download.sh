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

# EB-1 overview（EB-1A / EB-1B / EB-1C 共页 · USCIS 2023 合并深链）
fetch "https://www.uscis.gov/working-in-the-united-states/permanent-workers/employment-based-immigration-first-preference-eb-1" \
      "uscis/eb1_overview.html"

# Policy Manual Vol 6 Part F Ch 3 · EB-1 Outstanding Professor or Researcher
# 含 6 条证据标准、"permanent research position" 定义、"tenure-track" 解释
fetch "https://www.uscis.gov/policy-manual/volume-6-part-f-chapter-3" \
      "uscis/policy-manual_vol6-part-f-ch3_eb1b.html"

echo "---" | tee -a "$LOG"
echo "done. see $LOG" | tee -a "$LOG"
