#!/usr/bin/env bash
# 下载 site/paths/us-h1b.html § 10 官方文件总表（及正文引用）中可下载的官方原件。
# 来源：USCIS / DOL OFLC / DOS / Cornell LII / govinfo。
# 说明：与 L-1B 共用的成文法 / CFR / AC21 等，已在 data/archive/us/l1b/ 归档，
# 本 h1b 目录只抓 H-1B 独有的政策页 · LCA 表格 · H-4 EAD 说明等。
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
# ------------------------------------------------------------
fetch "https://www.uscis.gov/working-in-the-united-states/h-1b-specialty-occupations" \
      "uscis/h1b_overview.html"
fetch "https://www.uscis.gov/working-in-the-united-states/temporary-workers/h-1b-specialty-occupations/h-1b-electronic-registration-process" \
      "uscis/h1b_electronic-registration.html"
fetch "https://www.uscis.gov/working-in-the-united-states/temporary-workers/h-1b-specialty-occupations/h-1b-cap-season" \
      "uscis/h1b_cap-season.html"
fetch "https://www.uscis.gov/tools/reports-and-studies/h-1b-employer-data-hub" \
      "uscis/h1b_employer-data-hub.html"
fetch "https://www.uscis.gov/policy-manual/volume-2-part-h" \
      "uscis/policy-manual_vol2-part-h.html"
# H-4 EAD · cap-gap 两个话题的专题页近期均经历 URL 重组，USCIS 搜索目前仅
# 可在浏览器交互下命中；本路径下不重复归档，沿用 us/l1b/policy/ 已归档的
# `uscis_H4-E-L-spouse-EAD.html`（H-4/E/L 配偶 EAD 合并政策页）。

# ------------------------------------------------------------
# § 10.2  DOL OFLC — LCA（Labor Condition Application）
# ------------------------------------------------------------
fetch "https://www.dol.gov/agencies/eta/foreign-labor/programs/h-1b" \
      "dol/oflc_h1b-program.html"
fetch "https://www.dol.gov/agencies/whd/immigration/h1b" \
      "dol/whd_h1b-compliance.html"

# ------------------------------------------------------------
# § 10.3  法规 — LCA 实施细则
# （8 USC 1101/1184、8 CFR 214.2、AC21 等与 L-1B 共享，见 us/l1b/）
# ------------------------------------------------------------
fetch "https://www.ecfr.gov/current/title-20/chapter-V/part-655/subpart-H" \
      "regulations/20-CFR-655_H_LCA.html"
fetch "https://www.ecfr.gov/current/title-8/chapter-I/subchapter-B/part-214/section-214.2" \
      "regulations/8-CFR-214.2_H-L-nonimmigrant.html"
fetch "https://www.law.cornell.edu/uscode/text/8/1101" \
      "statutes/8-USC-1101_INA-101.html"
fetch "https://www.law.cornell.edu/uscode/text/8/1184" \
      "statutes/8-USC-1184_INA-214.html"

# ------------------------------------------------------------
# § 10.4  表格 — H-1B / LCA / H-4 相关
# ------------------------------------------------------------
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-129.pdf" \
      "forms/I-129.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-129instr.pdf" \
      "forms/I-129_instructions.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-539.pdf" \
      "forms/I-539_extend-change-status.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-765.pdf" \
      "forms/I-765_EAD.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-907.pdf" \
      "forms/I-907_premium-processing.pdf"

# LCA（ETA-9035）自 2008 年起仅通过 DOL FLAG 系统在线递，
# 官方不再提供可下载填写的 PDF 表格；此处仅归档表格说明页。
# DS-160 / I-94 同理为在线入口，仅留 .url 指向文件。
mkdir -p "$ROOT/forms"
cat > "$ROOT/forms/DS-160_online-only.url" <<'URL'
[InternetShortcut]
URL=https://ceac.state.gov/genniv/
URL
cat > "$ROOT/forms/I-94_CBP-online.url" <<'URL'
[InternetShortcut]
URL=https://i94.cbp.dhs.gov/
URL
cat > "$ROOT/forms/ETA-9035_LCA_online-only.url" <<'URL'
[InternetShortcut]
URL=https://flag.dol.gov/
URL

echo "---- done ----" | tee -a "$LOG"
