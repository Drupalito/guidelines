---
layout: asideleft
title: "Internationalisation"
description: ""
group: "Design Elements"
category: ""
weight: 4
---

## Logo

## Images & légendes

## Framework CSS & composants

Certains composants et modules disposent d'une feuille de style (SCSS) avec un suffix `rtl` pour `right-to-left`. Par exemple: `NOM_COMPOSANT-rtl.scss`.

Bonne pratique, dans la feuille de style principal du composant, il est recommandé d'ajouter un commentaire en ligne `/* LTR */` afin d'indiquer les properties à modifier pour internationaliser le composant.

```scss
  // @file component.scss
  .component {
    display: block;
    margin-left: 1.5em; /* LTR */
  }
```

```scss
  // @file component-rtl.scss
  .component {
    margin-right: 1.5em;
  }
```
