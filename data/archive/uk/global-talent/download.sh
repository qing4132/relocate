#!/usr/bin/env bash
# UK · Global Talent Visa Documentation Downloader
set -u
ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36"

mkdir -p "$ROOT/gov-uk" "$ROOT/rules" "$ROOT/laws"
: > "$LOG"

fetch() {
  local url="$1"
  local rel="$2"
  local out="$ROOT/$rel"
  if [ -s "$out" ] && [ "$(wc -c < "$out")" -gt 2048 ]; then
    echo "SKIP $rel  ($(wc -c < "$out") bytes)" | tee -a "$LOG"
    return 0
  fi
  echo "GET  $rel  <- $url" | tee -a "$LOG"
  if curl -fsSL --http1.1 -A "$UA" --retry 3 --retry-delay 2 \
        --connect-timeout 20 --max-time 90 \
        "$url" -o "$out.tmp"; then
    mv "$out.tmp" "$out"
    echo "OK   $rel  $(wc -c < "$out") bytes" | tee -a "$LOG"
  else
    echo "FAIL $rel  <- $url" | tee -a "$LOG"
    rm -f "$out.tmp"
    return 1
  fi
}

# ============ GOV.UK · Global Talent (policy pages) ============
fetch "https://www.gov.uk/global-talent"                        "gov-uk/gt-overview.html"
fetch "https://www.gov.uk/global-talent/apply-stage-1-endorsement" "gov-uk/gt-stage1-endorsement.html"
fetch "https://www.gov.uk/global-talent/apply-stage-2-visa"     "gov-uk/gt-stage2-visa.html"
fetch "https://www.gov.uk/global-talent/extend-your-visa"       "gov-uk/gt-extend.html"
fetch "https://www.gov.uk/global-talent/apply-to-settle"        "gov-uk/gt-settle.html"
fetch "https://www.gov.uk/global-talent-researcher-academic"    "gov-uk/gt-researcher.html"
fetch "https://www.gov.uk/global-talent-digital-technology"     "gov-uk/gt-digital.html"
fetch "https://www.gov.uk/global-talent-arts-culture"           "gov-uk/gt-arts.html"
fetch "https://www.gov.uk/global-talent-prestigious-prize"      "gov-uk/gt-prize.html"

# ============ GOV.UK · ILR + Citizenship ============
fetch "https://www.gov.uk/indefinite-leave-to-remain-global-talent" "gov-uk/ilr-global-talent.html"
fetch "https://www.gov.uk/becoming-a-british-citizen"           "gov-uk/citizenship-become.html"
fetch "https://www.gov.uk/apply-citizenship-indefinite-leave-to-remain" "gov-uk/citizenship-naturalise.html"
fetch "https://www.gov.uk/life-in-the-uk-test"                  "gov-uk/life-in-uk-test.html"
fetch "https://www.gov.uk/dual-citizenship"                     "gov-uk/dual-citizenship.html"

# ============ Immigration Rules · Appendix Global Talent ============
fetch "https://www.gov.uk/guidance/immigration-rules/immigration-rules-appendix-global-talent" "rules/appendix-global-talent.html"
fetch "https://www.gov.uk/guidance/immigration-rules/immigration-rules-appendix-global-talent-prestigious-prizes" "rules/appendix-gt-prizes.html"

# ============ Legislation · legislation.gov.uk ============
fetch "https://www.legislation.gov.uk/ukpga/1971/77"            "laws/immigration-act-1971.html"
fetch "https://www.legislation.gov.uk/ukpga/1981/61"            "laws/british-nationality-act-1981.html"

echo "---- done ----" | tee -a "$LOG"
