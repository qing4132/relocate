#!/usr/bin/env bash
# IE · Critical Skills Employment Permit (CSEP) · 官方原件抓取脚本
# 用法：在仓库根目录执行 `bash data/archive/ie/csep/download.sh`
# 幂等：已存在的文件默认跳过；要强制重抓先 rm 目标文件。
#
# 与 canada.ca 不同，enterprise.gov.ie / irishimmigration.ie /
# irishstatutebook.ie 在境内网络可直连，不需要 Wayback 回落。

ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36"

mkdir -p "$ROOT/dete" "$ROOT/laws"
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

# 必要时回落到 Wayback（id_ 模式取原始内容）
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

# ---- DETE (Department of Enterprise, Trade and Employment) · CSEP 主线 ----
fetch "https://enterprise.gov.ie/en/what-we-do/workplace-and-skills/employment-permits/permit-types/critical-skills-employment-permit/" \
      "dete/csep-overview.html"

fetch "https://enterprise.gov.ie/en/what-we-do/workplace-and-skills/employment-permits/employment-permit-eligibility/" \
      "dete/permit-eligibility.html"

# ---- DETE CSOL 与统计页 ----
# 2024 年 DETE 重构站点后，以下原 URL 返回 404：DETE 已把 CSOL 合并到 "lists of
# eligible occupations" 索引页的子表中，不再独立 URL。本项目不强制存档以避免
# CSOL 每季刷新造成的本地快照过期；DETE 原页作外链引用。
# fetch "https://enterprise.gov.ie/en/what-we-do/workplace-and-skills/employment-permits/employment-permit-eligibility/critical-skills-occupations-list/" \
#       "dete/csol.html"
# fetch "https://enterprise.gov.ie/en/publications/employment-permits-statistics.html" \
#       "dete/permits-statistics.html"

# ---- Immigration Service Delivery (ISD) · 消费者向居留 / 入籍页 ----
# irishimmigration.ie 启用 Akamai Bot Manager，对非浏览器 UA 一律返 403；Wayback 也
# 不能抓取 (rate limited / robots.txt)。以下 URLs 仅作页中外链引用佝证，不强制存档。
# 本项目加外佝证以 1956 Nationality Act + 2024 Permits Act + 2004 Immigration Act
# 三部法律原文为主，足够权威。
#   https://www.irishimmigration.ie/registration-stamps/stamp-4/
#   https://www.irishimmigration.ie/registration-stamps/stamp-1g/
#   https://www.irishimmigration.ie/coming-to-live-in-ireland/i-want-to-apply-for-long-term-residency/
#   https://www.irishimmigration.ie/citizenship/becoming-an-irish-citizen-through-naturalisation/
#   https://www.irishimmigration.ie/coming-to-join-family-in-ireland/policy-document-on-non-eea-family-reunification/

# ---- Irish Statute Book · 上位法 ----
fetch "https://www.irishstatutebook.ie/eli/2024/act/17/enacted/en/html" \
      "laws/employment-permits-act-2024.html"

fetch "https://revisedacts.lawreform.ie/eli/2006/act/16/revised/en/html" \
      "laws/employment-permits-act-2006-revised.html"

fetch "https://revisedacts.lawreform.ie/eli/1956/act/26/revised/en/html" \
      "laws/irish-nationality-citizenship-act-1956-revised.html"

fetch "https://www.irishstatutebook.ie/eli/2004/act/1/enacted/en/html" \
      "laws/immigration-act-2004.html"

echo "---- done ----" | tee -a "$LOG"
