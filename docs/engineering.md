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
    └── us-l1b-family.html

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

**推荐：GitHub Pages，source 设为 `/site`。**

替代方案：
- **Netlify / Cloudflare Pages**：publish directory 设为 `site`，无构建命令
- **任意 nginx / Caddy**：`root` 指向 `site/` 即可

暂未正式公开部署；域名与上线时机未定。

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
