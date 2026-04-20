# CA · Global Talent Stream · 官方原件归档

这是 `site/paths/ca-gts.html` 引用的 ESDC / IRCC / Justice Laws 官方原件本地快照。

## 子目录

- `esdc/` — Employment and Social Development Canada · GTS 项目主体（Category A / B · LMBP · Global Talent Occupations List · 处理服务标准）
- `ircc/` — Immigration, Refugees and Citizenship Canada · 工签 / Express Entry / CEC / FSW / CRS / Citizenship / 物理存在
- `laws/` — Justice Laws · IRPA（Immigration and Refugee Protection Act）· IRPR · Citizenship Act

## 文件索引

| 文件 | 说明 |
| --- | --- |
| [esdc/gts-overview.html](esdc/gts-overview.html) | ESDC · Global Talent Stream 总览 |
| [esdc/gts-employer.html](esdc/gts-employer.html) | ESDC · GTS Requirements 雇主指南（Category A / B · LMBP · 处理标准 · 工资下限） |
| [esdc/gts-occupations.html](esdc/gts-occupations.html) | ESDC · GTS Applicant Guide + Global Talent Occupations List（Category B 岗位清单） |
| [ircc/work-permit-lmia-exempt.html](ircc/work-permit-lmia-exempt.html) | IRCC · Temporary work permits（LMIA-exempt / GTS 流程） |
| [ircc/express-entry.html](ircc/express-entry.html) | IRCC · Express Entry 总览（PR 主通道） |
| [ircc/cec.html](ircc/cec.html) | IRCC · Canadian Experience Class（CEC，工签经验转 PR） |
| [ircc/fsw.html](ircc/fsw.html) | IRCC · Federal Skilled Worker（FSW，技术移民） |
| [ircc/crs-grid.html](ircc/crs-grid.html) | IRCC · Comprehensive Ranking System 打分表 |
| [ircc/citizenship-become.html](ircc/citizenship-become.html) | IRCC · Become a Canadian citizen（3/5 物理存在规则） |
| [ircc/citizenship-physical-presence.html](ircc/citizenship-physical-presence.html) | IRCC · Citizenship eligibility（含物理存在 1,095 天 · 税务 · 语言 · 测试） |
| [laws/irpa.html](laws/irpa.html) | IRPA · Immigration and Refugee Protection Act（SC 2001, c.27） |
| [laws/irpr.html](laws/irpr.html) | IRPR · Immigration and Refugee Protection Regulations |
| [laws/citizenship-act.html](laws/citizenship-act.html) | Citizenship Act（R.S.C. 1985, c. C-29） |

## 重抓

```
bash data/archive/ca/gts/download.sh
```

已存在的文件默认跳过；幂等。

> 注：canada.ca 在部分境内网络会被 TCP 劇持至保留 IP，直连 curl 会 TLS 握手成功但 HTTP 请求超时。本脚本对 canada.ca 主动走 `web.archive.org/web/2025id_/` 模式（取 2025 年快照的原始内容，不带 Wayback 工具条）。justice.gc.ca 不受影响，直连。
