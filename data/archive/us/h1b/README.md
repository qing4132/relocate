# data/archive/us/h1b/

本目录保存 `site/paths/us-h1b.html` 引用的美国 H-1B 相关官方文件本地快照。

所有文件均直接从对应发布机关的官方站点以 HTTPS 抓取，未作任何内容改写。

## 抓取

```sh
./download.sh   # 幂等，已存在则 SKIP
```

## 目录结构与出处

- `uscis/` — U.S. Citizenship and Immigration Services
  - `h1b_overview.html` — "H-1B Specialty Occupations" 总览页
  - `h1b_electronic-registration.html` — 电子注册（抽签报名）流程
  - `h1b_cap-season.html` — 当年 cap season 时间表与计数公告
  - `h1b_employer-data-hub.html` — H-1B 雇主数据查询入口
  - `policy-manual_vol2-part-h.html` — USCIS Policy Manual Vol 2 · Part H（H 分类裁定手册目录）
- `dol/` — U.S. Department of Labor
  - `oflc_h1b-program.html` — Office of Foreign Labor Certification · H-1B / H-1B1 / E-3 项目页（LCA）
  - `whd_h1b-compliance.html` — Wage and Hour Division · H-1B 雇主合规页
- `regulations/`
  - `20-CFR-655_H_LCA.html` — 20 CFR Part 655 Subpart H · LCA 实施细则（ecfr.gov）
  - `8-CFR-214.2_H-L-nonimmigrant.html` — 8 CFR 214.2 · H 与 L 非移民签证细则（ecfr.gov）
- `statutes/`
  - `8-USC-1101_INA-101.html` — 8 U.S.C. § 1101 · INA § 101（定义，含 H-1B 分类）
  - `8-USC-1184_INA-214.html` — 8 U.S.C. § 1184 · INA § 214（非移民签证一般要件）
- `forms/`
  - `I-129.pdf` · `I-129_instructions.pdf` — 非移民工作人员申请
  - `I-539_extend-change-status.pdf` — 非移民身份延期 / 变更（H-4 家属常用）
  - `I-765_EAD.pdf` — 工作许可证（H-4 EAD 用）
  - `I-907_premium-processing.pdf` — 加急审理
  - `DS-160_online-only.url` — 非移民签证在线表，入口 `ceac.state.gov`
  - `I-94_CBP-online.url` — I-94 入出境记录电子版入口 `i94.cbp.dhs.gov`
  - `ETA-9035_LCA_online-only.url` — LCA 仅可在 DOL FLAG 系统在线递，入口 `flag.dol.gov`

## 说明

- **H-4 EAD（2022 年政策）与 cap-gap OPT（F-1 过桥）** 两个专题页的 USCIS 链接近期重组，目前仅在浏览器交互下可命中；本路径不在本目录重复归档。H-4/E/L 配偶 EAD 合并政策页已归档在 [`../l1b-family/policy/uscis_H4-E-L-spouse-EAD.html`](../l1b-family/policy/uscis_H4-E-L-spouse-EAD.html)，与 L-1 共用。
- **成文法与 CFR** 与 L-1B 家庭路径共享条款（INA § 101 / § 214、8 CFR 214.2），在本目录再抓一份以便 H-1B 子路径自包含。
- **AC21 Pub. L. 106-313** 的原始 PDF 已在 [`../l1b-family/statutes/PubL-106-313_AC21.pdf`](../l1b-family/statutes/PubL-106-313_AC21.pdf) 归档，本目录不重复。
