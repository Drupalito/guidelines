---
layout: asideleft
title: "Convention codage"
group_index: true
group: "CSS"
category: ""
weight: 0
---

* **Indentation : 2 espaces** ;
* Validation W3C CSS (ou justifier la non conformité) ;
* **Le nom des class CSS doit être en anglais** ;
* Nommage `.class-name {}` ;
* Utiliser uniquement des tirets pour les classes `.class-name {}` ;
* Placer 2 underscore lorsque le code est considéré comme un hack ou non stable `.__class-name {}` ;
* Prohiber `!important` ;
* Limiter l'imbrication des sélecteurs (max. 2) ;
* Ajouter un espace après les deux points d'une déclaration ;
* Ajouter toujours un point-virgule à la fin de la dernière déclaration d’un bloc ;
* Écrire les règles sur une ligne lorsqu'elles contiennent une seule propriété ;
* Utiliser des minuscules pour les valeurs hexadécimales, exemple : #aaa ;
* Sauter une ligne entre chaque règle ;
* Prohiber l'utilisation d'ID pour styliser un bloc.
* Utiliser le même type de guillemets. *Doubles guillemets*, exemple : `content: ""` soit : `input[type="checkbox"]` ;
* Interdire de spécifier les unités pour les valeurs nulles, exemple : `margin: 0`.

```scss
.selector {
  /* Styles du bloc actuel */
  property: value;
  property2: value;

  p { // Descendent direct
    property:value;  // **Mauvais**
    property: value; // Bon
  }

  .className {}   // **Mauvais**
  .CLASSNAME {}   // **Mauvais**
  .class_name {}  // **Mauvais**
  .class-name{}   // **Mauvais**
  .class-name {}  // Bon
  .class__name {} // Bon

  // Sélécteurs successifs (une par ligne)
  .selector-1, .selector-2, .selector-3 {} // **Mauvais**
  .selector-1,
  .selector-2,
  .selector-3 {} // Bon

  // Une propriété
  .one-liner { margin: 0; border-radius: 5px; font-size: 15px; } // **Mauvais**
  .one-liner { margin: 0; } // Bon: une propriété

  // Modifier des styles de base
  &--modifier {
    p { // Descendant de remplacement

    }
  }

  .indentation-tricks {
    // Aligner les variables pour assurer une bonne lisibilité
    // Voir SublimeText2 Plugin Alignment
    $var-alpha:   15px !default;
    $var-epsylon: true;
    $var-zeta:    false;
  }

  @media (min-width: 680px) {
    // Modifications pour le breakpoint
    // Avec Sass, on peut imbriquer `media
  }

  // Conditions
  @if $compact {
    // Case 1
  }
  @else {
    // Case 2
  }
}

// Ajouter une ligne blanche à la fin du fichier
```

Les longues valeurs de propriétés, séparées par des virgules *comme des ensembles de dégradés et d'ombres* peuvent être agencées sur plusieurs lignes de manière à améliorer la lisibilité et produire des fichiers diff plus utiles.

Divers formats peuvent alors être utilisés comme le montre l'exemple donné ci-dessous :

```css
.selecteur {
  box-shadow:
    1px 1px 1px #000,
    2px 2px 1px 1px #ccc inset;
  background-image:
    linear-gradient(#fff, #ccc),
    linear-gradient(#f3c, #4ec);
}
```
