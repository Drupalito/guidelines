---
layout: asideleft
title: "Debugging Grilles"
description: ""
group: "Grille Responsive"
weight: 98
styles_css:
  - /assets/corecss/debug.grid.css
---

Code issu de [Veröffentlicht von Andre](http://firchow.net/bootstrap3-grid-debug/){:rel="external"}.

Un petit fichier CSS affiche la classe de grille utilisée dans chaque colonne. Les colonnes sont surlignées en couleur, chaque taille (points d'arrêt `xs`, `sm`, `md` et `lg`) à sa propre couleur.

La taille d'écran utilisée est affichée dans le coin supérieur droit.

Le tout est fait sur une base CSS, donc aucun code JavaScript supplémentaire n'est nécessaire. Intégrez simplement le fichier `debug.grid.css` en tant que dernier fichier CSS sur les pages.

```html
  debug.grid.css
```

## Exemple

<div class="row">
  <div class="col-xs-12 col-sm-3 col-md-4">
    <div class="card pam text-center">
      <code>.col-xs-12.col-sm-3.col-md-4</code>
    </div>
  </div>
  <div class="col-xs-12 col-sm-3 col-md-4">
    <div class="card pam text-center">
      <code>.col-xs-12.col-sm-3.col-md-4</code>
    </div>
  </div>
  <div class="col-xs-12 col-sm-3 col-md-4">
    <div class="card pam text-center">
      <code>.col-xs-12.col-sm-3.col-md-4</code>
    </div>
  </div>
  <div class="col-xs-12 col-sm-3 col-md-4">
    <div class="card pam text-center">
      <code>.col-xs-12.col-sm-3.col-md-4</code>
    </div>
  </div>
  <div class="col-xs-12 col-sm-3 col-md-4">
    <div class="card pam text-center">
      <code>.col-xs-12.col-sm-3.col-md-4</code>
    </div>
  </div>
  <div class="col-xs-12 col-sm-3 col-md-4">
    <div class="card pam text-center">
      <code>.col-xs-12.col-sm-3.col-md-4</code>
    </div>
  </div>
</div>
