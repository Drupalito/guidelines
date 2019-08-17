---
layout: asideleft
title: "Guide de démarrage"
description: ""
group_index: true
group: "Design Elements"
category: ""
weight: 0
---

{% capture dirfolder %}{{ site.ROOT }}/{{ site.OWNER_NAME }}/{{ site.DIR }}/{% endcapture %}
{% capture instance %}{{ dirfolder }}site/www/{% endcapture %}

## Structure du projet

Le projet a été monté de la façon suivante :

### Organisation du projet

```sh
🗂 /{{ site.DIR }}
├── 🗂 /docs
├── 🗂 /reports
└── 🗂 /site
    ├── 📃 .csscomb.json
    ├── 📃 .editorconfig
    ├── 📃 .scss-lint.yml
    ├── 📃 LICENSE
    ├── 📃 README.md
    ├── 📃 **config.yml** # fichier de configuration**
    ├── 📃 gulpfile.js
    ├── 🗂 /node_modules
    ├── 📃 package.json
    ├── 🗂 /tasks
    └── 🗂 /www
        ├── 📃 CMS Files (Drupal, WordPress...)
        └── 🗂 **/source (contient SCSS / Images / JS / Fonts / Libraries**
```

* **/site** : Contient le site (`/www`). Les autres fichiers concernent le fonctionnement des tâches automatiques GULP.

* **/www** : Contient les fichiers du site (CMS / Static / Jekyll). Ainsi que le dossier `/source`.

## Installation

{% if site.REPO != 0 %}
Cloner le repo

```sh
  git clone {{ site.REPO }} {{ instance }}
```

Vérifier si il y a une branch `develop` ou un autre nom.

```sh
  git branch -a
  git checkout origin/develop
  git checkout -b develop origin/develop
  git branch
```

{% else %}
```sh
  # Aucune information d'installation
```
{% endif %}
