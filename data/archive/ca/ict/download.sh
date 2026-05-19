#!/usr/bin/env bash
# CA · Intra-Company Transferee (ICT) · 官方原件抓取脚本
# 用法：在仓库根目录执行 `bash data/archive/ca/ict/download.sh`
# 幂等：已存在的文件默认跳过；要强制重抓先 rm 目标文件。
#
# 注：与 ca/gts/download.sh 同口径 —— canada.ca 在部分境内网络被 TCP 劫持，
# 直连 curl 超时；统一走 web.archive.org `id_` 模式取原始内容。
#
# 共用件不再次抓取：IRPA / IRPR / Citizenship Act / Express Entry / CEC /
# CRS grid / Work Permit / Citizenship 系列均沿用 data/archive/ca/gts/。
# 本目录只放 ICT 专属页 —— 2025 年 IRCC 已把原先按 "C12 / C61 / specialized
# knowledge / executive / qualifying relationship" 拆成多个 IMP 子页的内容
# 合并到单一 R205(a) 页，因此本目录核心也就只有一份 `ircc/ict-r205a.html`。

ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36"

mkdir -p "$ROOT/ircc"
: > "$LOG"

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

# ---- IRCC · IMP · Significant benefit · Intra-company transferees · R205(a) ----
# 单一权威页：三档（Executive / Senior Manager / Specialized Knowledge）评估细则、
# "Qualifying relationship"（parent / subsidiary / branch / affiliate）、
# C12 通用 / C61 CUSMA / C62 CETA / C63 CPTPP 国别协定、最长累计期 SK 5 年 /
# Exec/Mgr 7 年、工资底线、"新办公室" 1 年首签变体。
fetch_wa "https://www.canada.ca/en/immigration-refugees-citizenship/corporate/publications-manuals/operational-bulletins-manuals/temporary-residents/foreign-workers/exemption-codes/intra-company-transferees.html" \
         "ircc/ict-r205a.html"

echo "---- done ----" | tee -a "$LOG"
