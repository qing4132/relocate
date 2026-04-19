#!/usr/bin/env bash
# 下载 site/paths/us-o1.html § 10 官方文件总表（及正文引用）中可下载的官方原件。
# 来源：USCIS / Cornell LII / eCFR。
# 说明：与 L-1B / H-1B 共用的 INA §101 / §214 / §245 / §316 / §319 / §320 ·
# AC21 · CSPA · CCA · 8 CFR 245 · I-485 / I-765 / I-131 / I-693 / N-400 / N-470 /
# N-600 · IRS Pub 519 等已在 data/archive/us/l1b-family/ 与 data/archive/us/h1b/
# 归档，本 o1 目录只抓 O-1 独有的政策与法规页。
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
    printf 'OK    %-64s  <- %s\n' "$out" "$url" | tee -a "$LOG"
  else
    printf 'FAIL  %-64s  <- %s\n' "$out" "$url" | tee -a "$LOG"
    rm -f "$out"
  fi
}

# ------------------------------------------------------------
# § 10.1  USCIS 政策与说明页
# USCIS 2023 重组后将 O-1A / O-1B / O-2 / O-3 合并至同一 overview 页，
# 子页独立 URL 已 404。
# ------------------------------------------------------------
fetch "https://www.uscis.gov/working-in-the-united-states/temporary-workers/o-1-visa-individuals-with-extraordinary-ability-or-achievement" \
      "uscis/o1_overview.html"
fetch "https://www.uscis.gov/working-in-the-united-states/temporary-workers/o-1-individuals-with-extraordinary-ability-or-achievement/o-nonimmigrant-classifications-question-and-answers" \
      "uscis/o-nonimmigrant_qa.html"
fetch "https://www.uscis.gov/working-in-the-united-states/temporary-workers/address-index-for-i-129-o-and-p-consultation-letters" \
      "uscis/o1_consultation-letter-addresses.html"
fetch "https://www.uscis.gov/policy-manual/volume-2-part-m" \
      "uscis/policy-manual_vol2-part-m_O.html"
# 2022-01 USCIS 针对 STEM / 企业家的 O-1A 证据澄清备忘（Policy Alert PA-2022-03）
fetch "https://www.uscis.gov/sites/default/files/document/policy-manual-updates/20220121-ExtraordinaryAbility.pdf" \
      "uscis/policy-alert_O-1A-STEM_2022-01.pdf"

# ------------------------------------------------------------
# § 10.2  法规 — 8 CFR 214.2 · O 类实施细则（o 段位于同一长文内）
# ------------------------------------------------------------
fetch "https://www.ecfr.gov/current/title-8/chapter-I/subchapter-B/part-214/section-214.2" \
      "regulations/8-CFR-214.2_O-nonimmigrant.html"

# ------------------------------------------------------------
# § 10.3  法律条款 — INA §101(a)(15)(O) · §214
# ------------------------------------------------------------
fetch "https://www.law.cornell.edu/uscode/text/8/1101" \
      "statutes/8-USC-1101_INA-101.html"
fetch "https://www.law.cornell.edu/uscode/text/8/1184" \
      "statutes/8-USC-1184_INA-214.html"

# ------------------------------------------------------------
# § 10.4  表格 — I-129 / I-907 / I-539 / I-765
# I-129 内含 O-supplement（附件 O），不单独发布。
# ------------------------------------------------------------
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-129.pdf" \
      "forms/I-129.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-129instr.pdf" \
      "forms/I-129_instructions.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-907.pdf" \
      "forms/I-907_premium-processing.pdf"

# DS-160 / I-94 为在线入口，仅留 .url stub。
mkdir -p "$ROOT/forms"
cat > "$ROOT/forms/DS-160_online-only.url" <<'URL'
[InternetShortcut]
URL=https://ceac.state.gov/genniv/
URL
cat > "$ROOT/forms/I-94_CBP-online.url" <<'URL'
[InternetShortcut]
URL=https://i94.cbp.dhs.gov/
URL

echo "---- done ----" | tee -a "$LOG"
