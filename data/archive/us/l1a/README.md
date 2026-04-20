# data/archive/us/l1a/ — US L-1A 路径官方原件归档

对应 [`site/paths/us-l1a.html`](../../../../site/paths/us-l1a.html) § 10 官方文件总表。

## 本目录只装 L-1A / EB-1C 独有项

L-1A 与 L-1B 共享绝大多数上游法条与下游流程（统一的 I-129、I-485、N-400、INA §101/§214/§245/§316/§319/§320、8 CFR 245、AC21、CSPA、CCA、IRS Pub 519 等）。这些文件已存于：

- [`data/archive/us/l1b/statutes`](../l1b/statutes/)
- [`data/archive/us/l1b/regulations`](../l1b/regulations/)
- [`data/archive/us/l1b/forms`](../l1b/forms/)
- [`data/archive/us/l1b/policy`](../l1b/policy/)（DOS Visa Bulletin · USCIS When to File · IRS Pub 519 · DOL OFLC / FLAG 入口 等）

页面 § 10 的「本地归档」列链接到上述目录；本目录仅新增 L-1A / EB-1C 路径独有的几份文件。

## 本目录文件

| 分类 | 文件 | 发布机构 | 说明 |
| --- | --- | --- | --- |
| uscis | `l1a_overview.html` | USCIS | L-1A Intracompany Transferee Executive or Manager 说明页 |
| uscis | `eb1_overview.html` | USCIS | EB-1 总览页（含 EB-1C Multinational Manager or Executive 段。USCIS 2023 重组后 EB-1C 独立深链已 404，内容合并进本页） |
| uscis | `policy-manual_vol2-part-l.html` | USCIS | Policy Manual Vol 2 Part L · Intracompany Transferees（L-1A / L-1B 共用章节，就近存在本目录） |
| uscis | `policy-manual_vol6-part-f-ch5_eb1c.html` | USCIS | Policy Manual Vol 6 Part F Ch 5 · Advanced-Level Managers or Executives（EB-1C 章节） |

## 复现

```bash
cd data/archive/us/l1a
bash download.sh
```

脚本幂等：已存在文件 SKIP，失败的删掉重下。失败写入 `_download.log`。

## L-1A 独有的事实口径（摘要 · 阅读页面时作速查）

1. 岗位性质必须满足 INA §101(a)(44) 对 "managerial capacity" 或 "executive capacity" 的定义；纯一线主管通常不合格，除非其管辖的下属本身具有专业地位。"functional manager"（不带团队但管理核心职能）在 USCIS Policy Manual Vol 2 Part L Ch 3 下明确承认。
2. 累计在美时长上限 **7 年**（L-1B 为 5 年）。
3. "新办公室（new office）"首期仅给 1 年，到期前 60 天内必须递延期，证明该办公室已实际开展业务、雇佣美国员工、具备独立办公场所。
4. EB-1C（职业移民一优·跨国高管经理）与 L-1A 事实要件高度同构：① 合格雇主关系；② I-140 递交前 3 年内在海外关联雇主处连续工作 ≥ 1 年（若已在美持 L-1A 工作，则以最后一次进入美国工作前的 3 年段计算）；③ 美国雇主须已存在且运营 **至少 1 年**；④ 岗位为 managerial / executive capacity。无 PERM。
