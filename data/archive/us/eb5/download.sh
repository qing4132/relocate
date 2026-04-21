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

# EB-5 总览（投资者门户 · 含 RIA 2022 指引 · Regional Center 项目介绍）
fetch "https://www.uscis.gov/working-in-the-united-states/permanent-workers/eb-5-immigrant-investor-program" \
      "uscis/eb5_overview.html"

# Policy Manual Vol 6 Part G · Investors（EB-5 政策手册全部章节索引）
fetch "https://www.uscis.gov/policy-manual/volume-6-part-g" \
      "uscis/policy-manual_vol6-part-g_eb5.html"

# I-526 / I-526E 申请指南（RIA 之后 direct 用 I-526 · Regional Center 用 I-526E）
fetch "https://www.uscis.gov/i-526" \
      "uscis/i-526_page.html"
fetch "https://www.uscis.gov/i-526e" \
      "uscis/i-526e_page.html"

# I-829（有条件绿卡转无条件）
fetch "https://www.uscis.gov/i-829" \
      "uscis/i-829_page.html"

# 法条：INA §203(b)(5) / 8 USC §1153 · 已在 l1b/statutes 有（共用）
# EB-5 细则：8 CFR 204.6（独有，需单独抓）
fetch "https://www.ecfr.gov/current/title-8/chapter-I/subchapter-B/part-204/subpart-F/section-204.6" \
      "regulations/8-CFR-204.6_EB-5.html"

# 8 CFR 216.6（条件性居民转无条件 · EB-5 专用）
fetch "https://www.ecfr.gov/current/title-8/chapter-I/subchapter-B/part-216/section-216.6" \
      "regulations/8-CFR-216.6_remove-conditions-EB5.html"

# PubL 117-103 Division BB · EB-5 Reform and Integrity Act of 2022
fetch "https://www.congress.gov/117/plaws/publ103/PLAW-117publ103.pdf" \
      "statutes/PubL-117-103_EB-5-RIA-2022.pdf"

# Forms · EB-5 专用（I-526 / I-526E / I-829）
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-526.pdf" \
      "forms/I-526_immigrant-investor.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-526e.pdf" \
      "forms/I-526E_regional-center.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-829.pdf" \
      "forms/I-829_remove-conditions.pdf"

echo "---" | tee -a "$LOG"
echo "done. see $LOG" | tee -a "$LOG"
