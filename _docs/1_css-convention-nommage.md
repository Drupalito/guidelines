---
layout: asideleft
title: "Nommage des Classes"
group: "CSS"
category: ""
weight: 1
---

Utiliser des noms clairs et réfléchis pour les classes HTML. Choisir un modèle de nommage cohérent et compréhensif qui a du sens à la fois dans les fichiers HTML et dans les fichiers CSS.

* **Le nom des classes doit être en anglais ;**
* Plusieurs mots dans une classe doivent être séparés par un trait d'union ;
* Placer 2 underscore lorsque le code est considéré comme un hack ou non stable `.__class-name {}` ;
* Utiliser des classes et non des IDs dans la mesure du possible ;
* **Les déclarations utilisent les méthodologies OOCSS, SMACSS, BEM.**.

Nommer les choses est difficile. Pour simplifier, nous utilisons la méthodologie BEM dans les noms de classes. BEM nous aide également à éviter les collisions entre modules et à indiquer l'intention et les relations des noms de classes.

Notre version de BEM suit cette syntaxe:

```css
  .block {}
  .block__element {}
  .block--modifier {}
```

Par exemple, pour créer un `block header` contenant un logo :

```css
  .header.logo {}          /* **Mauvais** */
  .header-logo {}          /* **Mauvais** */
  .header.header--logo {}  /* Bon (modifier) */
  .header__logo {}         /* **Mauvais** (elements) */
```

Par exemple:

```html
  <div class="gallery">
    <div class="gallery__inner">
      <h1 class="gallery__title">Gallery</h1>
      <img alt="" class="gallery__image gallery__image--large" />
      <img alt="" class="gallery__image" />
      <img alt="" class="gallery__image" />
    </div>
  </div>
```

| Titre d'un bloc ou contenu  | &__title |
| img<br/>Image | &__image | img.__image 
| div>img<br/>Image wrapper | &__capture | div.__capture>img 
| p<br/>Résumé d'un paragraphe  | &__excerpt | p.__excerpt 
| div>p<br/>Texte ou Résumé de plusieurs paragraphes | &__body | div._body>p
| ul, ol<br/>Liste à puce | &__list |
| li<br/>Élements de liste | &__item |
| a (sur une grande zone)<br/>block lien | &__link |
| Groupement d'actions | &__actions
| Boutons & liens hypertexte | &__btn

## États

Utiliser le préfixe `is-` pour définir un état visuel:

```html
  <div class="is-hidden"><p>This element has state</p></div>
```

## Javascript hooks

Garantir une distinction entre le contenu et la fonctionnalité.

```html
  <div class="tab js-tab"><p>This element can be reached by javascript</p></div>
```

## Préprocesseurs Sass Compass

* Placer toujours les déclarations `@extend` en début de bloc ;
* Regrouper toutes les déclarations `include` en début de bloc juste après les déclarations `@extend`.

```scss
.selecteur-1 {
  @extend .other-rule;
  box-sizing: border-box;
  width: width: 100%;
  /* Autres déclarations */
}
```
