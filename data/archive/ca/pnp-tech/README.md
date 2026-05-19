# CA · Provincial Nominee Program (PNP) · Tech streams · 官方原件归档

这是 `site/paths/ca-pnp-tech.html` 引用的 IRCC + BC PNP + OINP + AAIP 官方原件本地快照。

## 共用件不在此目录

IRPA / IRPR / Citizenship Act / Express Entry / CEC / FSW / CRS grid / Citizenship eligibility / Work Permit 沿用 [`data/archive/ca/gts/`](../gts/)，避免重复存档。本目录只放 PNP 总览 + 三个最常用省级 Tech stream（BC PNP / OINP / AAIP）。

## 子目录

- `ircc/` — IRCC · PNP 联邦框架（IRPA §87 下的程序入口）
- `bc/` — BC PNP（welcomebc.ca · 直连）· Skills Immigration 主程序 + 邀请历史
- `on/` — OINP（Ontario · ontario.ca）· Tech Draws + Employer Job Offer + 2024 政策更新
- `ab/` — AAIP（Alberta · alberta.ca）· Opportunity Stream + Express Entry Stream

## 文件索引

| 文件 | 说明 |
| --- | --- |
| [ircc/pnp-overview.html](ircc/pnp-overview.html) | IRCC · Provincial Nominee Program 总览（Enhanced / Base 两类 · 各省名单 · 与 Express Entry 衔接） |
| [bc/bc-pnp-overview.html](bc/bc-pnp-overview.html) | BC PNP · 程序总览（Skills Immigration / Entrepreneur Immigration 两大类） |
| [bc/skills-immigration.html](bc/skills-immigration.html) | BC PNP · Skills Immigration（Tech / Skilled Worker / International Graduate / Health Authority 等子流） |
| [bc/invitations-to-apply.html](bc/invitations-to-apply.html) | BC PNP · Invitations to Apply（每周 draw 结果与 Tech-only draw 历史） |
| [on/oinp-2024-updates.html](on/oinp-2024-updates.html) | OINP · 2024 项目更新（与 IRCC 配额博弈历史） |
| [on/oinp-tech-draws.html](on/oinp-tech-draws.html) | OINP · Tech Draws（Express Entry 通路 · 特定 NOC 0/1/2/3 紧缺职业） |
| [on/oinp-employer-job-offer.html](on/oinp-employer-job-offer.html) | OINP · Employer Job Offer Foreign Worker Stream（base 通路） |
| [ab/aaip-opportunity-stream.html](ab/aaip-opportunity-stream.html) | AAIP · Alberta Opportunity Stream（base 通路 · 当下持工签工作者主线） |
| [ab/aaip-express-entry-stream.html](ab/aaip-express-entry-stream.html) | AAIP · Alberta Express Entry Stream（enhanced 通路 · CRS ≥ 300 候选邀请） |

## 重抓

```
bash data/archive/ca/pnp-tech/download.sh
```

幂等。canada.ca 与 ontario.ca / alberta.ca 走 Wayback `2025id_` 模式取原始内容（境内 Akamai GeoFilter / 部分 CDN 不稳）；welcomebc.ca 直连。
