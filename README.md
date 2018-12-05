# Development

1. [Install Hugo](https://gohugo.io/overview/installing/)

2. Clone this repository

```bash
git clone https://github.com/MTES-MCT/portail.git
cd portail
```

3. Run local server to build and hot reload the website

```bash
hugo server -s src/
```

When you `git push` your changes, circleci:

* imports people and startups from [beta.gouv.fr](https://github.com/betagouv/beta.gouv.fr)

* builds the static website

* publishes the website into [Github pages](https://mtes-mct.github.io/portail/)

# Add content

In `src/content` directory, you change or add markdown files, except people and startups.

People and startups are automatically imported from beta.gouv.fr.

If you want to add a person or a startup, you have to make a PR in [beta.gouv.fr](https://github.com/betagouv/beta.gouv.fr) repository.