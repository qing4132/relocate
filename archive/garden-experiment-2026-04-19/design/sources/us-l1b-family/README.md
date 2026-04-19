# US · L-1B Family Path · 官方文件归档

对应路径详情 [`../../path-detail-us-l1b-family.html`](../../path-detail-us-l1b-family.html) § 8。
本目录下每一份文件都直接来自发布机关（`.gov` / `law.cornell.edu` / `congress.gov`）原始下载，
不经任何二次编辑。要更新：运行 `download.sh`，它会跳过已存在的文件，只补齐缺失项。

归档日期：2026-04-19。

## 下载情况

- 总计 48 个条目（45 个离线文件 + 3 个在线表单 `.url` 占位）
- `_download.log` 保留了每一条的源 URL 与结果

## 目录结构

```
statutes/       美国法典 8 USC 相关章节（Cornell LII HTML）+ 三部 Public Law（congress.gov PDF）
regulations/    8 CFR / 20 CFR / 22 CFR 相关部分（eCFR 当前 HTML 快照）
policy/         USCIS Policy Manual 入口 + 各机构说明页 + IRS Pub 519
forms/          USCIS / DOL 可下载表格 PDF + 在线表单占位 .url
```

## 在线表单占位

以下为"在线填报无可下载 PDF"的表单，留 `.url` 文件作为入口：

- `forms/DS-160_online-only.url` — 非移民签证申请（DOS CEAC）
- `forms/DS-260_online-only.url` — 移民签证申请（DOS CEAC）
- `forms/I-94_CBP-online.url` — 入出境记录在线查询（CBP）

## 补充说明

- `policy/uscis_H4-E-L-spouse-EAD.html` 使用的是 `uscis.gov/i-765` 稳定入口；该页完整
  列出 L-2 / H-4 / E 等 dependent spouse 的就业授权规则。USCIS 早期的专题页 URL 已失效。
- `policy/uscis_CSPA-guidance.html` 对应 USCIS 2023 年关于 CSPA 采用 Dates for Filing
  的政策更新公告。文件名中不再使用 `PA-2023-02` 前缀，避免 USCIS 后续重编号导致误解。
- eCFR / law.cornell.edu 抓取时偶发 SSL transient，`download.sh` 已加 `--retry-all-errors`。
