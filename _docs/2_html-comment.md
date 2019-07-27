---
layout: asideleft
title: "Commentaires"
group: "HTML"
category: ""
weight: 2
---

Les commentaires ne doivent pas contenir d'informations techniques, ni références aux exigences client.

De manière générale, **utiliser la syntaxe de commentaires du language utilisé**. Cela évitera de surcharger les poids des pages.

## Commentaire HTML

```html
  <!-- Comment -->
```

## Commentaire PHP

Commentaire sur plusieurs lignes.

```php
  <?php
    /**
     * Mon commentaires
     * sur plusieurs lignes.
     */
  ?>
```

Commentaire sur une seule ligne

```php
  <?php
      // Mon commentaire sur une ligne.
  ?>
```

## Commentaire Twig

```twig
  {# Mon Commentaire #}
```

## Commentaire Jekyll

```liquid
  {% raw  %}{% comment %}
      Mon comentaire
  {% endcomment %}{% endraw  %}
```
