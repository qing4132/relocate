#!/usr/bin/env bash
# UK · Skilled Worker visa · 官方原件抓取脚本
# 用法：在仓库根目录执行 `bash data/archive/uk/skilled-worker/download.sh`
# 幂等：已存在的文件默认跳过；要强制重抓先 rm 目标文件。
#
# 注：gov.uk / legislation.gov.uk 在境内可直连，无需 Wayback 回落。
# 共用件不再次抓取：British Nationality Act 1981 / Immigration Act 1971 /
# Life in UK test / Naturalisation / Citizenship become / Dual citizenship
# 全部沿用 data/archive/uk/global-talent/。本目录只放 Skilled Worker 专属页。

ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36"

mkdir -p "$ROOT/gov-uk" "$ROOT/rules"
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

# ---- GOV.UK · Skilled Worker 主线 ----
fetch "https://www.gov.uk/skilled-worker-visa" \
      "gov-uk/sw-overview.html"

fetch "https://www.gov.uk/skilled-worker-visa/your-job" \
      "gov-uk/sw-your-job.html"

fetch "https://www.gov.uk/skilled-worker-visa/when-you-can-be-paid-less" \
      "gov-uk/sw-paid-less.html"

# ---- GOV.UK · 雇主担保 + ISL ----
fetch "https://www.gov.uk/uk-visa-sponsorship-employers" \
      "gov-uk/sponsor-licence.html"

fetch "https://www.gov.uk/government/publications/skilled-worker-visa-immigration-salary-list" \
      "gov-uk/immigration-salary-list.html"

# ---- GOV.UK · ILR 永居 + 家属 ----
fetch "https://www.gov.uk/indefinite-leave-to-remain" \
      "gov-uk/ilr-overview.html"

fetch "https://www.gov.uk/uk-family-visa/partner-spouse" \
      "gov-uk/family-partner.html"

# ---- Immigration Rules · Appendix Skilled Worker ----
fetch "https://www.gov.uk/guidance/immigration-rules/immigration-rules-appendix-skilled-worker" \
      "rules/appendix-skilled-worker.html"

echo "---- done ----" | tee -a "$LOG"
