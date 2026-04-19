# HANDOFF

> 放下一切前先读完本文件。最多 2 分钟。
> 本文件只记录**当前状态 + 下一步 + 提醒**。愿景见 [README](README.md)，规则见 [RULES](RULES.md)，历史见 `git log`。
> **每次会话结束前必须更新本文件**。不更新等于没写。

---

## Now · 我在哪

- 阶段：**Phase 0 · B2 已完成，B1 待开**
- 最近一次改动：2026-04-19，完成 garden 实验回退 + B0（`SOURCES.md` 骨架）+ B2（`docs/path-authoring.md` 新增路径工序规范）
- 当前决策焦点：首批日本 HSP 一手源的 authority 代码 / docId / 再分发条款逐条登记（B1）

## Next · 下一步

按顺序做（B1 起的每一步对照 `docs/path-authoring.md`）：

- [ ] **B1** — 在 `SOURCES.md` 登记首批日本 HSP 一手源：每一条源一个独立 commit，填满 `SOURCES.md § 1` 全部字段，`status: proposed`。**不抓取、不使用**（§2.1.1）
  - 候选机关（待逐条审）：`jp/isa`（出入国在留管理庁 · HSP 积分表与在留资格）、`jp/moj`（法務省 · 出入国管理及び難民認定法施行细则）、`jp/mhlw`（厚生労働省 · 年金/社保）、`jp/nta`（国税庁 · 所得税税表）、`jp/stat`（総務省統計局 · 收入中位数）、`jp/mofa`（外務省 · 在华日本国大使馆签证页面）
- [ ] **B3** — B1 完结后，按 `docs/path-authoring.md` 的工序 C-G 首次端到端录入 HSP 的**一个**字段（建议 `jp-hsp.threshold.70`）。脚手架（`data/sources/` 目录、`fetch.mjs` UA 约定、`.gitattributes` 的 LFS pattern）在这一步顺势落地
- [ ] **B4** — 围绕 B3 产出的单字段反推最小技术栈（存储 / 构建脚本 / 应用层），在 `docs/stack-decisions.md` 记录"为什么选它 / 拒绝了什么替代方案"

## Don't · 禁止

- 不要先画 UI 再反推 schema（§4.3）。`design/` 下只是视觉情感探索，数据全是占位。
- 不要再在 `archive/garden-experiment-2026-04-19/` 里编辑任何东西——那是试错留痕，原位封存（见该目录 README）。
- 不要对外公开仓库，不要找外部用户试用（§9.1）。
- 不要在未更新 `SOURCES.md` 的情况下使用任何新源（§2.1.1）。B1 登记 PR 本身也不得"顺手抓一份看看"。
- 不要把 garden 归档下的 48 份美国一手源直接复用进 `data/archive/`——Phase 0 不做美国路径；将来覆盖时按 § 2.1.1 / § 2.7 从头再抓一遍。
- 不要用估算值、LLM 生成、邻近推断填补任何字段（§2.1.2 / §2.2.2）。
- 不要绕过 `data/build.mjs` 写产品数据（§2.3.2，将来施工期生效）。
- 不要为"界面好看"妥协任何字段的真实性（§9.6 · F6）。
- 不要在不读 RULES 的情况下动数据/规则/文案相关的任何东西。

## Before switching machine · 切换机器前

- [ ] `git status` 干净？
- [ ] 当前分支已 `git push origin main`？
- [ ] 改过 RULES / README / HANDOFF？本文件的 `Now · 最近一次改动` 行是否更新？
- [ ] `Next` 区写明了**下次坐下来能直接开始**的具体动作？

## On arrival · 回到机器后

1. `git pull`
2. 从头读完本文件
3. 依次速览 RULES 目录：§0 / §2 / §3 / §5 / §9（心智刷新）
4. 按 `Next` 列继续

---

<sub>HANDOFF ≠ PLAN。它不规划未来，只描述当下。
修改节奏：每次工作结束前 2 分钟，更新 `Now · 最近一次改动` 与 `Next`。</sub>
