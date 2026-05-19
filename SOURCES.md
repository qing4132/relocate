# SOURCES.md — 已用到的一手源清单

> 累进式清单，不是硬前置。引用过哪些源，顺手在这里记一笔，方便以后自己或别人复核。
>
> pivot 后（2026-04-19），[RULES.md](RULES.md) § 2 明确是"尽力而为"——本文件不再是
> 使用前必过的审核关。每条真实使用的源登记一行，就足够。

---

## 格式建议

每条一行 YAML 块，字段能填就填，空着也行。**必要**的只有两项：`authority` 和 `sourceURL`。

```yaml
- authority: jp/isa            # 国家 ISO code 小写 + 机关短名
  authorityFullName: 出入国在留管理庁
  docId: hsp-scoring-table     # 人类起的稳定标识（可选）
  docTitle: 高度専門職ポイント計算表
  sourceURL: https://www.moj.go.jp/isa/...（真实链接）
  language: ja
  notes: |
    第一次使用：2026-XX-XX，用于 design/path-detail-jp-hsp.html 的积分维度表
```

## § 0 · 二手源的态度

pivot 后允许以"二手"身份引用律所 / 博客 / 论坛的整理，但在页面上必须显式标"二手"。
二手源**不需要登记**本文件；只有**官方一手源**才登记。

## § 1 · 已登记的源

### us / l1b（批量登记，2026-04-19）

对应 [`site/paths/us-l1b.html`](site/paths/us-l1b.html) 引用的全部官方一手文件。

- 归档位置：[`data/archive/us/l1b/`](data/archive/us/l1b/)
- 完整源 URL 清单见归档目录下的 [`download.sh`](data/archive/us/l1b/download.sh)（可重放）
- 抓取日志：[`_download.log`](data/archive/us/l1b/_download.log)

涉及发布机关：

- **USCIS**（U.S. Citizenship and Immigration Services）— Policy Manual、I-129 / I-140 / I-485 / I-765 / I-131 / I-907 / I-539 / I-693 / N-400 / N-470 / N-600 表格，H-4/L-2 配偶 EAD 与 CSPA 政策说明页
- **DOS**（U.S. Department of State）— Visa Bulletin 入口、DS-160 / DS-260 在线表单占位、22 CFR § 42.12 cross-chargeability
- **DOL**（U.S. Department of Labor）— OFLC / FLAG 入口、ETA-9089 (PERM) / ETA-9141 (PWD) 表格、20 CFR 656
- **CBP**（U.S. Customs and Border Protection）— I-94 在线查询入口
- **IRS** — Publication 519（U.S. Tax Guide for Aliens）
- **Congress (Public Law PDF via congress.gov)** — INA 主法源法律文本
- **8 USC 相关章节（Cornell LII HTML 快照）** — 1101 / 1151 / 1153 / 1154 / 1182 / 1184 / 1186a / 1255 / 1427 等
- **8 CFR（eCFR HTML 快照）** — §§ 214.2(l) / 245 / 204.5 等

总计 48 条目（45 份离线文件 + 3 份在线表单 `.url` 占位）。

注：pivot 前这批文件曾存于 `archive/garden-experiment-2026-04-19/design/sources/us-l1b-family/`，归档原因是当时 RULES § 2.1.1 要求独立 PR 登记。pivot 后该约束放宽，文件直接挪入 `data/archive/`。详见 [`archive/garden-experiment-2026-04-19/README.md`](archive/garden-experiment-2026-04-19/README.md)。

### ca / ict（2026-05-19）

对应 [`site/paths/ca-ict.html`](site/paths/ca-ict.html) ICT 专属一手源。

- 归档位置：[`data/archive/ca/ict/`](data/archive/ca/ict/)（仅 ICT 专属页；上位法 / Express Entry / 入籍系列沿用 `data/archive/ca/gts/`）
- 完整 URL 见 [`download.sh`](data/archive/ca/ict/download.sh)

涉及发布机关：

- **IRCC**（Immigration, Refugees and Citizenship Canada）— International Mobility Program · Significant benefit · Intra-company transferees · R205(a) 单页（含 Executive / Senior Manager / Specialized Knowledge 三档评估细则、qualifying relationship、C12 / C61 / C62 / C63 国别协定、累计期上限、"new office" 1 年首签变体、ESDC prevailing wage）

注：2025 年 IRCC 已把原先按 "C12 / 专门知识 / 高管 / qualifying relationship" 拆开的多个 IMP 子页合并到上述单一 R205(a) 页；这是 ICT 路径上最权威的单一来源。

### ie / csep（2026-05-19）

对应 [`site/paths/ie-csep.html`](site/paths/ie-csep.html) CSEP 专属一手源。

- 归档位置：[`data/archive/ie/csep/`](data/archive/ie/csep/)
- 完整 URL 见 [`download.sh`](data/archive/ie/csep/download.sh)

涉及发布机关：

- **DETE**（Department of Enterprise, Trade and Employment）— CSEP Overview · 通用资格页（雇主认可 / 50/50 / 工时 / 薪资）
- **Irish Statute Book / revisedacts.lawreform.ie**：Employment Permits Act 2024（五类许可合并法）· Employment Permits Act 2006（含 2014 / 2018 修订的综合版）· Irish Nationality and Citizenship Act 1956（综合版）· Immigration Act 2004

注：irishimmigration.ie（ISD）启用 Akamai Bot Manager，对非浏览器 UA 一律返 403；Wayback 同样不可获取。本路径页以 1956 Nationality Act + 2024 Permits Act + 2004 Immigration Act 三部法律原文作为佝证主轴，ISD 消费向页仅作页中外链。

DETE Critical Skills Occupations List 与季度统计页因 2024 年站点重构 URL 不稳定，本项目不强制存档以避免本地快照与官方不同步。

### nz / smc（2026-05-19）

对应 [`site/paths/nz-smc.html`](site/paths/nz-smc.html) SMC 专属一手源。

- 归档位置：[`data/archive/nz/smc/`](data/archive/nz/smc/)
- 完整 URL 见 [`download.sh`](data/archive/nz/smc/download.sh)

涉及发布机关：

- **INZ**（Immigration New Zealand）— SMC overview / pathway / occupational registration points / pay rates / Resident Visa conditions / PRV overview / PRV pathway 共 7 页
- **DIA**（Department of Internal Affairs）+ **govt.nz** — Citizenship 服务总览 + 消费者向总览共 2 页
- **NZ Legislation** — Immigration Act 2009（DLM1440303）· Citizenship Act 1977（DLM443684）

注：immigration.govt.nz / dia.govt.nz 在境内可直连；legislation.govt.nz 启用 AWS WAF challenge 拒非浏览器 UA（连续返 202 空响应），两部法律走 `web.archive.org/web/2025id_/` 获取。INZ 网站 2024 年重构，原 `/new-zealand-visas/` URL 结构多 301 重定向到新的 `/visas/` 与 `/live/` 路径，本项目直接采新结构 URL。

### uk / skilled-worker（2026-05-19）

对应 [`site/paths/uk-skilled-worker.html`](site/paths/uk-skilled-worker.html) SW 专属一手源。

- 归档位置：[`data/archive/uk/skilled-worker/`](data/archive/uk/skilled-worker/)（仅 SW 专属页；British Nationality Act 1981 / Immigration Act 1971 / Life in UK Test / Naturalisation / Citizenship become / Dual citizenship 共用件沿用 [`data/archive/uk/global-talent/`](data/archive/uk/global-talent/)）
- 完整 URL 见 [`download.sh`](data/archive/uk/skilled-worker/download.sh)

涉及发布机关：

- **GOV.UK · Home Office UKVI** — Skilled Worker visa 总览 / Your Job 子页 / When you can be paid less / Sponsor Licence / Immigration Salary List / ILR 总览 / UK family visa partner 共 7 页
- **Immigration Rules · Home Office** — Appendix Skilled Worker（SW 1.1–SW 26.7 法定要件）

注：gov.uk 在境内可直连；SW 薪资门槛 2025 年口径一般档 £41,700 / ISL 档 £33,400（8 份原件均为 2026-05-19 抓取）。Sponsor Licence 公开名单 / SOC 2020 going rate 表由于频繁刷新不在本地归档，仅在 § 10.4 外链引用。
