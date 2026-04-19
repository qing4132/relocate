#!/usr/bin/env bash
# 下载 site/paths/jp-hsp.html § 7 官方文件总表（及正文引用）中可下载的官方原件。
# 来源：法務省出入国在留管理庁 / e-Gov 法令検索 / 法務省民事局 / 厚生労働省 / 全国人大。
set -u

ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
: > "$LOG"

UA='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 relocate-archive'

fetch() {
  local url="$1" out="$2"
  mkdir -p "$(dirname "$out")"
  if [[ -s "$out" ]]; then
    echo "SKIP  $out" | tee -a "$LOG"
    return 0
  fi
  if curl -fsSL -A "$UA" --retry 2 --max-time 60 -o "$out" "$url"; then
    printf 'OK    %-72s  <- %s\n' "$out" "$url" | tee -a "$LOG"
  else
    printf 'FAIL  %-72s  <- %s\n' "$out" "$url" | tee -a "$LOG"
    rm -f "$out"
  fi
}

# ------------------------------------------------------------
# § 7.1  出入国在留管理庁（ISA） — 在留资格 · 积分制 · 永住 · 家属就劳
# ------------------------------------------------------------
fetch "https://www.moj.go.jp/isa/applications/resources/newimmiact_3_index.html" \
      "isa/hsp_points-system.html"
fetch "https://www.moj.go.jp/isa/applications/status/designatedactivities02_00004.html" \
      "isa/hsp_status-page.html"
fetch "https://www.moj.go.jp/isa/content/930001657.pdf" \
      "isa/hsp_points-calculation-table.pdf"
fetch "https://www.moj.go.jp/isa/applications/procedures/16-4.html" \
      "isa/eijuu_guidelines.html"
fetch "https://www.moj.go.jp/isa/applications/status/designatedactivities02_00003.html" \
      "isa/hsp-spouse-employment.html"
fetch "https://www.moj.go.jp/isa/applications/status/gijinkoku.html" \
      "isa/gijinkoku_engineer-humanities.html"
fetch "https://www.moj.go.jp/isa/applications/status/businessmanager.html" \
      "isa/keiei-kanri_business-manager.html"
fetch "https://www.moj.go.jp/isa/applications/status/dependent.html" \
      "isa/dependent_family-stay.html"

# ------------------------------------------------------------
# § 7.2  e-Gov 法令検索 — 入管法 / 国籍法
# （e-Gov 检索页是 SPA，curl 仅能取到外壳；改用官方 API 取法令 XML 全文）
# ------------------------------------------------------------
fetch "https://laws.e-gov.go.jp/api/1/lawdata/326CO0000000319" \
      "law/e-gov_immigration-act.xml"
fetch "https://laws.e-gov.go.jp/api/1/lawdata/325AC0000000147" \
      "law/e-gov_nationality-act.xml"

# ------------------------------------------------------------
# § 7.3  法務省民事局 — 帰化許可申請
# ------------------------------------------------------------
fetch "https://www.moj.go.jp/MINJI/minji78.html" \
      "moj/kika_naturalization.html"

# ------------------------------------------------------------
# § 7.4  厚生労働省 — 公的年金制度
# ------------------------------------------------------------
fetch "https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/nenkin/nenkin/index.html" \
      "mhlw/public-pension.html"

# ------------------------------------------------------------
# § 7.5  全国人民代表大会 — 中华人民共和国国籍法
# ------------------------------------------------------------
fetch "http://www.npc.gov.cn/npc/c2/c30834/201805/t20180526_187129.html" \
      "prc/prc_nationality-act.html"

echo "---- done ----" | tee -a "$LOG"
