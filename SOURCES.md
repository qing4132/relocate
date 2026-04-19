# SOURCES.md — 一手源白名单

> 本文件是 [RULES.md](RULES.md) § 2.1 与 § 2.7 在文档层的落地。
> 任何数据源在**未登记于本文件**的情况下，不得被抓取、不得被存档、不得被产品字段引用。
>
> **本文件当前状态：草稿骨架（B0）。** 没有任何源被登记。首批日本 HSP 相关一手源的
> 登记在 B1 完成，登记 PR 不得同时使用该源（§ 2.1.1）。

---

## § 0 · 变更流程

0.1 **新增源 = 独立 PR**。PR 内容仅包含对本文件的新增，不得同时引入抓取脚本、
不得同时写入 `data/archive/`、不得同时在任何字段里引用该源（§ 2.1.1）。

0.2 **每新增一条源须说明**：
- 为什么该源是"一手源"（发布机关全名 + 法定职能）
- 替代源 / 竞品源是哪些、为什么不选
- 该源是否稳定提供本项目字段清单所需的数据
- 再分发条款的原文摘录（§ 2.7.6）

0.3 **源退役** 走 [data/retirements.log](data/retirements.log)，同时在本文件把该条目
状态改为 `retired` 并保留登记（§ 2.5.2）。不得从本文件中删除历史条目。

0.4 修改本文件不等于修改 RULES.md。本文件在"数据源清单"层级运作；RULES.md 在
"方法论与硬约束"层级运作。本文件永不与 RULES 冲突；若冲突，按 RULES。

---

## § 1 · 条目字段约定

每个源条目必须同时携带以下字段。任一字段缺失，该条目无效，不得使用。

| 字段 | 含义 | 取值约束 |
|---|---|---|
| `authority` | 发布机关代码 | `<country-iso>/<agency-slug>`，如 `jp/moj`、`us/uscis`。在 § 2 登记 |
| `authorityFullName` | 机关全名 | 发布机关自己使用的正式名称（含原文字 + 罗马/英文） |
| `docId` | 人类指定的稳定标识符 | 对应 RULES § 2.7.1 的 `<doc-id>`；URL 可变，docId 不变 |
| `docTitle` | 文档标题 | 直接取官方页面/PDF 标题，原文字 + 中文译名（译名仅用于检索，不用于产品展示） |
| `sourceURL` | 永久可达 URL | 官方域名下稳定入口；不得是搜索结果页、聚合页、镜像站 |
| `language` | 内容语言 | BCP-47，如 `ja`、`en`、`ja-JP` |
| `mediaType` | 期望 Content-Type | 如 `text/html`、`application/pdf` |
| `publishesFields` | 本源稳定提供的产品字段列表 | 与 `docs/path-authoring.md` 的 schema 字段键对齐；不可为空 |
| `updateCadence` | 官方更新频度 | `irregular` \| `monthly` \| `quarterly` \| `annual` \| `on-amendment` \| `unknown` |
| `priority` | 仲裁优先级 | 数字，越小越优先（§ 2.3.3） |
| `redistribution` | 再分发条款标签 | 见 § 3 的五选一 |
| `redistributionQuote` | 再分发条款原文 | 从官方版权/使用条款页面原样摘录，不少于完整一句 |
| `status` | 当前状态 | `proposed` \| `active` \| `suspended` \| `retired` |
| `addedAt` | 登记日期（UTC） | ISO-8601 YYYY-MM-DD |
| `addedBy` | 登记者 | git handle 或真实姓名 |
| `reviewedAt` | 最近复核日期 | ISO-8601；首次登记 = addedAt |
| `notes` | 附注 | 自由文本，不影响机器读取 |

---

## § 2 · `authority` 代码表

新增一个 `authority` 需先在此表登记。登记本身不构成"可使用"——对应的源条目
仍需在 § 4 登记。

```
<country-iso>/<agency-slug>
```

- `country-iso`：ISO 3166-1 alpha-2 小写（`jp`、`us`、`de`、…）
- `agency-slug`：小写 ASCII，连字符分隔，不含缩写扩展；名称采用该机关英文/罗马
  化名称的稳定短形（不随机关改名当天立刻改，等官方主域名变更再跟）

### 已登记机关

> 当前为空。首批（预计覆盖日本 HSP 所需）在 B1 登记。
>
> 预留占位（**不代表已登记**，仅记录 B1 会涉及的候选机关）：
> - `jp/moj` — 法務省 Ministry of Justice
> - `jp/isa` — 出入国在留管理庁 Immigration Services Agency
> - `jp/mhlw` — 厚生労働省 Ministry of Health, Labour and Welfare
> - `jp/nta` — 国税庁 National Tax Agency
> - `jp/stat` — 総務省統計局 Statistics Bureau of Japan
> - `jp/mofa` — 外務省 Ministry of Foreign Affairs

---

## § 3 · 再分发条款标签

与 RULES § 2.7.6 对齐。每个条目必须落在以下五类之一：

| 标签 | 含义 | 存档处置 |
|---|---|---|
| `public-domain` | 明确公有领域 / 政府作品不受版权 | 可公开仓库存档 |
| `permissive-with-attribution` | 允许再分发（含商业），要求署名 | 可公开存档；展示层附归属 |
| `non-commercial-only` | 仅允许非商业再分发 | Phase 0 可公开存档；§ 7.3 商业化前重审 |
| `no-redistribution` | 禁止再分发 | 不存档进公开仓；该源的使用待 § 3.8 重审 |
| `unclear` | 条款不明 | 按 `no-redistribution` 处理，不得假设开放 |

> 日本政府大量文书采用 "政府标准利用规约（第 2.0 版）" （Government Standard Terms
> of Use 2.0），标签为 `permissive-with-attribution`。具体某份文档是否适用该规约
> 须在登记时逐文档核对，不按"同一机关大概都一样"假设。

---

## § 4 · 源登记表

> **当前为空。** 所有源待 B1 起按 § 0.1 的独立 PR 流程登记。
>
> 登记格式（示意，非真实数据；任何非空条目出现前须通过 § 0.1 的独立 PR）：
>
> ```yaml
> - authority: jp/isa
>   authorityFullName: 出入国在留管理庁（Immigration Services Agency of Japan）
>   docId: hsp-scoring-table
>   docTitle: 高度専門職外国人のポイント計算表（Points-Based System Scoring Table）
>   sourceURL: https://www.moj.go.jp/isa/<...>
>   language: ja
>   mediaType: application/pdf
>   publishesFields:
>     - jp-hsp.points.education
>     - jp-hsp.points.career
>     - jp-hsp.points.income
>     - jp-hsp.points.age
>     - jp-hsp.points.japanese
>     - jp-hsp.points.research
>     - jp-hsp.threshold.70
>     - jp-hsp.threshold.80
>   updateCadence: on-amendment
>   priority: 10
>   redistribution: permissive-with-attribution
>   redistributionQuote: "本資料は「政府標準利用規約（第2.0版）」に基づき…"
>   status: proposed
>   addedAt: "YYYY-MM-DD"
>   addedBy: "<handle>"
>   reviewedAt: "YYYY-MM-DD"
>   notes: |
>     （登记人的理由、替代源对比、再分发条款的原始链接等）
> ```

---

## § 5 · 空表的正确读法

本文件目前除 §0–§3 的结构骨架外不含任何真实源。按 RULES § 2.1.1 这是预期状态：

- 一个独立 PR 把结构立起来（当前状态）
- 一批独立 PR 分别登记每一条源（B1）
- 再一批独立 PR 分别把源投入使用（B3 起）

三者不得合并。**登记 ≠ 使用**；使用前登记必须先存在。
