#!/usr/bin/env bash
# AU · National Innovation Visa (858, 前身 GTV) 官方原件抓取

ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36"

mkdir -p "$ROOT/immi" "$ROOT/laws"
: > "$LOG"

fetch() {
  local url="$1"
  local rel="$2"
  local out="$ROOT/$rel"
  if [ -s "$out" ] && [ "$(wc -c < "$out")" -gt 2048 ]; then
    echo "SKIP $rel" | tee -a "$LOG"; return 0
  fi
  echo "GET  $rel  <- $url" | tee -a "$LOG"
  if curl -fsSL --http1.1 -A "$UA" --retry 2 --retry-delay 2 \
        --connect-timeout 15 --max-time 60 "$url" -o "$out.tmp"; then
    mv "$out.tmp" "$out"
    echo "OK   $rel  $(wc -c < "$out") bytes" | tee -a "$LOG"
  else
    echo "FAIL $rel  <- $url" | tee -a "$LOG"
    rm -f "$out.tmp"; return 1
  fi
}

# NIV 2025 版单页聚合（eligibility / steps / about / nominator 子页均已 404）
fetch "https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/national-innovation-visa-858" \
      "immi/niv-overview.html"

# Citizenship
fetch "https://immi.homeaffairs.gov.au/citizenship/become-a-citizen" \
      "immi/citizenship-become.html"
fetch "https://immi.homeaffairs.gov.au/citizenship/become-a-citizen/permanent-resident" \
      "immi/citizenship-residence.html"

# Legislation
fetch "https://www.legislation.gov.au/C2004A00391/latest/text" \
      "laws/migration-act-1958.html"
fetch "https://www.legislation.gov.au/F1996B00475/latest/text" \
      "laws/migration-regs-1994.html"
fetch "https://www.legislation.gov.au/C2007A00020/latest/text" \
      "laws/citizenship-act-2007.html"

echo "---- done ----" | tee -a "$LOG"
