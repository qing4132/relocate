# HANDOFF

> 接手说明。愿景见 [README](README.md)，原则见 [RULES](RULES.md)，新增 / 重写路径规范见 [docs/path-authoring.md](docs/path-authoring.md)，技术栈见 [docs/engineering.md](docs/engineering.md)。
> 每次工作结束前顺手更新本文件的 Now / Next。

---

## Now · 在哪

- **2026-05-19 · 新增 CA ICT（跨国公司内部调动）路径 + IRCC IMP 原件归档**（commit 待写）：
  - [`site/paths/ca-ict.html`](site/paths/ca-ict.html) — LMIA-exempt · IRPR §205(a) · C12 通用档（中国大陆护照唯一适用，C61 / C62 / C63 仅限特定协定国公民）· 三档落档（Executive 7 年 · Senior Manager 7 年 含 function manager · Specialized Knowledge 5 年 + 2014 后双要素 advanced + proprietary）· qualifying relationship（parent / subsidiary / branch / affiliate）· "过去 3 年内连续 1 年" 硬卡 · "新办公室" 1 年首签变体 · BOWP 解除累计期上限 · § 5 家庭玩法重点写中国大陆双职业家庭 "主申 ICT + 配偶 OWP 双线攒 CEC" · § 7 风险重点讲 SK 档 2024 后审查趋严 + 中加无双边社保协定 + T1135 外资产报表
  - 按"共用则引用不复制"原则：ca-ict § 0.1 身份层级 / § 2.2 BOWP / § 2.4 税务 / § 3 Express Entry CEC + CRS / § 4 入籍 3·5 全部 `.reuse` 引 ca-gts 对应段，不重复
  - [`data/archive/ca/ict/`](data/archive/ca/ict/)（IRCC IMP · R205(a) Intra-company transferees 单页：IRCC 已把原 SK / Exec / Qualifying relationship 多个子页合并到这一页 · 是 ICT 最权威的单一来源）+ README + download.sh；其余 IRPA / IRPR / Citizenship Act / Express Entry / CEC / CRS / Work Permit / Citizenship 系列共 9 份沿用 `data/archive/ca/gts/`。canada.ca 仍走 web.archive.org `id_` 模式（同 ca-gts 口径）
  - 跨链接：[`site/index.html`](site/index.html) 路径列表新增 CA ICT 条目（紧随 CA GTS）；[`site/paths/ca-gts.html`](site/paths/ca-gts.html) § 8 的 ca-ict pending 占位改为本站实链；[`sitemap.xml`](sitemap.xml) 新增 ca-ict；[SOURCES.md](SOURCES.md) § 1 新增 ca / ict 登记段
- **2026-04-21 · 新增 US EB-1B 杰出教研 + US EB-5 投资移民双绿卡分类页 + 官方原件归档**（commit 待写）：
  - [`site/paths/us-eb1b.html`](site/paths/us-eb1b.html) — 绿卡分类页 · INA §203(b)(1)(B) · 8 CFR 204.5(i) · 三大硬要件（国际承认 + ≥ 3 年教研经验 + tenure / tenure-track / permanent research 岗位 offer）· 6 条证据 ≥ 2 条 + Kazarian 两段论（引用 us-eb1a § 3 不重复）· 合格雇主三形态（大学 / 研究机构 / 企业 R&D ≥ 3 名全职研究员）· permanent position 争议点（按年续聘 / grant funded / visiting / postdoc 都不算）· AC21 跳槽 portability 受限（必须仍为教研 permanent 岗位）· § 7 从 H-1B / O-1A / J-1（212(e) 坑）/ F-1 / 境外切入 · § 8 并行 EB-1A / NIW / PERM EB-2/3 / EB-1C / EB-5 / 跨国 · § 9 EB-1B 专属高频 RFE 七条
  - [`site/paths/us-eb5.html`](site/paths/us-eb5.html) — 绿卡分类页 · INA §203(b)(5) + §216A · 8 CFR 204.6 + 216.6 · **RIA 2022（PubL 117-103 Div BB）**六大要点（投资额 $800K/$1.05M + TEA 由 DHS 统一裁定 + 20%/10%/2% set-aside 独立排期 + I-485 并递 + RC 授权至 2027 + Good-faith 保护）· 两种投资形态（直接投资 I-526 vs 区域中心 I-526E）· SoF 中国大陆专项（外管 5 万换汇 / 流水链条 / 父母赠与）· RC due diligence 九项清单 · 两步绿卡（I-526E → CLPR 2 年 → I-829 → 永久 LPR）· CLPR 期间 48 个月 I-829 pending 自动延期 · good-faith 重投 2 年窗口 · § 5 家属 E-51/E-52/E-53 + CSPA（EB-5 保护最强）· § 6 境内 H-1B/L-1/E-2/F-1 或境外切入 + 并行 EB-1A/NIW/L-1A→EB-1C/EB-1B/跨国 SUV/GIP/Innovator · § 7 资金 / 项目 / 移民 三层风险
  - `data/archive/us/eb1b/`（USCIS 2 份：EB-1 overview + Policy Manual Vol 6 Part F Ch 3）+ README + download.sh；全部 INA / 8 CFR / 表格等共用件沿用 `data/archive/us/l1b/`
  - `data/archive/us/eb5/`（USCIS 5：eb5_overview + Policy Manual Vol 6 Part G + i-526 + i-526e + i-829 · regulations 2：8 CFR 204.6 + 216.6 · statutes 1：PubL 117-103 RIA 2022 · forms 3：I-526 + I-526E + I-829）共 11 份独有官方原件 + README + download.sh；AOS / 入籍 / 共用表格沿用 `data/archive/us/l1b/`。两个 USCIS 4XX URL（eb5_classification / eb5_regional-centers）2024 年被 USCIS 合并至 eb5_overview，已从 download.sh 清理
  - 按"共用则引用不复制"原则：us-eb1b.html 的 Kazarian 两段论 / Visa Bulletin / AOS vs CP / LPR 维持 / N-400 全部 `.reuse` 引 us-eb1a / us-l1b / us-overview；us-eb5.html 的 LPR 维持 / N-400 / CCA 同样 `.reuse` 引 us-overview / us-l1b
  - 跨链接：`site/index.html` 路径列表新增 EB-1B + EB-5 两条（紧随 EB-1A）；`site/paths/us-eb1a.html` § 8 · `site/paths/us-niw.html` § 8 · `site/paths/jp-hsp-1a.html` § 5 共 3 页的 us-eb1b / us-eb5 pending 占位全部改为本站实链；`sitemap.xml` 新增 us-eb1b / us-eb5 / jp-hsp-1a 三条 URL
- **2026-04-21 · 新增 JP HSP 1 号イ 研究系路径 + 清理 HANDOFF 待补清单**（commit 待写）：
  - [`site/paths/jp-hsp-1a.html`](site/paths/jp-hsp-1a.html) — 高度専門職 1 号イ 研究 / 教育系 · 活动定义（别表第一之二 · 研究 / 研究指导 / 教育三选一）· 与"教授"在留资格对照 · 积分表 1 号ロ / ハ 共用但研究业绩加分（特许 / 科研费 / 论文）为学术系主力 · 任期制职位 + 科研费周期双重风险 · 国立大学 / 国研年金体系（公立学校共済 / 国家公務員共済）特有审查细节 · 涉密研究的国籍审查 · § 5 跨国切换突出 EB-1B（pending）作为 1 号イ 天然对位
  - 共用段引用 `jp-hsp.html`：§ 2 永住 / § 3 帰化 / § 4 家庭玩法 / § 6 共享风险 全部用 `.reuse` 卡片引用，不重复照搬（同 us-l1a / us-eb1a / us-niw 的"共用则引用不复制"模式）
  - 归档复用 `data/archive/jp/hsp/`，不另建 `jp/hsp-1a/` 目录（三类 HSP 在制度层面共用同一批文本）
  - 跨链接：`site/index.html` 路径列表新增 1 号イ 条目（紧随 1 号ロ）；`site/paths/jp-hsp.html` § 5 "HSP 1 号ロ → HSP 1 号イ" 条目由外链改为本站内链（保留 ISA 积分告示 fallback）；`site/paths/sg-one-pass.html` § 8 中 ca-gts 的遗留 pending 占位同步替换为本站实链；HANDOFF 待补清单刷新为当前实际存在的 `class="pending"` 占位列表
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
- **2026-04-20 · 新增 US EB-2 NIW 国家利益豁免路径 + 官方原件归档**（commit 待写）：
  - [`site/paths/us-niw.html`](site/paths/us-niw.html) — 绿卡分类页（而非签证路径）· INA §203(b)(2)(A)+(B)(i) · 8 CFR 204.5(k) · EB-2 两条资格路径（Advanced Degree A1 硕士 / A2 学士 + 5 年 progressive · Exceptional Ability 6 条 ≥ 3 条）· <em>Matter of Dhanasar</em> 2016 三要素（substantial merit & national importance / well positioned / on balance beneficial to waive）· 2022-01-21 STEM 强化指南与 CET 关键新兴技术 · 五类行业打包（STEM 博士 / 工业研究员 / 创业者 / 公共利益 / 硕士 + 5 年中等线）· I-140 + I-907 PP 45 天（非 15 天）· 大陆出生 EB-2 排期 4–6 年 · AC21 H-1B 三年延期桥接 · PD retention · § 6.2 CSPA 保护力 · § 7 从 H-1B / L-1 / O-1 / F-1 / 境外切入 · § 8 并行 EB-1A / EB-1B / EB-2 PERM / EB-5 / 跨国 · § 9 十条高频 RFE
  - `data/archive/us/niw/`（USCIS 4 份：EB-2 overview + Policy Manual Vol 6 Part F Ch 5 + Matter of Dhanasar PDF（取自 justice.gov/eoir 判例库） + 2022 STEM NIW Alert）+ README + download.sh；全部 INA / 8 CFR / 表格等共用件复用 `data/archive/us/l1b/`
  - 跨链接：`site/index.html` 路径列表新增 US NIW 条目（紧随 UK Global Talent，第 11 条路径）；`site/paths/us-eb1a.html` § 8 并行 NIW 条目从 pending 占位改为 `us-niw.html` 本站实链（同时把原 archive fallback 从 eb1a/uscis/eb1a_overview.html 改为指向 Dhanasar PDF + Policy Manual Vol 6 Part F Ch 5）

- **2026-04-20 · 新增 UK Global Talent Visa 路径 + 官方原件归档**（commit 待写）：
  - [`site/paths/uk-global-talent.html`](site/paths/uk-global-talent.html) — Stage 1 背书 + Stage 2 签证两段式 · 四赛道（Research & Academia / Digital Technology / Arts & Culture / Prestigious Prize 免背书）· Exceptional Talent 与 Exceptional Promise 两档 · 背书申请流程与证据构成 · Stage 2 签证（£766 + IHS £1,035/人/年 · 1–5 年自选）· Continuous Residence（2024-01-11 新规 rolling 12 months，滑动 12 月离境 ≤ 180 天）· ILR（Talent 3 年 · Promise 5 年 · 二次背书 · Life in UK Test · B1）· Naturalisation（ILR + 12 个月 + 5 年合法居留 + 5 年离境 ≤ 450 天 + 12 月离境 ≤ 90 天 + Good Character）· 允许双重国籍但与中国《国籍法》§9 冲突 · Tech Nation 2023-04 关停 · digital 赛道转 UKRI · § 5 三种家庭配置（单线 / 与 Skilled Worker / HPI 双线 / 过渡线 Student → Graduate）· § 8 备选（UK Skilled Worker / HPI / Innovator Founder / Scale-up · US EB-1A / O-1A · CA GTS · AU NIV · SG ONE Pass · JP HSP）· § 10 三张子表带本地归档列
  - `data/archive/uk/global-talent/`（GOV.UK 12 · Immigration Rules 2 · legislation.gov.uk 2）共 16 份官方原件 + README + download.sh；GOV.UK 在 Global Talent 系列下的多个 URL（stage1 / stage2 / settle / extend 等）返回同一份 HTML，以 `gt-overview.html` 为主；`gt-prize.html` 与 `ilr-global-talent.html` 404（内容合并至 Immigration Rules Appendix）
  - 跨链接：`site/index.html` 路径列表新增 UK Global Talent 条目（首条 UK 路径，紧随 AU NIV）；`site/paths/ca-gts.html` § 8 · `site/paths/au-gtv.html` § 8 · `site/paths/sg-one-pass.html` § 8 · `site/paths/us-eb1a.html` § 7 · `site/paths/jp-hsp.html` § 5 · `site/paths/us-l1b.html` § 8 · `site/paths/us-h1b.html` § 7 · `site/paths/us-o1.html` § 8 共 8 页的 UK Global Talent 条目从 pending 占位或 GOV.UK 外链改为本站内链（保留 GOV.UK fallback 链接）
- **2026-04-20 · 新增 AU National Innovation Visa（NIV · 前 GTV · Subclass 858）路径 + 官方原件归档**（commit 待写）：
  - [`site/paths/au-gtv.html`](site/paths/au-gtv.html) — NIV 一步到位永居（非"工签→PR 两段式"）· Migration Regulations 1994 Schedule 2 Part 858 · 四大门槛（国际公认卓越成就 + 领域内持续突出 + 提名人 Form 1000 + 薪资达 FWHIT）· 18–55 岁标准档 + 18 岁以下 / 55 岁以上的 exceptional benefit 加档 · EOI → Invitation（无 SLA）→ 60 天窗口递 858 → 体检 + 无犯罪 → Grant · 家属（配偶 + 未成年子女同批 PR，父母不派生）· Travel Facility 5 年 + RRV 续 · Australian Citizenship Act 2007 §21 / §22 入籍四条（4 年居留 + 12 月 PR + 总离境 ≤ 12 月 + 最后 12 月离境 ≤ 90 天）· 允许双重国籍但与中国《国籍法》§9 冲突 · GTV → NIV 更名（2024-12）下变与不变 · § 8 备选（AU 189/190/491/482/124/188 · US EB-1A / O-1 / CA GTS / UK GT / SG ONE Pass / JP HSP）· § 10 三张子表带本地归档列
  - `data/archive/au/gtv/`（Home Affairs 3 份：NIV overview + Citizenship become + Citizenship as PR · legislation.gov.au 3 份：Migration Act 1958 + Migration Regulations 1994 + Australian Citizenship Act 2007）共 6 份官方原件 + README + download.sh；Home Affairs 在 2024-12 NIV 更名时把 eligibility / steps / about / nominator 子页合并到单页，FWHIT 年度数字因 fairwork.gov.au 对当前网络超时而仅作外链指向 fwc.gov.au
  - 跨链接：`site/index.html` 路径列表新增 AU NIV 条目（首条 AU 路径，紧随 CA GTS）；`site/paths/us-l1b.html` § 8 · `site/paths/us-h1b.html` § 7 · `site/paths/us-o1.html` § 8 的 Australia · NIV 条目从 Home Affairs 外链或 pending 占位改为本站内链（保留 Home Affairs fallback 链接）
- **2026-04-20 · 新增 CA Global Talent Stream（GTS）路径 + 官方原件归档**：
  - [`site/paths/ca-gts.html`](site/paths/ca-gts.html) — GTS 2 周服务标准 · Category A（referral partner 推荐独特岗位）vs Category B（14 个 NOC 代码清单）· LMBP 强制承诺 · Cat B 工资下限 = 省岗位中位数 2x · 配偶自动 OWP · 子女 K-12 免 SP · BOWP 过渡工签 · Express Entry（CEC 最适 GTS、FSW 备选）· CRS 六大因子 + Additional Points（PNP +600 / 法语 +50 / Arranged Employment +50/200）· PR 维持 5/730 天 · 入籍 3/5 物理存在 · 允许双重国籍但与中国《国籍法》§9 冲突 · § 8 跨国备选（FSW / PNP / SUV / ICT / US H-1B/L-1/O-1/EB-1A / JP HSP / SG ONE Pass / UK GT）
  - `data/archive/ca/gts/`（ESDC 3：GTS overview + requirements + applicant guide/occupations · IRCC 7：work permit + express entry + CEC + FSW + CRS grid + citizenship become + eligibility · Justice Laws 3：IRPA + IRPR + Citizenship Act）共 13 份官方原件 + README + download.sh。由于 canada.ca 在境内网络对直连 curl 会 TCP 劫持至保留 IP（Akamai GeoFilter），download.sh 对 canada.ca 走 `web.archive.org/web/2025id_/` 模式取 2025 年原始快照；justice.gc.ca 直连
  - 跨链接：`site/index.html` 路径列表新增 CA GTS 条目（首条 CA 路径，紧随 SG ONE Pass）；`site/paths/us-l1a.html` § 8 · `site/paths/us-h1b.html` § 7 · `site/paths/us-l1b.html` § 8 · `site/paths/us-o1.html` § 8 · `site/paths/us-eb1a.html` § 8（原 `ca-express-entry-fsw` pending 替换）· `site/paths/jp-hsp.html` § 5 共 6 页的 "Canada · GTS" 条目全部从 ESDC 外链或 pending 占位改为本站内链（保留 ESDC fallback 链接）
- 技术栈：**纯静态 HTML / CSS，无框架、无构建**（[docs/engineering.md](docs/engineering.md)）
- 可部署目录：[site/](site/)
- 已有路径页：
  - [`site/paths/us-overview.html`](site/paths/us-overview.html) — 美国 · 移民体系通用前置知识（primer，非 path）
  - [`site/paths/jp-hsp.html`](site/paths/jp-hsp.html) — 日本 · 高度専門職 1 号ロ · 工签 → 永住 → 帰化
  - [`site/paths/jp-hsp-1a.html`](site/paths/jp-hsp-1a.html) — 日本 · 高度専門職 1 号イ 研究系 · 共用 1 号ロ 的 § 2–§ 4 / § 6 / § 7
  - [`site/paths/us-l1b.html`](site/paths/us-l1b.html) — 美国 · L-1B · 工签 → 永居 → 入籍
  - [`site/paths/us-l1a.html`](site/paths/us-l1a.html) — 美国 · L-1A · 工签 → EB-1C → 永居 → 入籍
  - [`site/paths/us-h1b.html`](site/paths/us-h1b.html) — 美国 · H-1B · 抽签 → 工签 → 永居 → 入籍
  - [`site/paths/us-o1.html`](site/paths/us-o1.html) — 美国 · O-1 · 杰出人才 → EB-1A → 永居 → 入籍
  - [`site/paths/us-eb1a.html`](site/paths/us-eb1a.html) — 美国 · EB-1A · 杰出人才自荐绿卡（不是签证 · 绿卡分类页）
  - [`site/paths/us-eb1b.html`](site/paths/us-eb1b.html) — 美国 · EB-1B · 杰出教授或研究员雇主赞助绿卡（6 条 ≥ 2 条 + 3 年教研 + permanent offer）
  - [`site/paths/us-eb5.html`](site/paths/us-eb5.html) — 美国 · EB-5 · 投资移民（RIA 2022 · CLPR → I-829 → 永久绿卡）
  - [`site/paths/sg-one-pass.html`](site/paths/sg-one-pass.html) — 新加坡 · ONE Pass · 工签 → PR → Citizenship
  - [`site/paths/ca-gts.html`](site/paths/ca-gts.html) — 加拿大 · Global Talent Stream · 2 周工签 → Express Entry PR → 入籍
  - [`site/paths/au-gtv.html`](site/paths/au-gtv.html) — 澳大利亚 · National Innovation Visa（NIV · 前 GTV · Subclass 858）· 一步到位永居 → 入籍
  - [`site/paths/uk-global-talent.html`](site/paths/uk-global-talent.html) — 英国 · Global Talent Visa · 背书驱动 · Stage 1 + Stage 2 → ILR → 入籍
  - [`site/paths/us-niw.html`](site/paths/us-niw.html) — 美国 · EB-2 NIW · 国家利益豁免（不是签证 · 绿卡分类页 · Matter of Dhanasar 三要素）
  - [`site/paths/ca-ict.html`](site/paths/ca-ict.html) — 加拿大 · ICT 跨国公司内部调动 · IRPR §205(a) · C12 · 三档落档 · 配偶 OWP · 达 CEC 后接 ca-gts § 3 同口径 · 中国大陆出发专门写

## Next · 下一步

- [ ] **消化"待补路径"清单**（见下文）：按能力逐条建立，每建一条全站搜 `class="pending"` 替换
- [ ] **选定最终站点名**（或继续用 `relocate` 到真正公开那天）
- [x] ~~决定部署目标~~ — **已部署到 Cloudflare Pages**（[docs/engineering.md](docs/engineering.md) 推荐方案落地）；正式域名仍待选定
- [ ] **License 落定** — 内容 CC BY-SA 4.0 + 代码 MIT（倾向），写回 [README.md](README.md) + 根目录加 `LICENSE`
- [ ] **favicon / OG 图**（上线前）

### 待补路径清单

全站仍以 `class="pending"` 占位的去处（建立目标页后须全站搜索替换）：

| 建议 slug | 目标文件 | 出现于 |
| --- | --- | --- |
| `uk-skilled-worker` | `site/paths/uk-skilled-worker.html` | uk-global-talent.html § 8 |
| `uk-hpi` | `site/paths/uk-hpi.html` | uk-global-talent.html § 8 |
| `uk-innovator-founder` | `site/paths/uk-innovator-founder.html` | uk-global-talent.html § 8 |
| `ca-pnp-tech` | `site/paths/ca-pnp-tech.html` | ca-gts.html § 8 · ca-ict.html § 8 |
| `ca-suv` | `site/paths/ca-suv.html` | ca-gts.html § 8 · ca-ict.html § 8 |
| `au-189` | `site/paths/au-189.html` | au-gtv.html § 8 |
| `au-190-491` | `site/paths/au-190-491.html` | au-gtv.html § 8 |
| `au-482` | `site/paths/au-482.html` | au-gtv.html § 8 |
| `ae-golden-visa` | `site/paths/ae-golden-visa.html` | sg-one-pass.html § 8 |
| `jp-hsp-2` | `site/paths/jp-hsp-2.html` | jp-hsp.html § 5 |
| `jp-gijinkoku` | `site/paths/jp-gijinkoku.html` | jp-hsp.html § 5 |
| `jp-business-manager` | `site/paths/jp-business-manager.html` | jp-hsp.html § 5 |

**尚未在任何已建页 § 8 / § 5 出现、但已识别值得做的国家与路径**（2026-05-19 增补；建立时按维度 C 在对应已建页加占位 + 加入上表）：

| 建议 slug | 目标文件 | 国家 / 路径 |
| --- | --- | --- |
| `nz-smc` | `site/paths/nz-smc.html` | 新西兰 · Skilled Migrant Category Resident Visa（2023 改版 6 分制 · 直接指向 PR） |
| `nz-aewv` | `site/paths/nz-aewv.html` | 新西兰 · Accredited Employer Work Visa（2022 改革后主流雇主担保工签） |
| `nz-green-list` | `site/paths/nz-green-list.html` | 新西兰 · Green List Tier 1 / Tier 2（紧缺职业直通 PR / 工作 24 月后 PR） |
| `ie-csep` | `site/paths/ie-csep.html` | 爱尔兰 · Critical Skills Employment Permit（欧盟内英语国 · MSFT / Google / Meta EMEA 内部调动天然链路 · 与 ca-ict 互补） |
| `ie-gep` | `site/paths/ie-gep.html` | 爱尔兰 · General Employment Permit（非紧缺职业雇主担保） |
| `ie-step` | `site/paths/ie-step.html` | 爱尔兰 · Start-up Entrepreneur Programme（5 万欧元创业 · 与 ca-suv / uk-innovator-founder 同类） |

> NZ / IE 不是空白调研：pivot 前的早期视觉 / 结构探索 [`design/coverage-survey.html`](design/coverage-survey.html) 中已粗梳理过两国的工签 / 永居 / 入籍框架与候选路径名单，可作为开建时的快速起点。该草稿仅为历史留痕（pivot 前的 Tier A/B/C 分层机制已废弃，[RULES.md](RULES.md) § 6），所列具体数字 / 评级不可直接采信，须按 path-authoring.md 重新核源。

`jp-hsp.html` § 5 的 1 号イ / 1 号ロ→HSP 2 号 / 技人国 / 経営管理 条目已统一转为 `class="pending"` 占位 + 官方 fallback 链接（2026-05-19）。建立对应路径页时，全站搜索 pending slug 替换为本站实链（保留官方 fallback）。

优先级建议（更新于 2026-05-19）：`uk-skilled-worker`（UK 板块从 1 条变 2 条）→ `ie-csep`（欧盟英语国空白 + 与 ca-ict 形成 MSFT 内部调动场景的双选项）→ `ca-pnp-tech`（ca-gts / ca-ict 共同 plan B）→ `nz-smc`（NZ 板块从 0 → 1 + 与 AU NIV 对照）→ `au-189`（AU 第二条）。

已完成、从本清单拿掉的：

- ~~把 L-1B 路径样稿与美国一手源从 archive/ 挪回主线~~（2026-04-19）
- ~~把现有 HTML 样稿落成可发布的静态站~~（2026-04-19）
- ~~首页草稿~~（2026-04-19）
- ~~重写 JP HSP 为完整工签→永住→帰化 + 家庭 + 备选切换~~（2026-04-19）
- ~~为 L-1B 补家庭双保险 + 备选切换~~（2026-04-19）
- ~~把 `us-l1b-family.html` 重命名为 `us-l1b.html`~~（2026-04-19）
- ~~过 JP HSP 页正文 + 修正 ISA 失效 URL~~（2026-04-19）
- ~~下载 JP HSP 官方原件到 `data/archive/jp/hsp/` 并在页面 § 7 表补「本地归档」列~~（2026-04-19）
- ~~US L-1B 页 § 10 四张子表补「本地归档」列~~（2026-04-19）
- ~~新增 US H-1B 路径 + 归档 + 首页更新 + 交叉链接~~（2026-04-19）
- ~~新增 US O-1 杰出人才路径 + 官方原件归档 + 跨页链接替换~~（2026-04-20）
- ~~新增 US L-1A 路径 + 归档 + 四页交叉链接 + 共用段引用 L-1B 页~~（2026-04-20）
- ~~新增 US EB-1A 杰出人才自荐绿卡页 + Policy Manual Vol 6 Part F Ch 2 归档 + 六页交叉链接~~（2026-04-20）
- ~~新增 SG ONE Pass 路径 + MOM / ICA / IRAS / AGC 共 10 份官方原件归档 + 六页交叉链接~~（2026-04-20）
- ~~新增 CA Global Talent Stream 路径 + ESDC / IRCC / Justice Laws 共 13 份官方原件归档 + 六页交叉链接~~（2026-04-20）
- ~~新增 AU National Innovation Visa（NIV · 前 GTV · Subclass 858）路径 + Home Affairs / legislation.gov.au 共 6 份官方原件归档 + 三页交叉链接~~（2026-04-20）
- ~~新增 UK Global Talent Visa 路径 + GOV.UK / Immigration Rules / legislation.gov.uk 共 16 份官方原件归档 + 八页交叉链接~~（2026-04-20）
- ~~新增 US EB-2 NIW 国家利益豁免路径 + USCIS 4 份官方原件归档 + 跨页链接~~（2026-04-20）
- ~~把 sg-one-pass.html § 8 中 ca-gts 的 pending 占位替换为本站实链~~（2026-04-21）
- ~~新增 CA ICT（跨国公司内部调动）路径 + IRCC IMP R205(a) 归档 + ca-gts § 8 占位换本站实链~~（2026-05-19）

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
