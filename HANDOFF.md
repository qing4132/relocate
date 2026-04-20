# HANDOFF

> 接手说明。愿景见 [README](README.md)，原则见 [RULES](RULES.md)，新增 / 重写路径规范见 [docs/path-authoring.md](docs/path-authoring.md)，技术栈见 [docs/engineering.md](docs/engineering.md)。
> 每次工作结束前顺手更新本文件的 Now / Next。

---

## Now · 在哪

- **2026-04-19 · 项目定位 pivot**（commit `8c034f6`）：从"严格数据工程化 + 付费 + dogfood"改为"非盈利 · 仅供参考 · 尽力而为 · 不担责"。详见 [RULES.md](RULES.md) § 6。
- **2026-04-19 · 静态站工程架子搭起 + L-1B 内容归主线**（commit `1cfa93d`）
- **2026-04-19 · 路径写作规则升级**（commit `440d713`）：每条路径必须覆盖
  - 维度 A · 工签 → 永居 → 入籍
  - 维度 B · 家庭为默认单位（不再分 `-family` 文件；配偶 / 子女派生块 + 家庭双保险段）
  - 维度 C · 备选切换 + 占位链接
- **2026-04-19 · 清零"待上线未完成"文案**（commit `771e79d`）：替换全部 pending 占位链接、修正 AU GTV→NIV 更名、下线 JP HSP 旧版稿
- **2026-04-19 · JP HSP 官方原件全量归档 + 两页来源表补本地归档列**（commit `10c73f9`）：
  - `data/archive/jp/hsp/` 已落 14 份官方文件（ISA 8 · e-Gov 2 XML · MOJ 1 · MHLW 1 · PRC 1）+ README + download.sh
  - `site/paths/jp-hsp.html` § 7 表、`site/paths/us-l1b.html` § 10 四张子表均新增「本地归档」列，所有官方引用在本地可定位
- **2026-04-19 · 新增 US H-1B 路径 + 官方原件归档**（commit `3218438`）：
  - [`site/paths/us-h1b.html`](site/paths/us-h1b.html) — 含抽签注册 · LCA/I-129 · 维持（AC21 突破 6 年）· PERM/I-140/排期 · I-485/领事 · N-400 · 家庭三线图 · 备选切换 · § 10 四张子表全带本地归档列
  - `data/archive/us/h1b/`（USCIS 5 · DOL 2 · regulations 2 · statutes 2 · forms 5 PDFs + 3 online-only stubs）+ README + download.sh；AC21 / CSPA / CCA / 归化条款 / PERM 表格 / I-485 / N-400 等共用件复用 `data/archive/us/l1b/`
  - `site/index.html` 路径列表新增 H-1B 条目；`site/paths/jp-hsp.html` § 5 与 `site/paths/us-l1b.html` § 8 的 H-1B 条目从 USCIS 外链改为本站内链
- **2026-04-19 · 新增美国国家前置知识总览页**（commit `c7bead9`）：
  - [`site/paths/us-overview.html`](site/paths/us-overview.html) — 面向任一条具体 US path 读者的共性前置：机构分工（USCIS/CBP/ICE/DOS/DOL/IRS/SSA）· 签证 vs 身份 vs I-94 · NIV/IV · 双重意图 · NIV 字母表速查 · EB 五类与 7% 国别配额 · 优先日 / Visa Bulletin 两表 / Cross-Chargeability / AC21 三条 · AOS vs CP + CSPA · 维持身份 / 60 天 grace / 3-10 年禁令 / Advance Parole · LPR 维持（物理存在 · Reentry · N-470 · 全球纳税）· 入籍 5-3-18 · 中国国籍法 §9 · 表格速查 · 政策节奏。
  - 所有官方引用复用 `data/archive/us/l1b/` 的 statutes / regulations / policy（未新增归档文件）
  - `site/index.html` 路径列表把 us-overview 置于顶部，status 写「前置知识」
- **2026-04-20 · 新增 US O-1 杰出人才路径 + 官方原件归档**（commit `d189376`）：
  - [`site/paths/us-o1.html`](site/paths/us-o1.html) — O-1A / O-1B 三档 · 8 条证据标准 · 2022 STEM 备忘 · 咨询函 · Agent 模式 · 3 + 1 + 1 无上限续签 · O-3 不可工作的家庭困境 · EB-1A 自荐为主线 · EB-2 NIW / EB-1B 备选 · 家庭双保险三种配置 · 备选切换（同类 / 跨签证 / 跨国）· § 10 四张子表带本地归档列
  - `data/archive/us/o1/`（USCIS 5 · regulations 1 · statutes 2 · forms 3 PDF + 2 online-only stub）+ README + download.sh；I-485 / I-765 / I-131 / I-539 / I-693 / N-400 / N-470 / N-600 / AC21 / CSPA / CCA / 8 CFR 245 / INA §203 / §245 / §316 / §319 / §320 等共用件沿用 `data/archive/us/l1b/`
  - 跨链接：`site/paths/us-h1b.html` § 7 的 H-1B → O-1A 条目从 USCIS 外链改为 `us-o1.html`；`site/paths/us-l1b.html` § 8 的 L-1B → O-1A 条目同改；`site/paths/us-overview.html` § 2 "NIV 字母表" 中 O-1 条目加本站链接，§ 11 "本站美国 path 索引" 增 O-1 条目，§ 11 页末的"待补路径清单"中移除 O-1A
  - `site/index.html` 路径列表新增 O-1 条目
- **2026-04-20 · 新增 US L-1A 跨国公司管理者 / 高管路径 + 官方原件归档**（commit `acb18b0`）：
  - [`site/paths/us-l1a.html`](site/paths/us-l1a.html) — 管理 / 高管岗位定义（INA §101(a)(44) + USCIS Vol 2 Part L · 含 function manager）· 7 年累计上限 · 常规 3+2+2 与 "新办公室" 1+2+2+2 两套节奏 · 主线 EB-1C 绿卡（免 PERM · 与 L-1A 事实要件一比一同构 · 美国雇主须运营满 1 年）· EB-1A / NIW 备份 · 家庭双保险三种配置 · 备选切换（L-1A↔H-1B / O-1A / EB-1A、Canada ICT / GTS、JP HSP 1 号イ / ロ、UK Senior Specialist、SG ONE Pass）· § 10 四张子表带本地归档列
  - `data/archive/us/l1a/`（USCIS 4 份 L-1A / EB-1 总览 / Policy Manual Vol 2 Part L / Vol 6 Part F Ch 5）+ README + download.sh；上游法条 + 下游流程的全部共用件（INA §101/§214/§203/§245/§316/§319/§320 · 8 CFR 214.2 / 204.5 / 245 · AC21 / CSPA / CCA · I-129 / I-140 / I-485 / N-400 / N-600 等）沿用 `data/archive/us/l1b/`
  - 按"共用则引用不复制"原则：页面 § 4（绿卡收尾 I-485 vs DS-260）与 § 5（LPR 维持 / N-400 / CCA 子女自动入籍）直接引 `us-l1b.html` 对应段，不重复照搬
  - 跨链接：`site/paths/us-l1b.html` § 8 的 L-1B → L-1A 条目从 USCIS 外链改为本站 `us-l1a.html`；`site/paths/us-o1.html` § 8 的 O-1 → L-1A / L-1B 同时链到 L-1A 与 L-1B；`site/paths/us-h1b.html` § 8 的 H-1B → L-1B / L-1A 同时链两页；`site/paths/us-overview.html` § 2 NIV 字母表中 L-1A / L-1B 条目、§ 11 "本站美国 path 索引" 新增 L-1A 条目，§ 11 页末的"待补路径清单"中移除 L-1A
  - `site/index.html` 路径列表新增 L-1A 条目，置于 L-1B 之后 H-1B 之前
- **2026-04-20 · 新增 US EB-1A 杰出人才自荐绿卡页 + 官方原件归档**（commit `84924b9`）：
  - [`site/paths/us-eb1a.html`](site/paths/us-eb1a.html) — 绿卡分类页（而非签证路径）· INA §203(b)(1)(A) · 8 CFR 204.5(h) · 一次性大奖 与 10 条证据标准 逐条释义 · <em>Kazarian v. USCIS</em> 两段论（Counting + Final Merits Determination）· 五类行业打包模板（科研 / 工程 / 创业 / 艺术 / 体育）· I-140 + I-907 加急 · 优先日 · Visa Bulletin · AOS concurrent filing · CP · E-14 / E-15 派生 · CSPA · § 7 从 H-1B / L-1 / O-1 / F-1 / 境外切入 · § 8 降档到 NIW / EB-1B / PERM / EB-5 · § 9 十条高频 RFE 触发点
  - `data/archive/us/eb1a/`（USCIS 2 份：EB-1 overview 与 Policy Manual Vol 6 Part F Ch 2 · EB-1A Extraordinary Ability 含 Kazarian 两段论与 10 条标准逐条释义）+ README + download.sh；全部共用件（INA §203/§245/§316/§319/§320/§202 · 8 CFR 204.5/245 · 22 CFR 42.12 · AC21 / CSPA / CCA · I-140 / I-907 / I-485 / I-765 / I-131 / I-693 / DS-260 / N-400 / N-600 等）沿用 `data/archive/us/l1b/`
  - 按"共用则引用不复制"原则：页面 § 6.3 绿卡收尾 / LPR 维持 / N-400 全部引 `us-l1b.html § 4–5` 与 `us-overview.html § 4 / § 6 / § 7`，不重复照搬
  - 跨链接：`site/index.html` 路径列表新增 EB-1A 条目（紧随 O-1）；`site/paths/us-overview.html` § 2 NIV 字母表 EB-1A 行加 "详见本站 EB-1A 路径" 链接，§ 11 "本站美国 path 索引" 新增 EB-1A 条目，§ 11 页末的"待补路径清单"中移除 EB-1A；`site/paths/us-l1a.html` § 8 的 `us-eb1a` pending 占位改为本站实链（保留官方 archive fallback 链接）；`site/paths/us-l1b.html` § 8 的 EB-1A / EB-1B 条目 EB-1A 字样加本站内链；`site/paths/us-h1b.html` § 7 EB-2 → EB-1A / NIW 条目 EB-1A 字样加本站内链；`site/paths/us-o1.html` § 5 开头补 "详见本站 EB-1A 路径"
- **2026-04-20 · 新增 SG ONE Pass 高薪 / 杰出人才路径 + 官方原件归档**（commit `fff5fae`，第一条非美国 / 非日本 path）：
  - [`site/paths/sg-one-pass.html`](site/paths/sg-one-pass.html) — ONE Pass（Overseas Networks & Expertise Pass）两档门槛（月薪 SGD 30k 档 vs outstanding achievements 成就档）· 5 年长签 · 多雇主 + 自办公司 + 董事权 · Dependant's Pass + 配偶 LOC 工作权 · 续签三条口径（累计 SGD 1.5M 或持续高薪或持续成就）· IRAS 183 天 tax residency · PR（ICA PTS Scheme · 裁量审批 · REP 维持）· Citizenship（Constitution Art 122–141 · PR ≥ 2 年 · 单一国籍制度 Art 134 · 与中国《国籍法》§9 的双向触发）· CPF 义务 · 子女 NS 兵役 · 三种家庭配置 · § 8 备选切换（EP / Tech.Pass / PEP / 美 EB-1A / 美 O-1A / JP HSP / UK Global Talent / CA GTS / UAE Golden Visa）· § 10 官方文件四张子表全带本地归档列
  - `data/archive/sg/one-pass/`（MOM 4：ONE Pass overview / eligibility / EP / Dependant's Pass · ICA 2：PR / Citizenship · IRAS 1：tax residency · AGC 3：EFMA Cap 91A / Immigration Act Cap 133 / Constitution Part X Art 122–141）+ README + download.sh；Tech.Pass 因 EDB 反爬 + MOM 原页 404 不强制归档，页面内仅作相邻对比
  - 跨链接：`site/index.html` 路径列表新增 SG ONE Pass 条目（首条 SG 路径，紧随 US EB-1A）；`site/paths/us-l1a.html` § 8 · `site/paths/us-h1b.html` § 7 · `site/paths/us-l1b.html` § 8 · `site/paths/us-o1.html` § 8 · `site/paths/us-eb1a.html` § 8 · `site/paths/jp-hsp.html` § 5 共 6 页的"Singapore · ONE Pass" 条目全部从 MOM 外链或 pending 占位改为本站内链（保留 MOM fallback 链接）
- **2026-04-20 · 新增 CA Global Talent Stream（GTS）路径 + 官方原件归档**：
  - [`site/paths/ca-gts.html`](site/paths/ca-gts.html) — GTS 2 周服务标准 · Category A（referral partner 推荐独特岗位）vs Category B（14 个 NOC 代码清单）· LMBP 强制承诺 · Cat B 工资下限 = 省岗位中位数 2x · 配偶自动 OWP · 子女 K-12 免 SP · BOWP 过渡工签 · Express Entry（CEC 最适 GTS、FSW 备选）· CRS 六大因子 + Additional Points（PNP +600 / 法语 +50 / Arranged Employment +50/200）· PR 维持 5/730 天 · 入籍 3/5 物理存在 · 允许双重国籍但与中国《国籍法》§9 冲突 · § 8 跨国备选（FSW / PNP / SUV / ICT / US H-1B/L-1/O-1/EB-1A / JP HSP / SG ONE Pass / UK GT）
  - `data/archive/ca/gts/`（ESDC 3：GTS overview + requirements + applicant guide/occupations · IRCC 7：work permit + express entry + CEC + FSW + CRS grid + citizenship become + eligibility · Justice Laws 3：IRPA + IRPR + Citizenship Act）共 13 份官方原件 + README + download.sh。由于 canada.ca 在境内网络对直连 curl 会 TCP 劫持至保留 IP（Akamai GeoFilter），download.sh 对 canada.ca 走 `web.archive.org/web/2025id_/` 模式取 2025 年原始快照；justice.gc.ca 直连
  - 跨链接：`site/index.html` 路径列表新增 CA GTS 条目（首条 CA 路径，紧随 SG ONE Pass）；`site/paths/us-l1a.html` § 8 · `site/paths/us-h1b.html` § 7 · `site/paths/us-l1b.html` § 8 · `site/paths/us-o1.html` § 8 · `site/paths/us-eb1a.html` § 8（原 `ca-express-entry-fsw` pending 替换）· `site/paths/jp-hsp.html` § 5 共 6 页的 "Canada · GTS" 条目全部从 ESDC 外链或 pending 占位改为本站内链（保留 ESDC fallback 链接）
- 技术栈：**纯静态 HTML / CSS，无框架、无构建**（[docs/engineering.md](docs/engineering.md)）
- 可部署目录：[site/](site/)
- 已有路径页：
  - [`site/paths/us-overview.html`](site/paths/us-overview.html) — 美国 · 移民体系通用前置知识（primer，非 path）
  - [`site/paths/jp-hsp.html`](site/paths/jp-hsp.html) — 日本 · 高度専門職 1 号ロ · 工签 → 永住 → 帰化
  - [`site/paths/us-l1b.html`](site/paths/us-l1b.html) — 美国 · L-1B · 工签 → 永居 → 入籍
  - [`site/paths/us-l1a.html`](site/paths/us-l1a.html) — 美国 · L-1A · 工签 → EB-1C → 永居 → 入籍
  - [`site/paths/us-h1b.html`](site/paths/us-h1b.html) — 美国 · H-1B · 抽签 → 工签 → 永居 → 入籍
  - [`site/paths/us-o1.html`](site/paths/us-o1.html) — 美国 · O-1 · 杰出人才 → EB-1A → 永居 → 入籍
  - [`site/paths/us-eb1a.html`](site/paths/us-eb1a.html) — 美国 · EB-1A · 杰出人才自荐绿卡（不是签证 · 绿卡分类页）
  - [`site/paths/sg-one-pass.html`](site/paths/sg-one-pass.html) — 新加坡 · ONE Pass · 工签 → PR → Citizenship
  - [`site/paths/ca-gts.html`](site/paths/ca-gts.html) — 加拿大 · Global Talent Stream · 2 周工签 → Express Entry PR → 入籍

## Next · 下一步

- [ ] **消化"待补路径"清单**（见下文）：按能力逐条建立，每建一条全站搜 `class="pending"` 替换
- [ ] **选定最终站点名**（或继续用 `relocate` 到真正公开那天）
- [ ] **决定部署目标**：GitHub Pages (source=`/site`) / Netlify / Cloudflare Pages，选定后写入 [docs/engineering.md](docs/engineering.md)
- [ ] **License 落定** — 内容 CC BY-SA 4.0 + 代码 MIT（倾向），写回 [README.md](README.md)
- [ ] **favicon / OG 图**（上线前）

### 待补路径清单

当前 `site/paths/jp-hsp.html` 与 `site/paths/us-l1b.html` 的 § 备选切换小节共有如下 `class="pending"` 占位。建立目标页后须全站搜索并替换为真实链接：

| 建议 slug | 目标文件 | 出现于 |
| --- | --- | --- |
| `jp-hsp-1a` | `site/paths/jp-hsp-1a.html` | jp-hsp.html § 5（研究系） |
| `jp-hsp-2` | `site/paths/jp-hsp-2.html` | jp-hsp.html § 5 |
| `jp-gijinkoku` | `site/paths/jp-gijinkoku.html` | jp-hsp.html § 5（技術・人文知識・国際業務） |
| `ca-gts` | `site/paths/ca-gts.html` | 两个路径页的跨国切换段 |
| `au-gtv` | `site/paths/au-gtv.html` | us-l1b.html § 8 |
| `uk-global-talent` | `site/paths/uk-global-talent.html` | 两个路径页 |

优先级建议：`us-niw`（EB-2 国家利益豁免）与 EB-1A 证据高度重合，是 EB-1A 最常见并行备选；`us-eb1b`（杰出教研）与 EB-1A 同享 EB-1 排期池——两条都是 L-1A / O-1 / H-1B / EB-1A 路径页 § 8 的下一个待补占位。

已完成、从本清单拿掉的：

- ~~把 L-1B 路径样稿与美国一手源从 archive/ 挪回主线~~（2026-04-19）
- ~~把现有 HTML 样稿落成可发布的静态站~~（2026-04-19）
- ~~首页草稿~~（2026-04-19）
- ~~重写 JP HSP 为完整工签→永住→帰化 + 家庭 + 备选切换~~（2026-04-19）
- ~~为 L-1B 补家庭双保险 + 备选切换~~（2026-04-19）
- ~~把 `us-l1b-family.html` 重命名为 `us-l1b.html`~~（2026-04-19）
- ~~过 JP HSP 页正文 + 修正 ISA 失效 URL~~（2026-04-19，本次）
- ~~下载 JP HSP 官方原件到 `data/archive/jp/hsp/` 并在页面 § 7 表补「本地归档」列~~（2026-04-19，本次）
- ~~US L-1B 页 § 10 四张子表补「本地归档」列~~（2026-04-19）
- ~~新增 US O-1 杰出人才路径 + 官方原件归档 + 跨页链接替换~~（2026-04-20）
- ~~新增 US H-1B 路径 + 归档 + 首页更新 + 交叉链接~~（2026-04-19，本次）
- ~~新增 US L-1A 路径 + 归档 + 四页交叉链接 + 共用段引用 L-1B 页~~（2026-04-20，本次）
- ~~新增 US EB-1A 杰出人才自荐绿卡页 + Policy Manual Vol 6 Part F Ch 2 归档 + 六页交叉链接~~（2026-04-20，本次）
- ~~新增 SG ONE Pass 路径 + MOM / ICA / IRAS / AGC 共 10 份官方原件归档 + 六页交叉链接~~（2026-04-20，本次）

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
    - [`site/paths/us-l1b.html`](site/paths/us-l1b.html) — 美国 · L-1B 家庭路径（L-1B → 永居 → 入籍）
  - 首页：[`site/index.html`](site/index.html)
  - 48 份美国官方原件：[`data/archive/us/l1b/`](data/archive/us/l1b/)，已在 [SOURCES.md § 1](SOURCES.md) 批量登记
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
