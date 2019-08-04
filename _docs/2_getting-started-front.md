---
layout: asideleft
title: "Guide du Front"
description: ""
group: "Docs"
category: ""
weight: 2
---

{% capture dirfolder %}{{ site.ROOT }}/{{ site.OWNER_NAME }}/{{ site.DIR }}/{% endcapture %}
{% capture instance %}{{ dirfolder }}site/www/{% endcapture %}

## Organisation des fichiers `/source`

```sh
🗂 /source
├── 🗂 /fonts
├── 🗂 /images
├── 🗂 /js
├── 🗂 /libraries
└── 🗂 /scss
    ├── 🗂 /base
    ├── 🗂 /components
    ├── 🗂 /helpers
    ├── 🗂 /modules
    └── 🗂 /themes
```

Le dossier `/scss` est divisé en plusieurs dossiers.

<dl>
  <dt>Base</dt>
  <dd class="mb-3">Contient la base du framework, le `reset` ainsi quelques bases textes et formulaires.</dd>
  <dt>Components</dt>
  <dd class="mb-3">Un composant est utilisé pour désigner tout élément d'interface utilisateur empaqueté pour la distribution.</dd>
  <dt>Helpers</dt>
  <dd class="mb-3">Toutes les variables de configuration ainsi que les fonctions et mixins nécessaires au framework.</dd>
  <dt>Modules</dt>
  <dd class="mb-3">Pour des besoins spécifiques, un module embarque son propre fonctionnement.</dd>
</dl>

## Compilation

Afin de complier le dossier `/source` vous devrez installer les fichiers de tâches GULP. Pour cela télécharger le package GULP.

Au préalable, vous devez avoir:
* nodejs
* GULP
* Sass 3.4.23 Ruby

Commencer par cloner le repo contenant les tâches GULP.

```sh
  # Cloner le repo au bon endroit
  git clone git@github.com:Drupalito/gulp_tasks.git {{ dirfolder }}site/
  # Supprimer le référentiel .git
  rm -rf {{ dirfolder }}site/.git
```

Maintenant, il faut installer les dépendances.

```sh
  # Se rendre dans le dossier
  cd {{ dirfolder }}site/
  # Installer les dépendances
  npm install
```

Ok, les fichiers sont en place.
Il reste à modifier le fichier `config.yml` comme si dessous... [vérifier les `path.dist` et `path.src`]

```yaml
# {{ dirfolder }}site/config.yml
# Fichier de configuration pour les tâches Gulp.
name: "{{ site.SITE_NAME }}"
project: "{{ site.SITE_PROJECT }}"
url: "{{ site.URL }}"
autoprefixer:
  - "last 5 versions"
  - "ie 9"
  - "ie 10"
  - "ie 11"
  - "ios >= 7"
  - "android >= 4.4"
  - "opera 12"
path:
  dist: "www/sites/all/themes/custom/{{ site.SITE_PROJECT }}"
  src: "www/sites/all/themes/custom/{{ site.SITE_PROJECT }}"
pathfolder:
  source: /source
  dist:
    css: /css
    images: /images
    fonts: /fonts
    libraries: /libraries
    js: /js
assets:
  colors:
    default:   "{{ site.COLORZ.DEFAULT }}"
    primary:   "{{ site.COLORZ.PRIMARY }}"
    secondary: "{{ site.COLORZ.SECONDARY }}"
```

## Tâches automatiques GULP

### Tâches principales

| Tâche   | Description
|---------|------------
| **build** | **Sans minification des CSS et JS.**<br/>Regroupe: `clean`, `fonts`, `images`, `styles`, `scripts`.
| **build \--prod** | **Avec minification des CSS et JS.**<br/>Regroupe: `clean`, `fonts`, `images`, `styles`, `scripts`.
| **watch** | **Observateur de fichiers.**<br/>Réécriture en cas de modification des fichiers sources.

Pour exécuter une tâche, taper dans le terminal `gulp nom_de_la_tache`.

L'utilisation du flag `--prod` aura pour but d'optimiser les fichiers pour une utilisation en production.  
Utilisation: `gulp nom_de_la_tache --prod`.

### Tâches individuelles

| Tâche   | Description
|---------|------------
| **clean** | Supprime les dossiers contruits: `/css`, `/js`, `/fonts`, `/images` et `/libraries`.<br/>**À utiliser si on est sur :D**
| **fonts** | Copie le dossier `/source/fonts`.
| **libraries** | Copie le dossier `/source/libraries`.
| **images** | Copie le dossier `/source/images`<br/>Optimise les images png, jpg et svg.
| **scripts** | Compile les fichiers `/source/js`.
| **styles** | Compile les fichiers Scss `/source/scss`.<br/>Utilise `autoprefixer`.
