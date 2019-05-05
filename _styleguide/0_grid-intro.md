---
layout: asideleft
title: "Introduction"
description: "Le système de grille utilisé permet la gestion d'un affichage responsive. Les items insérés à l'interieur ne doivent pas utiliser de taille fixe (`width:`) car l'affichage deviendra incorrect."
group_index: true
group: "Grille Responsive"
category: ""
weight: 0
---

## Fonctionnement

1. Les lignes doivent être placées dans un `.container` (fixed-width) ou `.container-fluid` (full-width) pour un alignement et padding correcte.
1. Utiliser les lignes pour créer des groupes horizontaux de colonnes.
1. Le contenu doit être placé dans des colonnes et seules les colonnes peuvent être des enfants immédiats de lignes (`.row`).
1. Les colonnes sont créées en spécifiant le nombre de douze colonnes. Par exemple, trois colonnes égales utiliseraient trois `.col-xs-4`.
1. Les classes  s'appliquent aux périphériques avec des largeurs d'écran supérieures ou égales aux tailles des breakpoints et remplacent les classes ciblées sur les périphériques plus petits.\\
Par conséquent, l'application de n'importe quelle classe `.col-md-*` à un élément n'affectera pas seulement son style sur les appareils de taille moyenne, mais aussi sur les gros appareils si une classe `.col-lg-*` n'est pas présente.

```html
<!-- //1 -->
<div class="container">
  <!-- //2 //3 -->
  <div class="row">
    <!-- //4 //5 -->
    <div class="col-xs-12 col-sm-5 col-md-6">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
    </div>
    <!-- //4 //5 -->
    <div class="col-xs-12 col-sm-8 col-md-6">
      <p>Necessitatibus labore laudantium eaque illo enim et fugit, sed at.</p>
    </div>
  </div>
</div>
```

## Media queries

Utiliser les media queries suivantes dans les fichiers SCSS pour créer les points d'arrêt.

```css
  /* Extra small devices (phones, less than {{ site.SCREEN_SM_MIN }}) */
  /* No media query since this is the default in Bootstrap */
  /* Small devices (tablets, {{ site.SCREEN_SM_MIN }} and up) */
  @media (min-width: $screen-sm-min) {
    …
  }

  /* Medium devices (desktops, {{ site.SCREEN_MD_MIN }} and up) */
  @media (min-width: $screen-md-min) {
    …
  }

  /* Large devices (large desktops, {{ site.SCREEN_LG_MIN }} and up) */
  @media (min-width: $screen-lg-min) {
    …
  }
```

Occasionnellement inclure un `max-width` permet de limiter CSS à un ensemble plus restreint de périphériques.

```css
  /* Seulement si ≤ {{ site.SCREEN_SM_MIN | minus: 1 }}px */
  @media (max-width: $screen-xs-max) {
    …
  }

  /* Seulement si ≥ {{ site.SCREEN_SM_MIN }} et ≤ {{ site.SCREEN_MD_MIN | minus: 1 }}px */
  @media (min-width: $screen-sm-min) and (max-width: $screen-sm-max) {
    …
  }

  /* Seulement si ≥ {{ site.SCREEN_MD_MIN }} et ≤ {{ site.SCREEN_LG_MIN | minus: 1 }}px */
  @media (min-width: $screen-md-min) and (max-width: $screen-md-max) {
    …
  }

  /* Seulement si ≥ {{ site.SCREEN_LG_MIN }} */
  @media (min-width: $screen-lg-min) {
    …
  }
```

## Options de grille

Aspects de la grille Bootstrap responsive.

<div class="table-responsive"><table class="table table-bordered table-striped responsive-utilities"><thead><tr><th></th><th> XS devices <small>Phones (&lt;{{ site.SCREEN_SM_MIN }})</small></th><th> SM devices <small>Tablets (&ge;{{ site.SCREEN_SM_MIN }})</small></th><th> MD devices <small>Desktops (&ge;{{ site.SCREEN_MD_MIN }})</small></th><th> LG devices <small>Desktops (&ge;{{ site.SCREEN_LG_MIN }})</small></th></tr></thead><tbody><tr><th class="text-nowrap" scope="row">Comportement</th><td>Horizontale</td><td colspan="3">Réduit horizontalement suivent breakpoint.</td></tr><tr><th class="text-nowrap" scope="row">Largeur du conteneur</th><td>None (auto)</td><td>750px</td><td>970px</td><td>1170px</td></tr><tr><th class="text-nowrap" scope="row">Préfixe de classe</th><td><code>.col-xs-</code></td><td><code>.col-sm-</code></td><td><code>.col-md-</code></td><td><code>.col-lg-</code></td></tr><tr><th class="text-nowrap" scope="row">Nombre de colonnes</th><td colspan="4">12</td></tr><tr><th class="text-nowrap" scope="row">Largeur colonne</th><td class="text-muted">Auto</td><td>~62px</td><td>~81px</td><td>~97px</td></tr><tr><th class="text-nowrap" scope="row">Largeur gouttière</th><td colspan="4">30px (15px entre chaque colonne)</td></tr><tr><th class="text-nowrap" scope="row">Nestable</th><td colspan="4">Oui</td></tr><tr><th class="text-nowrap" scope="row">Décalages</th><td colspan="4">Oui</td></tr><tr><th class="text-nowrap" scope="row">Ordre des colonnes</th><td colspan="4">Oui</td></tr></tbody></table></div>
