# engineering.md — 技术栈与维护说明

## 技术栈决定

**纯静态 HTML / CSS，无框架，无构建步骤，无运行时依赖。**

- 每个页面是一份自洽的 `.html` 文件，`<style>` 内联
- 共享样式通过"约定 + 复制"而非"工具链"维持：新页面抄一份现有页面的 `:root` 变量与基础样式，在此之上改内容
- 没有 `package.json`、没有 `node_modules`、没有构建产物
- 部署 = 把 `site/` 直接扔到任何静态托管（GitHub Pages / Netlify / Cloudflare Pages / 自己的 nginx）

### 为什么不用 Astro / Eleventy / Next.js

考虑过。都被否决：

- **Astro / Eleventy**：两位数依赖起步，构建产物与源文件分离，每次写作要 `npm run dev`。本项目当前只有 2 条路径、未来也不会多，工具链本身的维护成本 > 它能省掉的重复成本。
- **Next.js / Vite**：本项目不需要 SPA、不需要客户端 JS。用任何 React 框架都是给一份原本"HTML + CSS"就能完成的事情强行加一个运行时。

等哪天路径数突破 10 + 或者真的要做内容分类 / 搜索，再回来评估 Eleventy。

### 代价（明确承认）

- **"仅供参考·非官方"banner 的重复性**：每个路径 HTML 自己维护 `.caveat` 块。改措辞要改多处。可接受——它是法律面最重要的一段字，逐页 review 不是坏事。
- **设计 token 复制**：`:root` 变量在每个 HTML 里各存一份。改色需要跨文件改。可接受——色表稳定，极少调。

## 目录结构

```
site/                     # 可部署静态站
├── index.html            # 首页
└── paths/                # 路径详情页
    ├── jp-hsp.html       # 日本 · 高度専門職 1 号ロ
    └── us-l1b.html

data/                     # 引用过的官方文件本地归档
└── archive/<country>/<path-slug>/
    ├── README.md         # 这份归档是什么 / 怎么来的
    ├── download.sh       # 可重放的抓取脚本
    └── <statutes|regulations|policy|forms>/

design/                   # 规划期视觉与结构探索，非可部署内容
├── coverage-survey.html  # 覆盖清单
└── sitemap.html          # 早期站点结构

docs/                     # 工序与协作笔记
├── engineering.md        # 本文
└── path-authoring.md     # 新增一条路径的参考工序

archive/                  # 试错留痕，永不删除
```

## 本地预览

```sh
# 进 site 目录，起一个最简 HTTP 服务即可
cd site
python3 -m http.server 8000
# 然后浏览器开 http://localhost:8000
```

或直接在 Finder 双击 `site/index.html` 用 `file://` 协议打开，大多数情况也能正常工作（相对链接、锚点均可用）。

## 部署

**推荐：Cloudflare Pages，publish root 设为仓库根 `/`。**

- 理由：纯静态零构建；CF 国内 PoP 对中文读者访问体验好；**仓库可保持 private**（GitHub Pages 免费版要求 public）；自定义域名 + 自动 HTTPS 全包
- 入口在 `/site/`，根目录有 `_redirects`（`/` → `/site/`）把根 URL 302 重定向到首页
- 归档原件在 `/data/archive/...`，路径页用 `../../data/archive/...` 相对链接——**正因为 publish root 选仓库根而不是 `/site`，这些链接才能工作**
- 根目录额外文件：
  - [`_redirects`](../_redirects) — CF Pages 专用重写规则
  - [`404.html`](../404.html) — CF Pages / GH Pages 均自动识别
  - [`robots.txt`](../robots.txt) — 允许 `/site/` 和 `/data/archive/`（仅目录页）索引，封禁 `/archive/`、`/design/`、`/docs/`
  - [`sitemap.xml`](../sitemap.xml) — 列出所有路径页；**上线前须把 `https://relocate.example.com` 替换为真实域名**，并在 `robots.txt` 中同步

### 操作步骤（5 分钟）

1. dash.cloudflare.com → Workers & Pages → Create → Pages → Connect to Git
2. 选本仓库，`Production branch: main`
3. Build settings：`Framework preset: None` · `Build command:`（留空）· `Build output directory:` 填 `/` 或留空
4. Deploy → 拿到 `relocate-xxx.pages.dev`
5. 自定义域名：Custom domains → Add（可选）
6. 域名落地后，编辑 `sitemap.xml` 和 `robots.txt` 替换占位 URL，git push 即自动重新部署

### 替代方案

- **GitHub Pages**：Settings → Pages → Source: `Deploy from branch` → `main` → `/site`。但这会让 `../../data/archive/...` 链接 404（publish root 是 `/site`，归档在上层）。要么改用 `main` + `/`（让 GH Pages 当整仓根），要么全站改为 `/data/archive/...` 绝对路径——两者都比 CF Pages 折腾。另外仓库必须 public
- **Netlify**：功能上与 CF Pages 等价，但国内访问更慢
- **任意 nginx / Caddy**：`root` 指向仓库根，location `/` 重定向到 `/site/`

## 新增一条路径时

参考 [path-authoring.md](./path-authoring.md)。简单版：

1. 在 `site/paths/` 下新建 `<country>-<visa>.html`，复制一份现有路径（如 `jp-hsp.html`）作为起点
2. 保留 `<style>` 块不动，改 `<title>` / `header.top` / `h1` / `.caveat` / 正文
3. `.caveat` 必须保留"仅供参考 · 非官方"字样（[RULES.md](../RULES.md) § 1.4）
4. 页面右上角 `header.top` 里放"← 回到 relocate 首页"链接
5. 在 `site/index.html` 的"目前有内容的路径"清单里加一行
6. 引用的官方文件下到 `data/archive/<country>/<path-slug>/` 并在 [SOURCES.md](../SOURCES.md) 登记

## 关于 JS

当前所有页面零 JS。保持这样。如果某个功能非要 JS 不可（比如长路径的目录折叠），用原生 `<details>` 或短到可以内联的 vanilla JS，不引入任何前端库。
