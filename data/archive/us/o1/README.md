# `data/archive/us/o1/` · O-1 杰出人才官方原件归档

本目录存 [`site/paths/us-o1.html`](../../../../site/paths/us-o1.html) § 10 总表里引用的、**O-1 类独有**的官方原件副本。

与 L-1B / H-1B 共享的条款（INA §101 / §214 / §245 / §316 / §319 / §320 · AC21 · CSPA · CCA · 8 CFR 245 · I-485 / I-765 / I-131 / I-693 / N-400 / N-470 / N-600 · IRS Pub 519 等）**不在此重复归档**，`us-o1.html` 正文内的链接直接指向 `data/archive/us/l1b/` 或 `data/archive/us/h1b/` 下已有文件。

## 子目录

- `uscis/` — USCIS 官网 O-1 概览 / O-1A / O-1B 证据页 / Policy Manual Vol.2 Part M / 2022-01 O-1A STEM 备忘
- `regulations/` — 8 CFR 214.2(o)（O 类实施细则）
- `statutes/` — 8 USC §1101 / §1184（方便单独引用，本体同 l1b）
- `forms/` — I-129 + 说明 · I-907 · DS-160 / I-94 在线入口 stub

## 更新方法

```bash
cd data/archive/us/o1
./download.sh
```

`_download.log` 会记录每个文件是 `OK` / `SKIP`（已存在）/ `FAIL`。FAIL 多半是 URL 变了，人工校对 USCIS / eCFR 的新地址再更新 `download.sh`。
