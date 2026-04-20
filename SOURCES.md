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
