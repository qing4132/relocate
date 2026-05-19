#!/usr/bin/env bash
# NZ · Skilled Migrant Category Resident Visa (SMC · 6-point system) · 官方原件抓取脚本
# 用法：在仓库根目录执行 `bash data/archive/nz/smc/download.sh`
# 幂等：已存在的文件默认跳过；要强制重抓先 rm 目标文件。
#
# 注：immigration.govt.nz 已于 2024 年改版，原 URL 多 301 重定向到新结构；
# 本脚本直接采新结构 URL。所有 *.govt.nz 站点在境内可直连，无需 Wayback 回落。

ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36"

mkdir -p "$ROOT/inz" "$ROOT/dia" "$ROOT/laws"
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

# legislation.govt.nz 走 AWS WAF challenge（直连 curl 拿不到正文）→ 走 Wayback
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

# ---- INZ · SMC 主线 ----
fetch "https://www.immigration.govt.nz/visas/skilled-migrant-category-resident-visa/" \
      "inz/smc-overview.html"

fetch "https://www.immigration.govt.nz/live/resident-visas-to-live-in-new-zealand/skilled-residence-pathways-in-new-zealand/skilled-migrant-category-pathway-to-residence/" \
      "inz/smc-pathway.html"

fetch "https://www.immigration.govt.nz/live/resident-visas-to-live-in-new-zealand/skilled-residence-pathways-in-new-zealand/skilled-migrant-category-pathway-to-residence/claiming-skilled-resident-points-from-occupational-registration/" \
      "inz/smc-points-occupational.html"

# legislation.govt.nz 启用 AWS WAF challenge · 直连 curl 持续返 202 空 body ·
# 改走 Wayback `id_` 模式取 2025 年原始内容。
fetch_wa "https://www.legislation.govt.nz/act/public/2009/0051/latest/DLM1440303.html" \
         "laws/immigration-act-2009.html"

fetch_wa "https://www.legislation.govt.nz/act/public/1977/0061/latest/DLM443684.html" \
   fetch "https://www.immigration.govt.nz/live/resident-visas-to-live-in-new-zealand/check-or-change-your-resident-visa-conditions/" \
      "inz/resident-visa-conditions.html"

fetch "https://www.immigration.govt.nz/visas/permanent-resident-visa/" \
      "inz/prv-overview.html"

fetch "https://www.immigration.govt.nz/live/resident-visas-to-live-in-new-zealand/permanent-residence/becoming-a-permanent-resident-of-new-zealand/" \
      "inz/prv-pathway.html"

# ---- DIA · 入籍 ----
fetch "https://www.dia.govt.nz/diawebsite.nsf/wpg_URL/Services-Citizenship-Index" \
      "dia/citizenship-index.html"

fetch "https://www.govt.nz/browse/passports-citizenship-and-identity/nz-citizenship/" \
      "dia/citizenship-overview.html"

# ---- 法律 ----
fetch "https://www.legislation.govt.nz/act/public/2009/0051/latest/DLM1440303.html" \
      "laws/immigration-act-2009.html"

fetch "https://www.legislation.govt.nz/act/public/1977/0061/latest/DLM443684.html" \
      "laws/citizenship-act-1977.html"

echo "---- done ----" | tee -a "$LOG"
