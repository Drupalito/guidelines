---
layout: asideleft
title: "Libraires Javascript"
description: ""
group: "Design Elements"
weight: 99
---

##  Libraries

Liste des librairies jQuery, régulièrement utilisées sur les thémes.

* [jQuery](https://jquery.com/){:rel="external"}
* [Animation JS CSS WOW](http://mynameismatthieu.com/WOW/){:rel="external"}
* [Slider OwlCarousel 2](https://owlcarousel2.github.io/OwlCarousel2/){:rel="external"}
* [JS Socials](http://js-socials.com/){:rel="external"}

## Smooth Scroll

Pour mettre un scroll doux et animé, vous pouvez ajouter une class CSS `.scroll` sur vos liens et boutons.

Cette classe est utilisé par le module custom Drupal `scrolltotop`.  
Elle permet, en cliquant sur un bouton, de revenir en haut de page.

Exemple : [Scroll to banner](#banner){:.scroll}

```html
  <button id="scrollToTop" class="scroll">
    <span aria-hidden="true" class="fa fa-caret-up"></span>
    <span class="a11y">Haut de page</span>
  </button>
```

## Rel-external

Cet attribut `rel="external"` permet l'ouverture d'un lien dans une nouvelle fenêtre. Cet attribut peut être, uniquement ajouté sur un lien texte.

[Voir script JS](https://codepen.io/aquelito/pen/VbVwqG){:rel="external"}

```html
  <a rel="external" href="https://google.fr">Google rel-external</a>
```

* [RGAA - Critère 13.2 [A] Dans chaque page web, pour chaque ouverture de nouvelle fenêtre, l'utilisateur est-il averti ?) ?](https://references.modernisation.gouv.fr/rgaa-accessibilite/criteres.html#crit-13-2){:rel="external"}
