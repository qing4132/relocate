# AU · National Innovation Visa (Subclass 858，前身 Global Talent Visa / GTV)

## 是什么

澳大利亚 **Subclass 858 · National Innovation Visa（NIV）**，2024 年 12 月从旧名 *Global Talent Visa (GTV)* 更名；subclass 编号不变。**永居（PR）一步到位**签证——一旦获批，主申 + 配偶 + 未成年子女同时获得永久居留。

核心要件（按 Migration Regulations 1994 · Schedule 2 · Part 858）：

- **Internationally recognised record of exceptional and outstanding achievement** · 申请人本人在目标领域有国际公认成就
- **Prominent in field** · 在当前专业领域内仍然"仍然活跃且杰出"
- **Nominator** · 由澳大利亚公民 / PR / 合资格新西兰公民 / 澳大利亚组织提名，提名方在同一领域内"全国有声誉"
- **Ability to attract a salary at or above FWHIT** · Fair Work High Income Threshold，2024-07-01 起为 AUD 175,000 / 年（每年 7 月 1 日指数化调整）
- **Target sectors**（NIV 新版优先领域）· 关键技术（AI / 量子 / 机器人 / 网安）· 绿能 · 先进制造（含国防 / 航天）· 健康产业 · 基建 · 教育 · 农食 · 金融服务
- **邀请制** · 先递 Expression of Interest（EOI，无费用），Home Affairs 评估后发 invitation；收到邀请方可递正式申请（有申请费，主申 AUD 4,840）

**入籍**：Australian Citizenship Act 2007 · s.21 / s.22 —— PR 身份下住满 12 个月 + 过去 4 年内合法居留（含签证前的临时身份）总共 4 年 + 近 12 个月内离境 ≤ 90 天 + 过 citizenship test（18–59 岁）。**澳大利亚自 2002-04-04 起允许双重国籍**（Australian Citizenship Act 2007 修订）；但中国《国籍法》§9 仍独立生效。

## 文件清单

> **2024-12 NIV 更名后站点调整说明**：Home Affairs 在 NIV 更名时把原来的 overview / eligibility / steps / about / nominator 多个子页合并到单一 overview 页；`/eligibility`、`/steps`、`/about`、`/eligibility/nominator` 现在全部 404。本仓库只归档实际存在的 URL（`niv-overview.html` 单页覆盖前述所有内容）。FWHIT 因 `fairwork.gov.au` 在境内网络对直连 curl 超时（且 Wayback 亦未捕获该页），本仓库不做本地归档，页面中以外链 `fwc.gov.au` 指向当期金额；双重国籍态度原 `/citizenship/dual-citizenship` 子页已下线，内容合并进 Citizenship Act 2007 与 "Become a Citizen" 总览。

### 政策页 · Home Affairs（`immi/`）

| 文件 | 源 | 说明 |
| --- | --- | --- |
| `immi/niv-overview.html` | `immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/national-innovation-visa-858` | NIV 858 合并单页 · overview + eligibility + steps + nominator |
| `immi/citizenship-become.html` | `immi.homeaffairs.gov.au/citizenship/become-a-citizen` | 入籍总览 |
| `immi/citizenship-residence.html` | 上同 `/become-a-citizen/permanent-resident` | PR 身份下的入籍通路 · 4 年居留细节 |

### 法律 · legislation.gov.au（`laws/`）

| 文件 | 源 | 说明 |
| --- | --- | --- |
| `laws/migration-act-1958.html` | `legislation.gov.au/C2004A00391/latest/text` | Migration Act 1958 · 移民上位法（registered compilation） |
| `laws/migration-regs-1994.html` | `legislation.gov.au/F1996B00475/latest/text` | Migration Regulations 1994 · 858 在 Schedule 2 · Part 858 |
| `laws/citizenship-act-2007.html` | `legislation.gov.au/C2007A00020/latest/text` | Australian Citizenship Act 2007 · 入籍上位法 |

## 网络说明

- `immi.homeaffairs.gov.au` 直连稳定（2024-12 后 CMS 升级为 SharePoint，单页体积增大至 1.3 MB+）。
- `legislation.gov.au` 直连；`latest/text` 会 302 到当前编号版本，curl `-L` 自动跟随。
- `fairwork.gov.au` 对当前网络做 GeoFilter 302 到本地保留 IP → 直连超时；Wayback 亦未捕获 FWHIT 页面——因此 FWHIT 数字不做本地归档，页面中直接外链到 `fwc.gov.au/agreements-awards/minimum-wages-and-conditions/high-income-threshold`。

## 可重放

```sh
bash data/archive/au/gtv/download.sh
```

幂等：已下载 & 非空（>1KB）的文件会 SKIP。
