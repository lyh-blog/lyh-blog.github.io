# Hugo 网站自动部署到 GitHub Pages


## 部署网站

在你的 `GitHub` 仓库的根目录下，创建 `.github/workflows/gh-pages.yml`。

```yaml
name: GitHub Pages

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          submodules: true
          fetch-depth: 0

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v3
        with:
          hugo-version: '0.123.8'
          extended: true

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

当我们向 `main` 分支 `push` 代码时，`GitHub Actions` 会帮我们自动部署到 `GitHub Pages`。

## 提交代码

运行 `submit.ps1`

```powershell
$t = Get-Date -Format "yyyy-MM-dd HH:mm"
git add .
git commit -m "✨ Update: $t"
git push
```



## 创建文章

运行 `new-post.ps1`

```powershell
$t = Get-Date -Format "yyyyMMddHHmmss"
$name = $t + ".md"
$c = "hugo new posts/" + $name
Invoke-Expression $c
```


