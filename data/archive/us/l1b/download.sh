#!/usr/bin/env bash
# 下载 path-detail-us-l1b.html § 8 官方文件总表 全部可下载的官方原件。
# 在线交互式表单（DS-160 / DS-260）无 PDF，用 .url 占位。
# 所有目标均来自 RULES.md 白名单级别一手源（.gov 或 Cornell LII / govinfo）。
set -u

ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_download.log"
: > "$LOG"

UA='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 relocate-archive'

fetch() {
  # fetch <url> <outpath>
  local url="$1" out="$2"
  mkdir -p "$(dirname "$out")"
  if [[ -s "$out" ]]; then
    echo "SKIP  $out" | tee -a "$LOG"
    return 0
  fi
  if curl -fsSL -A "$UA" --retry 2 --max-time 60 -o "$out" "$url"; then
    printf 'OK    %-60s  <- %s\n' "$out" "$url" | tee -a "$LOG"
  else
    printf 'FAIL  %-60s  <- %s\n' "$out" "$url" | tee -a "$LOG"
    rm -f "$out"
  fi
}

stub_url() {
  # stub_url <human-url> <outpath>  —— 给在线表单等无 PDF 的资源留个 .url 指针
  local url="$1" out="$2"
  mkdir -p "$(dirname "$out")"
  cat > "$out" <<EOF
[InternetShortcut]
URL=$url
EOF
  printf 'STUB  %-60s  -> %s\n' "$out" "$url" | tee -a "$LOG"
}

# ------------------------------------------------------------
# § 8.1  法律条款 / Statutes
# ------------------------------------------------------------
# 8 USC（INA 对应条款）从 Cornell LII HTML 页面存档
fetch "https://www.law.cornell.edu/uscode/text/8/1101" "statutes/8-USC-1101_INA-101.html"
fetch "https://www.law.cornell.edu/uscode/text/8/1184" "statutes/8-USC-1184_INA-214.html"
fetch "https://www.law.cornell.edu/uscode/text/8/1153" "statutes/8-USC-1153_INA-203.html"
fetch "https://www.law.cornell.edu/uscode/text/8/1152" "statutes/8-USC-1152_INA-202.html"
fetch "https://www.law.cornell.edu/uscode/text/8/1255" "statutes/8-USC-1255_INA-245.html"
fetch "https://www.law.cornell.edu/uscode/text/8/1427" "statutes/8-USC-1427_INA-316.html"
fetch "https://www.law.cornell.edu/uscode/text/8/1430" "statutes/8-USC-1430_INA-319.html"
fetch "https://www.law.cornell.edu/uscode/text/8/1431" "statutes/8-USC-1431_INA-320.html"
fetch "https://www.law.cornell.edu/uscode/text/8/1423" "statutes/8-USC-1423_INA-312.html"

# Public Laws（govinfo PDF）
fetch "https://www.congress.gov/107/plaws/publ208/PLAW-107publ208.pdf" "statutes/PubL-107-208_CSPA-2002.pdf"
fetch "https://www.congress.gov/106/plaws/publ395/PLAW-106publ395.pdf" "statutes/PubL-106-395_CCA-2000.pdf"
fetch "https://www.congress.gov/106/plaws/publ313/PLAW-106publ313.pdf" "statutes/PubL-106-313_AC21.pdf"

# ------------------------------------------------------------
# § 8.2  联邦法规 / CFR（eCFR HTML 视图；eCFR 同时提供 PDF 下载，但 HTML 更新及时）
# ------------------------------------------------------------
fetch "https://www.ecfr.gov/current/title-8/chapter-I/subchapter-B/part-214/section-214.2" "regulations/8-CFR-214.2_L-H-nonimmigrant.html"
fetch "https://www.ecfr.gov/current/title-8/chapter-I/subchapter-B/part-204/section-204.5" "regulations/8-CFR-204.5_EB-petition.html"
fetch "https://www.ecfr.gov/current/title-8/chapter-I/subchapter-B/part-245"              "regulations/8-CFR-245_AOS.html"
fetch "https://www.ecfr.gov/current/title-8/chapter-I/subchapter-C/part-316"              "regulations/8-CFR-316_naturalization-general.html"
fetch "https://www.ecfr.gov/current/title-8/chapter-I/subchapter-C/part-319"              "regulations/8-CFR-319_naturalization-spouse.html"
fetch "https://www.ecfr.gov/current/title-8/chapter-I/subchapter-C/part-320"              "regulations/8-CFR-320_automatic-citizenship.html"
fetch "https://www.ecfr.gov/current/title-8/chapter-I/subchapter-C/part-312"              "regulations/8-CFR-312_english-civics.html"
fetch "https://www.ecfr.gov/current/title-20/chapter-V/part-656"                          "regulations/20-CFR-656_PERM.html"
fetch "https://www.ecfr.gov/current/title-22/chapter-I/subchapter-E/part-42/subpart-B/section-42.12" "regulations/22-CFR-42.12_cross-chargeability.html"

# ------------------------------------------------------------
# § 8.3  政策手册与说明页
# ------------------------------------------------------------
fetch "https://www.uscis.gov/policy-manual"                                           "policy/uscis-policy-manual_index.html"
fetch "https://www.uscis.gov/working-in-the-united-states/temporary-workers/l-1b-intracompany-transferee-specialized-knowledge" "policy/uscis_L-1B_specialized-knowledge.html"
# L-2/H-4/E spouse EAD 的专题页 URL 屡次变动，这里用 I-765 form 页面作为稳定替代
# （该页完整列出 L-2 / H-4 等类别的工作授权规则）
fetch "https://www.uscis.gov/i-765" "policy/uscis_H4-E-L-spouse-EAD.html"
fetch "https://www.uscis.gov/newsroom/alerts/uscis-updates-child-status-protection-act-cspa-age-calculation-for-certain-adjustment-of-status" "policy/uscis_CSPA-guidance.html"
fetch "https://travel.state.gov/content/travel/en/legal/visa-law0/visa-bulletin.html" "policy/dos_visa-bulletin_index.html"
fetch "https://www.uscis.gov/visabulletininfo"                                        "policy/uscis_when-to-file_visa-bulletin.html"
fetch "https://www.dol.gov/agencies/eta/foreign-labor"                                "policy/dol_oflc_index.html"
fetch "https://flag.dol.gov"                                                          "policy/dol_flag_index.html"
fetch "https://www.irs.gov/pub/irs-pdf/p519.pdf"                                      "policy/irs_Pub-519_tax-guide-aliens.pdf"

# ------------------------------------------------------------
# § 8.4  表格 / Forms
# ------------------------------------------------------------
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-129.pdf"  "forms/I-129.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-129s.pdf" "forms/I-129S_Blanket-L.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-539.pdf"  "forms/I-539_extend-change-status.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-140.pdf"  "forms/I-140_EB-petition.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-907.pdf"  "forms/I-907_premium-processing.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-485.pdf"  "forms/I-485_AOS.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-765.pdf"  "forms/I-765_EAD.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-131.pdf"  "forms/I-131_AP-Reentry.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/i-693.pdf"  "forms/I-693_medical.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/n-470.pdf"  "forms/N-470_preserve-residence.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/n-400.pdf"  "forms/N-400_naturalization.pdf"
fetch "https://www.uscis.gov/sites/default/files/document/forms/n-600.pdf"  "forms/N-600_certificate-of-citizenship.pdf"

fetch "https://www.dol.gov/sites/dolgov/files/ETA/oflc/pdfs/ETA-9089.pdf" "forms/ETA-9089_PERM.pdf"
fetch "https://www.dol.gov/sites/dolgov/files/ETA/oflc/pdfs/ETA_Form_9141.pdf" "forms/ETA-9141_PWD.pdf"

# 在线表单（无 PDF）：留 .url 占位
stub_url "https://ceac.state.gov/genniv"                         "forms/DS-160_online-only.url"
stub_url "https://ceac.state.gov/iv"                             "forms/DS-260_online-only.url"
stub_url "https://i94.cbp.dhs.gov/I94/#/home"                    "forms/I-94_CBP-online.url"

echo
echo "=== 汇总 ==="
grep -c '^OK'   "$LOG" | awk '{print "OK   :", $1}'
grep -c '^STUB' "$LOG" | awk '{print "STUB :", $1}'
grep -c '^FAIL' "$LOG" | awk '{print "FAIL :", $1}'
grep -c '^SKIP' "$LOG" | awk '{print "SKIP :", $1}'
