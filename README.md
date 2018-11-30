# Usage

1. [Install Hugo](https://gohugo.io/overview/installing/)
2. Clone this repository

```bash
git clone https://github.com/MTES-MCT/portail.git
cd portail
```

4. Run Hugo

```bash
hugo server -s src/
```

# Publish to Github pages

```bash
rm -rf src/public
git worktree add -B gh-pages public upstream/gh-pages
HUGO_ENV=production hugo -v -s src/
cd src/public && git add --all && git commit -m "Publishing to gh-pages" && cd ..
git push upstream gh-pages
```