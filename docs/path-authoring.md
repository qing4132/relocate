# path-authoring.md — 新增一条路径的工序规范

> 本文件是 [RULES.md](../RULES.md) § 2 / § 5 / § 9 的操作化翻译：**要把一条签证路径
> 从零做到可在产品内展示，必须走完以下 10 个工序**。任何跳步、任何"下次补"、任何
> "先这么着"都是在违反 RULES。
>
> 本文件不是路径详情 HTML 的模板，也不定义字段在 UI 上怎么排列——视觉模板是工序 J
> 的产出，不是工序的起点（[RULES § 4.3](../RULES.md)）。
>
> 本文件的读者：**任何将来增删改一条路径的人**（目前 = 作者本人；未来 = 任何加入
> 本项目的人）。

---

## 前置

- 已读完 [RULES.md](../RULES.md) 全文、[HANDOFF.md](../HANDOFF.md) 的 Now/Next/Don't、
  [SOURCES.md](../SOURCES.md) 的 § 0-§ 3。
- 目标路径已落在 Phase 的 scope 范围内（Phase 0 = **日本 × HSP 积分制**一条，
  其它路径不得提前展开；RULES § 9.1）。
- 可跑 `node`（目前脚手架尚未落地的情况下，至少本地能执行 Node 脚本与 Git LFS）。

---

## 工序一览

```
A. 盘字段    B. 登源    C. 抓取    D. 存档    E. 元数据
F. 节选     G. 字段    H. 复核    I. 构建   J. 视觉模板
                                            ↓
                                   K. 180-day 复核入日历
```

每个工序是一次独立的 commit（与 PR），不得合并。工序之间出现回退是正常的——
发现 D 有问题要退到 B 重登、发现 G 字段不能取值要退到 A 重审——**但不允许跳过**。

---

## A · 盘字段

**目的**：把"这条路径要对外回答什么问题"拆成一张字段表。

**产出**：`docs/paths/<path-id>/fields.md`，列出该路径所需的每一个产品字段，每行：

```
<field-key> | <semantic> | <unit> | <appears-in-ui-as>
```

- `field-key` 形如 `jp-hsp.points.education.doctorate`、`jp-hsp.threshold.70`。
  层级用 `.`，不用驼峰/下划线。
- `appears-in-ui-as` 用自然语言写清在产品哪一屏出现、给谁看；若此时还答不出来，
  说明字段不该存在（[RULES § 2.1.4](../RULES.md)）。

**禁止**：
- 先画出 UI 再回头盘字段——颠倒了 RULES § 4.3。
- 把"可能要用到的字段"先放进来。字段集是一手源集合的子集；多登一个等于背一个债。

**出工序条件**：每一个 field-key 都能在下一工序里找到至少一个候选一手源。

---

## B · 登源

**目的**：把 A 里每个字段所依赖的候选一手源登记到 [SOURCES.md](../SOURCES.md)。

**动作**：按 SOURCES.md § 0.1，每一条源**单独一个 commit**：
- 填满 SOURCES.md § 1 规定的全部字段
- `status: proposed`，`publishesFields` 列出本源覆盖的 A 里的 field-key
- `redistributionQuote` 从官方条款页面原样摘录——不是"政府文档应该都是公开的吧"

**禁止**：
- 同一 commit 登记 + 使用（[RULES § 2.1.1](../RULES.md)）
- 把第三方律所页面、移民中介站、知名博客当候选源（[RULES § 2.1.3](../RULES.md)）
- 把 LLM 生成的说明页当源（[RULES § 2.1.2](../RULES.md)）

**出工序条件**：A 里所有 field-key 在 `publishesFields` 的并集内都能被命中。没命中的
field-key 退回 A，要么找到真实源，要么删字段。

---

## C · 抓取

**目的**：把 B 登记的每个源的原件以字节级原样拉到本地。

**动作**：
- 抓取脚本放 `data/sources/<authority>/<docId>/fetch.mjs`；脚本只做"发请求 → 保存
  原始字节 → 计算 sha256 → 写同目录的 `.meta.json`"三件事，不得清洗、转码、压缩。
- 请求必须记录 UA（本项目固定一个 UA 字符串，在各 fetch.mjs 间共享） + 全量请求头
  响应头（写进 `.meta.json.httpResponseHeaders`）。
- 抓取日期以 UTC 当天为准，写入 `fetchedAt`。

**禁止**：
- 浏览器里"另存为"。保存格式不可控、无响应头记录 → 违反 § 2.7.3。
- 抓取前不先看官方条款页面。条款 `no-redistribution` / `unclear` → 不抓。

**出工序条件**：
- 原件字节与 `.meta.json.sha256` 匹配。
- `.meta.json` 的 `sourceURL` 与请求的实际 URL 字节级一致。

---

## D · 存档

**目的**：按 RULES § 2.7.1 的路径规范把原件落地。

**动作**：移动抓取产物到规范路径：

```
data/archive/<authority>/<docId>/<YYYY-MM-DD>/<sha256>.<ext>
data/archive/<authority>/<docId>/<YYYY-MM-DD>/<sha256>.meta.json
```

二进制原件（PDF / DOCX / XLSX / 图片）走 Git LFS；文本原件（HTML / JSON / CSV /
XML）走普通 Git 存储，便于后续 diff。LFS 的 pattern 在 `.gitattributes` 声明。

**禁止**：
- 同一 docId 覆盖已有 sha256。新版本 = 新日期目录、新 sha256、新增一份（[RULES § 2.7.2](../RULES.md)）
- 删除历史存档——即使抓取损坏。损坏在 `.meta.json.invalid = true` 标出，本体留着。

**出工序条件**：仓库能通过 `git lfs ls-files` 与 `git status` 的干净性核验；
路径的四段（authority / docId / date / sha256）与 `.meta.json` 四字段相互一致。

---

## E · 元数据

**目的**：把抓取时拿到的全部元信息落在 `.meta.json` 里，让"6 个月后复核的人 60 秒
就能原地核对"（RULES § 2.2.1 / § 2.7.3）。

**必填字段**（不全即无效）：
- `fetchedAt` — ISO-8601 秒级 UTC
- `sourceURL` — 实际请求的完整 URL（含 query string）
- `httpResponseHeaders` — 至少 `content-type` / `last-modified` / `etag` / `content-language`（有则填）
- `sha256` — 全长 64 位
- `bytes` — 字节数
- `fetcher` — "脚本名+版本" 或 "人名+日期"
- `authority` / `docId` / `language` / `mediaType` — 冗余但方便检索

**出工序条件**：`.meta.json` 能被 `JSON.parse()` 解析，每字段非空，值与路径 / 文件
对应一致。

---

## F · 节选

**目的**：从存档原件里，为 A 里的每个 field-key 提取一段 `rawQuote`——让以后任何人
能在不打开全文的情况下 30 秒看懂"这个字段的取值是怎么从原件里来的"。

**动作**：在 `data/sources/<authority>/<docId>/rawquotes.json` 里为每个 field-key
写一个条目：

```json
{
  "fieldKey": "jp-hsp.threshold.70",
  "snapshotRef": "data/archive/jp/isa/hsp-scoring-table/2026-05-XX/<sha>.pdf",
  "locator": "p.3, table 1, row 'ポイント合計' / 70",
  "rawQuote": "…ポイントの合計が70点以上…（原文节选）",
  "rawQuoteLanguage": "ja",
  "extractedAt": "2026-05-XX"
}
```

**禁止**：
- `rawQuote` 是对原文的"提炼总结"——必须是原样节选。
- `locator` 写 "PDF 某处" / "大概第 3 页" —— 必须可机器或人工在 60 秒内定位。

**出工序条件**：对每个 field-key，能从 snapshotRef 指向的存档文件里找到 rawQuote
的字节级出现位置。

---

## G · 字段

**目的**：把 A 的字段清单 + F 的 rawQuote 绑定为"产品数据"——RULES § 2.2.1 的五元组：

```
{ value, sourceURL, fetchedAt, rawQuote, snapshotRef }
```

**动作**：在 `data/paths/<path-id>.json` 里为每个字段写一条记录。实际值 `value`
由录入人对照 rawQuote 手工填——不得通过脚本从 rawQuote 里"智能抽取"，那是 LLM
增强的软性变体，违反 § 2.1.2。

**禁止**：
- `value` 写估算、写"大约"、写"参考同类"—— 没有就写 `null`（§ 2.2.2）。
- 任何 `value` 没有对应 snapshotRef，或 snapshotRef 指向的文件不存在—— CI 必须红。

**出工序条件**：每条字段五元组齐全；每个 snapshotRef 文件存在；每个 rawQuote 在
该文件中可定位。

---

## H · 复核

**目的**：让 RULES § 9.4 的"独立复核"落在工序上。

**动作**：
- 首次录入者在不同日期做一次逐字段重走（从 sourceURL 再点一次，重新核对 value）；或
- 如有第二人，由第二人复核
- 复核结果写 `data/paths/<path-id>.review.log`，格式：日期 / 复核人 / 变更（无变 = `unchanged`）

**禁止**：
- 与首次录入同日完成——"独立"需要时间间隔或人间距。
- 以"规则没变"跳过复核（§ 5.2 最后一段）。**复核动作本身是护城河**，不是判断。

**出工序条件**：`review.log` 存在，内容完整。

---

## I · 构建

**目的**：把 `data/paths/<path-id>.json` 推到产品数据层——**唯一合法的写入路径是
`data/build.mjs`**（RULES § 2.3.2）。

**动作**：
- `data/build.mjs` 读入 `data/paths/*.json` + `data/sources/*/rawquotes.json`，做
  schema 校验、snapshotRef 存在性校验、rawQuote 定位校验、`redistribution` 条款校验
- 通过则写出产品端消费的产物（位置待在 B3 首次端到端录入时定）
- CI 静态检查：仓库里除 `data/build.mjs` 以外无任何脚本写产品数据路径

**禁止**：
- 本地跑 `jq` 改 JSON 再 commit。那就是绕过 build.mjs 一次 = 污染一次（§ 2.3.2）。

**出工序条件**：`data/build.mjs` 跑过、CI 跑过。

---

## J · 视觉模板

**目的**：在 I 产物存在的前提下，把该字段集映射为路径详情 HTML / 页面组件——
视觉模板是 **I 完成之后**才开始考虑的事。

**动作**：
- 视觉上参考 `design/` 下已有的 pre-garden 样稿（`path-detail-jp-hsp.html`、
  `coverage-survey.html`、`sitemap.html`）的信息层级
- 不引入新字段；模板只能消费 I 已经构建出的字段
- 遵守 [RULES § 6](../RULES.md)：结论先行、每个数字带 insight、不装饰 emoji、不
  宣传话术、不隐藏来源

**禁止**：
- 为了"界面好看"补任何 null 的占位值（§ 6 + § 9.6 F6）
- 在模板里写死数值作为 fallback（§ 4.8）

**出工序条件**：用户能在模板页面上点开任何展示的数值看到 sourceURL + fetchedAt
（§ 2.4.1）。

---

## K · 180 天复核入日历

**目的**：把 RULES § 5.2 的"6 个月强制复核"钉死成一个**日历事件**，而不是一个
"以后再说"的口头约定。

**动作**：
- 在 `data/review-calendar.md` 新增一行：`<path-id> · <docId> · <next-review-by>`
- `next-review-by = fetchedAt + 180 天`
- 复核动作本身按 [RULES § 5.2](../RULES.md) 最后一段执行：在新日期目录下新增一份
  快照 + sha256 对比 + 追加 review.log

**出工序条件**：日历里有条目；到期未复核的条目在产品 UI 上自动降级为"待复核"。

---

## 工序之间的 commit 粒度

| 工序 | 一个 commit 包含 | 典型提交信息前缀 |
|---|---|---|
| A | fields.md 一条路径的字段表 | `path(<path-id>) A: field catalog` |
| B | SOURCES.md 新增一条 | `path(<path-id>) B: register <authority>/<docId>` |
| C+D+E | 同一源的抓取脚本 + 原件 + meta.json | `path(<path-id>) CDE: archive <authority>/<docId> <date>` |
| F | 同一源的 rawquotes.json | `path(<path-id>) F: rawquote <authority>/<docId>` |
| G | 一条路径的字段 JSON（多字段可一起） | `path(<path-id>) G: fields for <path-id>` |
| H | review.log 一次复核追加 | `path(<path-id>) H: review <date> by <handle>` |
| I | build.mjs 消费新源 / 新字段的改动 | `path(<path-id>) I: build integration` |
| J | 视觉模板 | `path(<path-id>) J: detail template` |
| K | review-calendar.md 一条 | `path(<path-id>) K: schedule <date>` |

合并工序 = 合并 commit 的信号 = 审查时要质问"是否跳了步"。

---

## 失败与回退

**工序 D/E 失败**（抓取损坏、meta 不齐）：标 `invalid: true` 留存，重抓；新日期、
新 sha256，不覆盖。

**工序 F/G 失败**（rawQuote 无法在存档中定位 / 值无源支撑）：退回 B 重审源是否
真能 publish 该字段；实在不能就**删字段**（§ 2.1.4）。

**工序 H 发现与录入不一致**：追加 review.log 记录差异 → 回 G 改 value → 重新 I；
不得在 G 里静默改数。

**工序 I/J 之间发现 schema 缺字段**：退回 A 重盘。§ 4.3 的代价就体现在这里——
宁可在 A 多花时间，不愿在 J 重推。

---

## 这份文件的演进

本文件随首条路径（Phase 0 · 日本 HSP）真实走完一次后**必须审校一次**：
- 哪些工序多余可以合并？
- 哪些工序缺失（比如"通知用户规则变了"）？
- 哪些禁止项现实里破绽最多？

审校动作本身是一次独立 commit，commit message 引用首条路径 end-to-end 的
commit hash 证据。
