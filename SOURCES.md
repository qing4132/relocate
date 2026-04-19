# SOURCES.md — 已用到的一手源清单

> 累进式清单，不是硬前置。引用过哪些源，顺手在这里记一笔，方便以后自己或别人复核。
>
> pivot 后（2026-04-19），[RULES.md](RULES.md) § 2 明确是"尽力而为"——本文件不再是
> 使用前必过的审核关。每条真实使用的源登记一行，就足够。

---

## 格式建议

每条一行 YAML 块，字段能填就填，空着也行。**必要**的只有两项：`authority` 和 `sourceURL`。

```yaml
- authority: jp/isa            # 国家 ISO code 小写 + 机关短名
  authorityFullName: 出入国在留管理庁
  docId: hsp-scoring-table     # 人类起的稳定标识（可选）
  docTitle: 高度専門職ポイント計算表
  sourceURL: https://www.moj.go.jp/isa/...（真实链接）
  language: ja
  notes: |
    第一次使用：2026-XX-XX，用于 design/path-detail-jp-hsp.html 的积分维度表
```

## § 0 · 二手源的态度

pivot 后允许以"二手"身份引用律所 / 博客 / 论坛的整理，但在页面上必须显式标"二手"。
二手源**不需要登记**本文件；只有**官方一手源**才登记。

## § 1 · 已登记的源

> 当前为空。

<!-- 首条登记示例（删除本 HTML 注释并替换真实数据后添加）：
- authority: jp/isa
  authorityFullName: 出入国在留管理庁
  docId: hsp-scoring-table
  sourceURL: https://www.moj.go.jp/isa/applications/procedures/nyuukokukanri07_00114.html
  language: ja
  notes: 供 design/path-detail-jp-hsp.html § 3.1 使用
-->

## § 2 · 相关但尚未登记

`archive/garden-experiment-2026-04-19/design/sources/us-l1b-family/` 下有 48 份美国移民
相关的政府原件（8 USC / CFR / USCIS 表格 / 政策页等），是 pivot 前那一轮抓的。**尚未
整理进本文件**——因为 L-1B 路径样稿当前还在 archive 里，没有真正作为在线内容使用。

将来把 L-1B 从 archive 挪回主线时，顺手把那批源批量登记到本文件 § 1（一次 commit 登
掉，不需要一条一个 PR）。
