#!/usr/bin/env bash
# CA · Global Talent Stream · 官方原件抓取脚本
# 用法：在仓库根目录执行 `bash data/archive/ca/gts/download.sh`
# 幂等：已存在的文件默认跳过；要强制重抓先 rm 目标文件。
#
# 注：canada.ca（Akamai + GeoFilter）在部分境内网络会直接 TCP 被"劫持"到保留 IP，
# 任何直接 curl 都会 TLS 握手成功但 HTTP 请求超时。此时回落到 web.archive.org
# 的 `id_` 模式取原始快照内容（不带 Wayback 工具条）。
# fetch_wa() 就是这个用途。justice.gc.ca 则不受影响，直连即可。

ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36"

mkdir -p "$ROOT/esdc" "$ROOT/ircc" "$ROOT/laws"
: > "$LOG"

# 直连
fetch() {
  local url="$1"
  local rel="$2"
  local out="$ROOT/$rel"
  if [ -s "$out" ]; then
    echo "SKIP $rel" | tee -a "$LOG"
    return 0
  fi
  echo "GET  $rel  <- $url" | tee -a "$LOG"
  if curl -fsSL --http1.1 -A "$UA" --retry 3 --retry-delay 2 --connect-timeout 20 --max-time 60 \
        "$url" -o "$out.tmp"; then
    mv "$out.tmp" "$out"
    echo "OK   $rel  $(wc -c < "$out") bytes" | tee -a "$LOG"
  else
    echo "FAIL $rel  <- $url" | tee -a "$LOG"
    rm -f "$out.tmp"
  fi
}

# 通过 web.archive.org id_ 模式取快照（纯正文、不带工具条）
fetch_wa() {
  local url="$1"
  local rel="$2"
  local out="$ROOT/$rel"
  if [ -s "$out" ]; then
    echo "SKIP $rel" | tee -a "$LOG"
    return 0
  fi
  local wa="https://web.archive.org/web/2025id_/$url"
  echo "GET  $rel  <- [wayback] $url" | tee -a "$LOG"
  if curl -fsSL --http1.1 -A "$UA" --retry 3 --retry-delay 2 --connect-timeout 20 --max-time 60 \
        "$wa" -o "$out.tmp"; then
    mv "$out.tmp" "$out"
    echo "OK   $rel  $(wc -c < "$out") bytes (via wayback)" | tee -a "$LOG"
  else
    echo "FAIL $rel  <- $wa" | tee -a "$LOG"
    rm -f "$out.tmp"
  fi
}

# ---- ESDC · Global Talent Stream ----（走 Wayback）
fetch_wa "https://www.canada.ca/en/employment-social-development/services/foreign-workers/global-talent.html" \
         "esdc/gts-overview.html"

fetch_wa "https://www.canada.ca/en/employment-social-development/services/foreign-workers/global-talent/requirements.html" \
         "esdc/gts-employer.html"

fetch_wa "https://www.canada.ca/en/employment-social-development/services/foreign-workers/global-talent/applicant-guide.html" \
         "esdc/gts-occupations.html"

# ---- IRCC · Work permit + Express Entry + Citizenship ----（走 Wayback）
fetch_wa "https://www.canada.ca/en/immigration-refugees-citizenship/services/work-canada/permit/temporary.html" \
         "ircc/work-permit-lmia-exempt.html"

fetch_wa "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html" \
         "ircc/express-entry.html"

fetch_wa "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry/eligibility/canadian-experience-class.html" \
         "ircc/cec.html"

fetch_wa "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry/eligibility/federal-skilled-workers.html" \
         "ircc/fsw.html"

fetch_wa "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry/eligibility/criteria-comprehensive-ranking-system/grid.html" \
         "ircc/crs-grid.html"

fetch_wa "https://www.canada.ca/en/immigration-refugees-citizenship/services/canadian-citizenship/become-canadian-citizen.html" \
         "ircc/citizenship-become.html"

fetch_wa "https://www.canada.ca/en/immigration-refugees-citizenship/services/canadian-citizenship/become-canadian-citizen/eligibility.html" \
         "ircc/citizenship-physical-presence.html"

# ---- Justice Laws ----（直连）
fetch "https://laws-lois.justice.gc.ca/eng/acts/i-2.5/FullText.html" \
      "laws/irpa.html"

fetch "https://laws-lois.justice.gc.ca/eng/regulations/sor-2002-227/FullText.html" \
      "laws/irpr.html"

fetch "https://laws-lois.justice.gc.ca/eng/acts/c-29/FullText.html" \
      "laws/citizenship-act.html"

echo "---- done ----" | tee -a "$LOG"
