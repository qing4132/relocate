#!/usr/bin/env bash
# CA · Provincial Nominee Program (PNP) · Tech streams · 官方原件抓取脚本
# 用法：在仓库根目录执行 `bash data/archive/ca/pnp-tech/download.sh`
# 幂等：已存在的文件默认跳过；要强制重抓先 rm 目标文件。
#
# 注：canada.ca 同 ca/gts 走 Wayback id_ 模式（境内 Akamai GeoFilter）；
# welcomebc.ca / ontario.ca / alberta.ca 直连。
#
# 共用件不在此目录：IRPA / IRPR / Citizenship Act / Express Entry / CEC / FSW /
# CRS grid / Citizenship eligibility / 工签入口均沿用 data/archive/ca/gts/。
# 本目录只放 PNP 总览 + 三个最常用省级 Tech stream（BC / OINP / AAIP）。

ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36"

mkdir -p "$ROOT/ircc" "$ROOT/bc" "$ROOT/on" "$ROOT/ab"
: > "$LOG"

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

# ---- IRCC · PNP 联邦框架 ----（同 ca/gts 走 Wayback）
fetch_wa "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/provincial-nominees.html" \
         "ircc/pnp-overview.html"

# ---- BC PNP（直连）----
fetch "https://www.welcomebc.ca/immigrate-to-b-c/about-the-bc-provincial-nominee-program/the-bc-provincial-nominee-program" \
      "bc/bc-pnp-overview.html"

fetch "https://www.welcomebc.ca/immigrate-to-b-c/skills-immigration" \
      "bc/skills-immigration.html"

fetch "https://www.welcomebc.ca/immigrate-to-b-c/about-the-bc-provincial-nominee-program/invitations-to-apply" \
      "bc/invitations-to-apply.html"

# ---- OINP · Ontario（直连，via Wayback for stability）----
fetch_wa "https://www.ontario.ca/page/2024-ontario-immigrant-nominee-program-updates" \
         "on/oinp-2024-updates.html"

fetch_wa "https://www.ontario.ca/page/oinp-tech-draws" \
         "on/oinp-tech-draws.html"

fetch_wa "https://www.ontario.ca/page/oinp-employer-job-offer-foreign-worker-stream" \
         "on/oinp-employer-job-offer.html"

# ---- AAIP · Alberta（直连，via Wayback for stability）----
fetch_wa "https://www.alberta.ca/aaip-alberta-opportunity-stream" \
         "ab/aaip-opportunity-stream.html"

fetch_wa "https://www.alberta.ca/aaip-alberta-express-entry-stream" \
         "ab/aaip-express-entry-stream.html"

echo "---- done ----" | tee -a "$LOG"
