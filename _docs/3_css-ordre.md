---
layout: asideleft
title: "Ordre des propriétés"
group: "CSS"
category: ""
weight: 3
---

Les propriétés dans les différents sélecteurs CSS doivent suivre cet ordre:

* Mixins
* Extends
* Position
* Box model
* Typography
* Decorative

```css
  .component {
    @extend %clearfix
    position
    top
    right
    z-index
    display
    width
    height
    margin
    padding
    border
    font-size
    font-style
    font-weight
    line-height
    background
    color
    box-shadow
    opacity
    outline
  }
```
