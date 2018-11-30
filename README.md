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
rm -rf docs
HUGO_ENV=production hugo -v -s src/
mv src/docs .
git add .
git commit -m "Update site"
git push origin
```