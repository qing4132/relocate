# garden-experiment-2026-04-19

2026-04-19 本项目经历了两次方向反转，原本存放于本目录的"garden 实验"产出物最终全部被捡回主线。本目录仅保留这份 README 作为历史留痕。

## 两次反转的时间线

**一、garden → 严格章程（同日）**

凌晨尝试把仓库转向"对自己和家庭开放的 garden"形态：大幅简化 README/RULES/HANDOFF，并以美国 L-1B 家庭路径作为第一个可扩写的真实样稿。当天即决定取消该实验，恢复 pre-garden 的严格章程。

当时给出的三条硬冲突理由：

- 与当时的 RULES § 9.1 冲突：Phase 0 的唯一目标是日本 × HSP 积分制端到端 dogfood，美国 L-1B 是第二条路径，不得展开。
- 与当时的 RULES § 2.1.1 冲突：L-1B 归档下的 48 份一手源是在 `SOURCES.md` 尚未建立、再分发条款也未逐条审过的情形下抓取的。
- 与当时的 RULES § 4.3 冲突：把视觉样稿当新增路径规则的基准，等于"先画 UI 再反推 schema"。

**二、严格章程 → 仅供参考站（同日晚些时候，commit `8c034f6`）**

复盘后认为：当目标只是一个业余维护、不盈利、不担责的参考站，原先章程是为另一种形态（要长期稳定输出、靠付费反哺复核、作为用户真实决策依据的产品）准备的——在当前形态下是过度工程，会把作者本人劝退。

于是：

- Phase 0 dogfood 放宽 → L-1B 可以作为第二条路径并行
- 五元组 / 字节级快照 / 独立 PR 登记 / 180 天强制复核 全部放宽为"尽力而为"
- 上述三条归档理由均不再成立

唯一保留的硬约束：不凭空编数字（[RULES.md](../../RULES.md) § 2.3）。

## 内容去向

| 归档期位置 | 现位置 |
| --- | --- |
| `design/path-detail-us-l1b-family.html` | [`site/paths/us-l1b-family.html`](../../site/paths/us-l1b-family.html) |
| `design/sources/us-l1b-family/` | [`data/archive/us/l1b-family/`](../../data/archive/us/l1b-family/) |

按 [RULES.md](../../RULES.md) § 5.3，archive/ 目录永不删除，留作项目试错历史。
