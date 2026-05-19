# IE · Critical Skills Employment Permit (CSEP) · 官方原件归档

这是 `site/paths/ie-csep.html` 引用的 DETE / Irish Statute Book 官方原件本地快照。

## 子目录

- `dete/` — Department of Enterprise, Trade and Employment · CSEP 项目主页与通用资格页
- `laws/` — Irish Statute Book / revisedacts.lawreform.ie · 上位法：Employment Permits Act 2024 · Employment Permits Act 2006 （修订版）· Irish Nationality and Citizenship Act 1956 （修订版）· Immigration Act 2004

## 文件索引

| 文件 | 说明 |
| --- | --- |
| [dete/csep-overview.html](dete/csep-overview.html) | DETE · Critical Skills Employment Permit 总览（含 €38K / €64K 双门槛 · 2 年期 · Stamp 4 衔接） |
| [dete/permit-eligibility.html](dete/permit-eligibility.html) | DETE · 通用资格页（雇主认可 · 工时 · 薪资 · 50/50 规则等） |
| [laws/employment-permits-act-2024.html](laws/employment-permits-act-2024.html) | Employment Permits Act 2024 · 最新合并法（五类许可：CSEP / GEP / LSEP / SCEP / 季节性） |
| [laws/employment-permits-act-2006-revised.html](laws/employment-permits-act-2006-revised.html) | Employment Permits Act 2006 · 含历次修订（2014/2018等）的 revisedacts.lawreform.ie 综合版 |
| [laws/irish-nationality-citizenship-act-1956-revised.html](laws/irish-nationality-citizenship-act-1956-revised.html) | Irish Nationality and Citizenship Act 1956 · 含历次修订的综合版（入籍门槛与双重国籍设计） |
| [laws/immigration-act-2004.html](laws/immigration-act-2004.html) | Immigration Act 2004 · 居留登记与 GNIB / IRP 卡发放 |

## 不独立归档的页

以下官方页在本地不独立存档，只在路径页中作外链引用：

- **ISD（Immigration Service Delivery）消费者页**：irishimmigration.ie 启用 Akamai Bot
  Manager，对非浏览器 UA / Wayback 抓取一律返 403。Stamp 4 / Stamp 1G / Long Term
  Residency / Naturalisation / Family Reunification 五页仅作外链。本项目以 1956
  Nationality Act + 2024 Permits Act + 2004 Immigration Act 三部法律原文为佝证主轴。
- **DETE Critical Skills Occupations List 与季度统计**：2024 年 DETE 重构站点后原 URL
  返 404；CSOL 本身每季刷新、本项目不强制存档以避免快照与官方不同步。

详见 [`download.sh`](download.sh) 中的注释。

## 重抓

```
bash data/archive/ie/csep/download.sh
```

幂等。enterprise.gov.ie / irishstatutebook.ie / revisedacts.lawreform.ie 在境内网络可直连，不需 Wayback 回落。
