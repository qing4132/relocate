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

# ----- MOM（Ministry of Manpower）-----
fetch "https://www.mom.gov.sg/passes-and-permits/overseas-networks-expertise-pass" \
      "mom/one-pass_overview.html"

fetch "https://www.mom.gov.sg/passes-and-permits/overseas-networks-expertise-pass/eligibility" \
      "mom/one-pass_eligibility.html"

fetch "https://www.mom.gov.sg/passes-and-permits/employment-pass" \
      "mom/employment-pass.html"

# Tech.Pass：EDB 主页会被 Incapsula 反爬拦截、MOM 原 URL 已 404；
# 2023 后 Tech.Pass 的功能大量被 ONE Pass 覆盖，本 archive 不再强行抓取。
# 如需快照，手动浏览器另存 https://www.edb.gov.sg/en/how-we-help/incentives-and-schemes/tech-pass.html 放入 mom/tech-pass.html。

fetch "https://www.mom.gov.sg/passes-and-permits/dependants-pass" \
      "mom/dependants-pass.html"

# ----- ICA（Immigration & Checkpoints Authority）-----
fetch "https://www.ica.gov.sg/reside/PR/apply" \
      "ica/permanent-residence.html"

fetch "https://www.ica.gov.sg/reside/citizenship/apply" \
      "ica/citizenship.html"

# ----- IRAS（Inland Revenue Authority of Singapore）-----
fetch "https://www.iras.gov.sg/taxes/individual-income-tax/basics-of-individual-income-tax/tax-residency-and-tax-rates" \
      "iras/tax-residency.html"

# ----- AGC（Attorney-General's Chambers · Singapore Statutes Online）-----
fetch "https://sso.agc.gov.sg/Act/EFMA1990" \
      "agc/efma.html"

fetch "https://sso.agc.gov.sg/Act/IA1959" \
      "agc/immigration-act.html"

fetch "https://sso.agc.gov.sg/Act/CONS1963?ProvIds=P1X-" \
      "agc/constitution-art-122-141.html"

echo "---" | tee -a "$LOG"
echo "done. see $LOG" | tee -a "$LOG"
