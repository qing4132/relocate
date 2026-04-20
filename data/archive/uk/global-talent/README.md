# UK · Global Talent Visa

## 是什么

英国 **Global Talent Visa**（2020 年替代 Tier 1 Exceptional Talent）——通过**指定背书机构**（endorsing body）或**国际知名奖项**（prestigious prize，如诺贝尔 / Turing / Fields）认定申请人"世界级天赋或潜力"后发放的工签；无雇主绑定，5 年内可申永居（Indefinite Leave to Remain，ILR），再 12 个月可入籍。

四条背书赛道：

- **Research & Academia** · Royal Society / British Academy / Royal Academy of Engineering / UKRI（含 Fellowship / Endorsed Funder / Academic and Research Appointments / Peer Review 四类路径）
- **Digital Technology** · 原 Tech Nation（2023-04 关停），现由 UKRI 接管（Technation programme 并入）
- **Arts & Culture** · Arts Council England（下辖戏剧 / 舞蹈 / 音乐 / 视觉艺术 / 文学 / 博物馆 / 综合艺术 七条分支，并代理 PACT / British Fashion Council / Royal Institute of British Architects 的背书）
- **Prestigious Prize** · 无需背书，获得指定国际大奖（见 `rules/appendix-gt-prizes.html`）可直接递签

两档：

- **Exceptional Talent** · 已是该领域全球公认的 established leader
- **Exceptional Promise** · 有潜力成为 leader 的 emerging 阶段（年轻学者 / 技术创业者 / 早期艺术家）

**ILR**：Exceptional Talent 档持签 3 年可申 ILR；Exceptional Promise 档持签 5 年可申 ILR。须满足 5 年内离境 ≤ 180 天 / 年的 Continuous Residence 规则。

**入籍**：British Nationality Act 1981 · Schedule 1 · 入籍申请时已持 ILR ≥ 12 个月 + 在英合法居留 5 年 + 近 5 年离境总计 ≤ 450 天 + 近 12 个月离境 ≤ 90 天 + 通过 Life in the UK Test + English B1 以上 + good character。

**双重国籍**：英国自始即允许（无法定限制）；中国《国籍法》§9 独立生效。

## 文件清单

### 政策页 · GOV.UK（`gov-uk/`）

| 文件 | 源 | 说明 |
| --- | --- | --- |
| `gov-uk/gt-overview.html` | `gov.uk/global-talent` | Global Talent 总览（含 stage 1 / stage 2 / 延签 / ILR 的摘要页，GOV.UK 为该系列采用单页多锚点结构） |
| `gov-uk/gt-stage1-endorsement.html` | `gov.uk/global-talent/apply-stage-1-endorsement` | 同 overview（GOV.UK 实为单页重定向） |
| `gov-uk/gt-stage2-visa.html` | 上同 `/apply-stage-2-visa` | 同上 |
| `gov-uk/gt-extend.html` | 上同 `/extend-your-visa` | 延签要件 |
| `gov-uk/gt-settle.html` | 上同 `/apply-to-settle` | ILR 申请通路（与 overview 同内容） |
| `gov-uk/gt-researcher.html` | `gov.uk/global-talent-researcher-academic` | Research & Academia 赛道专页 |
| `gov-uk/gt-digital.html` | `gov.uk/global-talent-digital-technology` | Digital Technology 赛道专页 |
| `gov-uk/gt-arts.html` | `gov.uk/global-talent-arts-culture` | Arts & Culture 赛道专页 |
| `gov-uk/citizenship-become.html` | `gov.uk/becoming-a-british-citizen` | 入籍总览 |
| `gov-uk/citizenship-naturalise.html` | `gov.uk/apply-citizenship-indefinite-leave-to-remain` | ILR → Citizenship 通路 |
| `gov-uk/life-in-uk-test.html` | `gov.uk/life-in-the-uk-test` | Life in UK Test 规则 |
| `gov-uk/dual-citizenship.html` | `gov.uk/dual-citizenship` | UK 对双重国籍的官方口径（允许） |

### 移民规则 · Immigration Rules（`rules/`）

| 文件 | 源 | 说明 |
| --- | --- | --- |
| `rules/appendix-global-talent.html` | `gov.uk/guidance/immigration-rules/immigration-rules-appendix-global-talent` | **Appendix Global Talent**（具体条款、证据要求、Continuous Residence 规则等） |
| `rules/appendix-gt-prizes.html` | 上同 `/immigration-rules-appendix-global-talent-prestigious-prizes` | **Prestigious Prizes 附表**（免背书的国际大奖名单） |

### 法律 · legislation.gov.uk（`laws/`）

| 文件 | 源 | 说明 |
| --- | --- | --- |
| `laws/immigration-act-1971.html` | `legislation.gov.uk/ukpga/1971/77` | Immigration Act 1971 · 移民上位法（入境权 · Leave to Remain · 递解） |
| `laws/british-nationality-act-1981.html` | `legislation.gov.uk/ukpga/1981/61` | British Nationality Act 1981 · 国籍法（§6 naturalisation + Schedule 1 居留标准） |

## 网络说明

- `gov.uk` 直连稳定（CDN 全球）。
- `legislation.gov.uk` 直连；两部上位法有累计 updates，归档取的是当前 latest/text。
- GOV.UK 在 Global Talent 系列下的 `/apply-stage-1-endorsement`、`/apply-stage-2-visa`、`/apply-to-settle` 等"下一步"页面采用单页多区块结构（URL 返回同 HTML），因此多个本地归档文件在字节层面可能一致——以 `gt-overview.html` 为主即可；其他文件是同一份的结构化引用点。
- `gov.uk/global-talent/extend-your-visa`、`/global-talent-prestigious-prize`、`/indefinite-leave-to-remain-global-talent` 等 URL 在当前时间 404：GOV.UK 将 ILR 入口合并到 `/apply-to-settle` 与 `/indefinite-leave-to-remain`（general），Prestigious Prize 细节由 Immigration Rules Appendix 承载（`rules/appendix-gt-prizes.html`）。本仓库只归档实际存在的 URL。

## 可重放

```sh
bash data/archive/uk/global-talent/download.sh
```

幂等：已下载 & 非空（>2 KB）的文件会 SKIP。
