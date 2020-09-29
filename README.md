# Portail

> MTES-MCT fabrique numérique's homepage

A static site built with [Hugo](https://gohugo.io) and hosted on [Github pages](https://mtes-mct.github.io/portail/).

## Development

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

* imports people, startups and phases from [beta.gouv.fr](https://github.com/betagouv/beta.gouv.fr)

* builds the static website

* publishes the website into [Github pages](https://mtes-mct.github.io/portail/)

## Add content

In [src/content](src/content) directory, you change or add markdown files, except people, startups and phases.

People, startups and phases are automatically imported from beta.gouv.fr.

If you want to add a person or a startup, you have to make a PR in [beta.gouv.fr](https://github.com/betagouv/beta.gouv.fr) repository.
