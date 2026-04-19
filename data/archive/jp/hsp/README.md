# JP HSP 源文件归档

此目录保存 `site/paths/jp-hsp.html` § 7 官方文件总表（及正文引用）所指向的官方原件快照，用于当在线页面改版或失效时仍可验证本站行文所依据的事实。

## 重抓

```bash
./download.sh
```

重复运行会跳过已下载、非空的文件（`SKIP`）。如需强制重抓某文件，先删除对应文件再运行。

## 目录

- `isa/` — 法務省出入国在留管理庁（Immigration Services Agency）
  - `hsp_points-system.html` — 高度人材ポイント制 制度入口
  - `hsp_status-page.html` — 在留资格「高度専門職」页（含 1 号 / 2 号申请手续）
  - `hsp_points-calculation-table.pdf` — 积分计算表（官方告示）
  - `hsp-spouse-employment.html` — 高度専門職外国人の就労する配偶者（特定活動告示）
  - `eijuu_guidelines.html` — 永住許可ガイドライン
  - `gijinkoku_engineer-humanities.html` — 技術・人文知識・国際業務
  - `keiei-kanri_business-manager.html` — 経営・管理
  - `dependent_family-stay.html` — 家族滞在
- `law/` — e-Gov 法令検索
  - `e-gov_immigration-act.xml` — 出入国管理及び難民認定法（通过 e-Gov 官方 API `laws.e-gov.go.jp/api/1/lawdata/...` 取 XML 全文；检索页本身是 SPA，无法以 curl 静态保存）
  - `e-gov_nationality-act.xml` — 国籍法（同上）
- `moj/` — 法務省民事局
  - `kika_naturalization.html` — 帰化許可申請
- `mhlw/` — 厚生労働省
  - `public-pension.html` — 公的年金制度
- `prc/` — 全国人民代表大会
  - `prc_nationality-act.html` — 中华人民共和国国籍法

所有文件均直接从对应发布机关的官方站点以 HTTPS 抓取，未作任何内容改写。e-Gov 的法令文本以官方 `lawdata` API 返回的 XML 形式保存。
