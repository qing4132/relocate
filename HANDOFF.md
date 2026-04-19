# HANDOFF

> 接手说明。愿景见 [README](README.md)，原则见 [RULES](RULES.md)，新增 / 重写路径规范见 [docs/path-authoring.md](docs/path-authoring.md)，技术栈见 [docs/engineering.md](docs/engineering.md)。
> 每次工作结束前顺手更新本文件的 Now / Next。

---

## Now · 在哪

- **2026-04-19 · 项目定位 pivot**（commit `8c034f6`）：从"严格数据工程化 + 付费 + dogfood"改为"非盈利 · 仅供参考 · 尽力而为 · 不担责"。详见 [RULES.md](RULES.md) § 6。
- **2026-04-19 · 静态站工程架子搭起 + L-1B 内容归主线**（commit `1cfa93d`）
- **2026-04-19 · 路径写作规则升级**（本次 commit）：每条路径必须覆盖
  - 维度 A · 工签 → 永居 → 入籍
  - 维度 B · 家庭为默认单位（不再分 `-family` 文件；配偶 / 子女派生块 + 家庭双保险段）
  - 维度 C · 备选切换 + 占位链接
- 技术栈：**纯静态 HTML / CSS，无框架、无构建**（[docs/engineering.md](docs/engineering.md)）
- 可部署目录：[site/](site/)
- 已有路径页：
  - [`site/paths/jp-hsp.html`](site/paths/jp-hsp.html) — 日本 · 高度専門職 1 号ロ · 工签 → 永住 → 帰化（含家庭双保险 + 备选切换，完全重写自旧 "字段压测样稿"）
  - [`site/paths/us-l1b.html`](site/paths/us-l1b.html) — 美国 · L-1B（原 `us-l1b-family.html` 重命名；新增 § 7 家庭双保险 + § 8 备选切换）

## Next · 下一步

- [ ] **过 JP HSP 页正文**：重写后还是会有表述可优化处，发布前再读一遍
- [ ] **下载 JP HSP 的官方原件到 `data/archive/jp/hsp/`**（积分告示、永住ガイドライン、入管法 § 22-2、国籍法、法務省 帰化页；参照 L-1B 的 download.sh 写一份 jp 版本）
- [ ] **消化"待补路径"清单**（见下文）：按能力逐条建立，每建一条全站搜 `class="pending"` 替换
- [ ] **选定最终站点名**（或继续用 `relocate` 到真正公开那天）
- [ ] **决定部署目标**：GitHub Pages (source=`/site`) / Netlify / Cloudflare Pages，选定后写入 [docs/engineering.md](docs/engineering.md)
- [ ] **License 落定** — 内容 CC BY-SA 4.0 + 代码 MIT（倾向），写回 [README.md](README.md)
- [ ] **favicon / OG 图**（上线前）

### 待补路径清单

当前 `site/paths/jp-hsp.html` 与 `site/paths/us-l1b.html` 的 § 备选切换小节共有如下 `class="pending"` 占位。建立目标页后须全站搜索并替换为真实链接：

| 建议 slug | 目标文件 | 出现于 |
| --- | --- | --- |
| `us-h1b` | `site/paths/us-h1b.html` | jp-hsp.html § 5, us-l1b.html § 7, § 8 |
| `us-l1a` | `site/paths/us-l1a.html` | us-l1b.html § 8 |
| `us-o1a` | `site/paths/us-o1a.html` | us-l1b.html § 8 |
| `us-eb1a` | `site/paths/us-eb1a.html` | us-l1b.html § 8 |
| `jp-hsp-1a` | `site/paths/jp-hsp-1a.html` | jp-hsp.html § 5（研究系） |
| `jp-hsp-2` | `site/paths/jp-hsp-2.html` | jp-hsp.html § 5 |
| `jp-gijinkoku` | `site/paths/jp-gijinkoku.html` | jp-hsp.html § 5（技術・人文知識・国際業務） |
| `jp-business-mgmt` | `site/paths/jp-business-mgmt.html` | jp-hsp.html § 4, § 5（経営・管理） |
| `ca-gts` | `site/paths/ca-gts.html` | 两个路径页的跨国切换段 |
| `au-gtv` | `site/paths/au-gtv.html` | us-l1b.html § 8 |
| `uk-global-talent` | `site/paths/uk-global-talent.html` | 两个路径页 |
| `sg-one-pass` | `site/paths/sg-one-pass.html` | 两个路径页 |

优先级建议：`us-h1b` 最值得先做（两条现有路径都链到它且与 L-1B / HSP 双保险玩法强相关）。

已完成、从本清单拿掉的：

- ~~把 L-1B 路径样稿与美国一手源从 archive/ 挪回主线~~（2026-04-19）
- ~~把现有 HTML 样稿落成可发布的静态站~~（2026-04-19）
- ~~首页草稿~~（2026-04-19）
- ~~重写 JP HSP 为完整工签→永住→帰化 + 家庭 + 备选切换~~（2026-04-19）
- ~~为 L-1B 补家庭双保险 + 备选切换~~（2026-04-19）
- ~~把 `us-l1b-family.html` 重命名为 `us-l1b.html`~~（2026-04-19）

## Don't · 别做

- 别再新建 `-family` 后缀的分身页——家庭为默认单位（[docs/path-authoring.md](docs/path-authoring.md) 维度 B）
- 别做"只到工签 / 只到永居"的半截路径页。[docs/path-authoring.md](docs/path-authoring.md) 维度 A 要求推到入籍或显式说明为何跳过
- 别在 § 备选切换段列名称却不给 `class="pending"` 占位 —— 跟进会丢
- 别重新引入 pivot 前的硬约束（五元组必填、独立 PR 登记、180 天强制复核）
- 别加付费、不管多"轻"的付费都别加（RULES § 1.1 / § 3.1）
- 别做"AI 移民顾问"聊天框（RULES § 3.1）
- 别引入前端框架（Astro / Next / Vite）。见 [docs/engineering.md](docs/engineering.md)
- 别悄悄推广 — 自用 + 顺手公开，不做增长（RULES § 3.2）
- 别删 `archive/`（RULES § 5.3）
- 别在任何页面省略"仅供参考 · 非官方"字样（RULES § 1.4）

## Before switching machine

- [ ] `git status` 干净？
- [ ] 已 `git push`？
- [ ] 本文件的 Now / Next 更新到"下次坐下来能直接开始的具体动作"？

## On arrival

1. `git pull`
2. 读本文件（2 分钟）
3. 扫一眼 [RULES.md](RULES.md)（3 分钟）
4. 要新增路径 → [docs/path-authoring.md](docs/path-authoring.md)
5. 要动工程层 → [docs/engineering.md](docs/engineering.md)

---

<sub>HANDOFF ≠ PLAN。它描述当下，不规划未来。</sub>
# HANDOFF

> 接手说明。愿景见 [README](README.md)，原则见 [RULES](RULES.md)。
> 每次工作结束前顺手更新本文件的 Now / Next。

---

## Now · 在哪

- 2026-04-19 完成方向 pivot（commit `8c034f6`）：从"严格数据工程化 + 付费 + dogfood 验收"改为"非盈利 · 仅供参考 · 尽力而为 · 不担责"。详情见 [RULES.md](RULES.md) § 6。
- 2026-04-19 紧接着搭起工程架子 + 把 L-1B 内容挪回主线：
  - 技术栈：**纯静态 HTML / CSS，无框架，无构建**。详见 [docs/engineering.md](docs/engineering.md)
  - 可部署目录：`site/`
  - 两条路径详情页已在线：
    - [`site/paths/jp-hsp.html`](site/paths/jp-hsp.html) — 日本 · 高度専門職 1 号ロ · 技术系
    - [`site/paths/us-l1b-family.html`](site/paths/us-l1b-family.html) — 美国 · L-1B 家庭路径（L-1B → 永居 → 入籍）
  - 首页：[`site/index.html`](site/index.html)
  - 48 份美国官方原件：[`data/archive/us/l1b-family/`](data/archive/us/l1b-family/)，已在 [SOURCES.md § 1](SOURCES.md) 批量登记
- 文档层：RULES / README / SOURCES / HANDOFF / docs/path-authoring / docs/engineering 均与新基调对齐

## Next · 下一步

按顺序，但每一步做不做由现实情况决定——**这不是硬 TODO**：

- [ ] **过一遍 JP HSP 路径页的正文**。caveat 已改，但正文里仍有若干写于"草稿 / 对照 sitemap 字段摆位"语境下的措辞（"字段", "摆进来", "未决"等），可以趁早改成面向读者的表述
- [ ] **给 JP HSP 页底部补一张官方文件总表**（对照 L-1B 页 § 8），把引用过的日本 `moj.go.jp` / `nyukan` / `mhlw` 页面列成表，并顺手下到 `data/archive/jp/hsp/`
- [ ] **选定最终站点名**（或就用 `relocate` 到上线那天）
- [ ] **决定部署目标**：GitHub Pages (source=`/site`) / Netlify / Cloudflare Pages，写入 [docs/engineering.md](docs/engineering.md)
- [ ] **License 落定** — 内容 CC BY-SA 4.0 + 代码 MIT（倾向），写回 [README.md](README.md)
- [ ] **网站 favicon / OG 图**（上线前）

已完成、从本清单拿掉的：

- ~~把 L-1B 路径样稿与美国一手源从 archive/ 挪回主线~~（2026-04-19）
- ~~把现有 HTML 样稿落成可发布的静态站~~（2026-04-19，选定纯静态 HTML 方案）
- ~~首页草稿~~（2026-04-19，[site/index.html](site/index.html)）

## Don't · 别做

- 别重新引入 pivot 前的硬约束（五元组必填、独立 PR 登记、180 天强制复核）。放宽后如果确实写错了，按 RULES § 5.2 改就行
- 别加付费、不管多"轻"的付费都别加（RULES § 1.1 / § 3.1）
- 别做"AI 移民顾问"聊天框（RULES § 3.1）
- 别引入前端框架（Astro / Next / Vite）。见 [docs/engineering.md](docs/engineering.md)
- 别悄悄推广 — 自用 + 顺手公开，不做增长（RULES § 3.2）
- 别删 `archive/`（RULES § 5.3）
- 别在任何页面省略"仅供参考 · 非官方"字样（RULES § 1.4）

## Before switching machine

- [ ] `git status` 干净？
- [ ] 已 `git push`？
- [ ] 本文件的 Now / Next 更新到"下次坐下来能直接开始的具体动作"？

## On arrival

1. `git pull`
2. 读本文件（2 分钟）
3. 扫一眼 [RULES.md](RULES.md)（3 分钟）
4. 要新增路径 → [docs/path-authoring.md](docs/path-authoring.md)
5. 要动工程层 → [docs/engineering.md](docs/engineering.md)

---

<sub>HANDOFF ≠ PLAN。它描述当下，不规划未来。</sub>
# HANDOFF

> 接手说明。愿景见 [README](README.md)，原则见 [RULES](RULES.md)。
> 每次工作结束前顺手更新本文件的 Now / Next。

---

## Now · 在哪

- 刚完成一次方向调整（2026-04-19）：从"严格数据工程化 + 付费 + dogfood 验收"
  改为"非盈利 · 仅供参考 · 尽力而为 · 不担责"。详细动机见 [RULES.md](RULES.md) § 6
- 仓库里已有的材料：
  - `design/path-detail-jp-hsp.html` — 日本 · 高度専門職 1 号ロ · 技术系 路径详情样稿
  - `design/coverage-survey.html` — 覆盖清单样稿
  - `design/sitemap.html` — 站点结构草图
  - `archive/garden-experiment-2026-04-19/design/path-detail-us-l1b-family.html` — 美国 L-1B 家庭路径（完整 § 0-§ 8 内容）
  - `archive/garden-experiment-2026-04-19/design/sources/us-l1b-family/` — 对应的 48 份美国政府一手源原件（约 20 MB）
- 文档层：RULES.md / README.md / SOURCES.md / docs/path-authoring.md 已在 pivot 后重写，与新基调对齐

## Next · 下一步

按顺序，但每一步做不做由现实情况决定——**这不是硬 TODO**：

- [ ] **把 L-1B 路径样稿与美国一手源从 archive/ 挪回主线**。新基调下它们不再违规，archive/ 那个实验目录可以只保留 README 的"我们试过什么"记录。挪回路径建议：
  - `design/path-detail-us-l1b-family.html`
  - `data/archive/us/.../` 按 `SOURCES.md` 现在的轻度要求重新组织
- [ ] **把现有 HTML 样稿落成可发布的静态站**。建议栈（未定）：
  - 纯手写 HTML + 少量共享 CSS（最朴素，与"业余维护"气质最近）
  - 或 Astro（组件化 + 内容集合 + 零 JS 运行时）
  - Next.js / Vite 这类都过重，不建议
- [ ] **确定最终站点名** — 或者就用 `relocate` 直到真的要公开再说
- [ ] **首页草稿** — 一句话说清"这是什么 / 不是什么 / 仅供参考"，三段结束
- [ ] **License 落定** — 内容 CC BY-SA 4.0 + 代码 MIT（倾向），写回 README

## Don't · 别做

- 别重新引入 RULES § 2.1.1 级别的硬约束（五元组必填、独立 PR 登记、180 天强制复核）。
  pivot 就是为了放下这些——放宽后如果确实写错了，按 § 5.2 改就行
- 别加付费、不管多"轻"的付费都别加（RULES § 1.1 / § 3.1）
- 别做"AI 移民顾问"聊天框（RULES § 3.1）
- 别悄悄推广 — 自用 + 顺手公开，不做增长（RULES § 3.2）
- 别删 `archive/`。试错留痕是项目历史的一部分
- 别在任何地方省略"仅供参考 · 非官方"字样（RULES § 1.4）

## Before switching machine

- [ ] `git status` 干净？
- [ ] 已 `git push`？
- [ ] 本文件的 Now / Next 更新到"下次坐下来能直接开始的具体动作"？

## On arrival

1. `git pull`
2. 读本文件
3. 扫一眼 RULES.md（很短，3 分钟能过完）
4. 按 Next 继续

---

<sub>HANDOFF ≠ PLAN。它描述当下，不规划未来。</sub>
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
