# NZ · Skilled Migrant Category Resident Visa (SMC · 6-point) · 官方原件归档

这是 `site/paths/nz-smc.html` 引用的 INZ / DIA / NZ Legislation 官方原件本地快照。

## 子目录

- `inz/` — Immigration New Zealand · SMC 路径主体（overview · 6-point pathway · 三类得分细则 · Resident Visa conditions · PRV 升级）
- `dia/` — Department of Internal Affairs · 入籍（citizenship-by-grant 索引与 govt.nz 总览）
- `laws/` — NZ Legislation · 上位法：Immigration Act 2009 · Citizenship Act 1977

## 文件索引

| 文件 | 说明 |
| --- | --- |
| [inz/smc-overview.html](inz/smc-overview.html) | INZ · Skilled Migrant Category Resident Visa 主页（资格、费用、家属、6-point system 入口） |
| [inz/smc-pathway.html](inz/smc-pathway.html) | INZ · SMC pathway to residence（6 分门槛 + EOI/Invitation 流程） |
| [inz/smc-points-occupational.html](inz/smc-points-occupational.html) | INZ · 从职业注册（occupational registration）取得 3 / 4 / 5 / 6 分的细则 |
| [inz/smc-pay-rates.html](inz/smc-pay-rates.html) | INZ · SMC 收入档（基于 NZ 中位工资倍数：1×/1.5×/2×/3×） |
| [inz/resident-visa-conditions.html](inz/resident-visa-conditions.html) | INZ · Resident Visa 头 2 年的 travel conditions（184 天 / 12 个月口径） |
| [inz/prv-overview.html](inz/prv-overview.html) | INZ · Permanent Resident Visa 主页（PRV · 2 年后无限期回流权） |
| [inz/prv-pathway.html](inz/prv-pathway.html) | INZ · 如何从 Resident Visa 升 PRV（5 条 commitment 路径） |
| [dia/citizenship-index.html](dia/citizenship-index.html) | DIA · Citizenship 服务总览（grant / descent / birth） |
| [dia/citizenship-overview.html](dia/citizenship-overview.html) | govt.nz · NZ Citizenship 消费者向总览 |
| [laws/immigration-act-2009.html](laws/immigration-act-2009.html) | Immigration Act 2009 · SMC / Resident Visa / PRV 的法律基础（DLM1440303） |
| [laws/citizenship-act-1977.html](laws/citizenship-act-1977.html) | Citizenship Act 1977 · 入籍 5 年 + 240 天 / 年 + good character + intention to reside（DLM443684） |

## 重抓

```
bash data/archive/nz/smc/download.sh
```

幂等。`*.govt.nz` 在境内可直连。

> 注：2024 年 INZ 重构了网站结构，原 URL（`/new-zealand-visas/...`）多 301 重定向到新结构（`/visas/` 与 `/live/`）；本脚本直接采新结构 URL。
