# CA · Intra-Company Transferee (ICT) · 官方原件归档

这是 `site/paths/ca-ict.html` 引用的 IRCC 官方原件本地快照。

## 共用件不在此目录

上位法（IRPA / IRPR / Citizenship Act）与 PR 阶段共用页（Express Entry / CEC /
CRS grid / Citizenship eligibility / Work Permit 总览）沿用
[`data/archive/ca/gts/`](../gts/)，避免重复存档。

## 本目录文件

| 文件 | 说明 |
| --- | --- |
| [ircc/ict-r205a.html](ircc/ict-r205a.html) | IRCC · IMP · Significant benefit · Intra-company transferees · R205(a) —— 2025 年 IRCC 已把原先按"C12 / 专门知识 / 高管 / qualifying relationship"拆开的多个 IMP 子页合并到这一份单页里，是 ICT 路径上最权威的单一来源。覆盖三档评估细则、qualifying relationship、国别协定 C61 / C62 / C63、累计期上限（SK 5 年 · Exec/Mgr 7 年）、"新办公室"1 年首签变体。 |

## 不再独立归档的页

以下消费者向 / 子页在 2025 年 IRCC 站点重组中被合并或删除、URL 路径不稳定，
本仓库只在路径页中作外链引用，不强制存档：

- IRCC · Temporary work permit 消费者总览（结构性合并到 ircc/work-permit 入口）
- BOWP 消费者页（IRCC 已并入 Express Entry · become-candidate 流程页 · URL 多次迁移）
- 配偶 Open Work Permit C41 子页（2024 年起经历 C46 / C47 等政策摆动，URL 变动频繁）

需要这些时，请直接到 [`ircc/ict-r205a.html`](ircc/ict-r205a.html) 内查阅交叉引用，
或访问 IRCC 官网当期页面。

## 重抓

```
bash data/archive/ca/ict/download.sh
```

幂等。

> 注：canada.ca 在部分境内网络被 TCP 劫持至保留 IP，直连 curl 超时。本脚本对
> canada.ca 走 `web.archive.org/web/2025id_/` 模式取 2025 年快照原始内容。
