# garden-experiment-2026-04-19

## 这里是什么

2026 年 4 月 19 日前后 2 天内，本项目曾短暂尝试把仓库转向 "对自己和家庭开放的 garden" 形态：
大幅简化 README/RULES/HANDOFF，并以美国 L-1B 家庭路径作为第一个可扩写的真实样稿。

同日决定取消该实验，恢复 pre-garden 的严格章程（[RULES.md](../../RULES.md)）。
garden 期间产出的内容移到本目录，不删除、不改写，作为"我们试过什么、为什么放弃"的留痕。

## 为什么不走 garden 路径

- 与恢复后的 RULES § 9.1 冲突：Phase 0 的唯一目标是日本 × HSP 积分制端到端 dogfood。
  美国 L-1B 是第二条路径，按 § 9.1 "此阶段不做：多路径扩展"不得展开。
- 与 RULES § 2.1.1 冲突：L-1B 归档下的 48 份一手源是在 `SOURCES.md` 尚未建立、
  再分发条款也未逐条审过的情形下抓取的，未经"登记 PR 不得同时使用"约束。
- 与 RULES § 4.3 / HANDOFF Don't 冲突：把视觉样稿当新增路径规则的基准，
  等于"先画 UI 再反推 schema"。

## 目录

- `design/path-detail-us-l1b-family.html` — 美国 L-1B 家庭路径详情视觉样稿（含 § 0–§ 8 全部内容）
- `design/sources/us-l1b-family/` — 当时按样稿 § 8 "官方文件总表"下载到本地的 48 项原件
  （9 份 8 USC / 3 份 Public Law / 9 份 CFR / 8 份政策页 / 14 份 PDF 表格 / 3 份在线表单 .url 占位）

## 后续能否复用

- `design/path-detail-us-l1b-family.html` 的**视觉结构**（三段式骨架、节点卡、分支块、
  家庭三线图、官方文件总表布局）是 pre-garden 就在探索的方向，将来正式做路径详情
  视觉模板时可以参考其信息层级组织方式，不参考其具体数据内容。
- `design/sources/us-l1b-family/` 下的原件**不得**直接转入 `data/archive/`。真正上
  Phase 0 时若覆盖美国路径，须按 RULES § 2.1.1 / § 2.7 从头再抓一遍、走独立登记
  PR、写完整 `.meta.json`。
