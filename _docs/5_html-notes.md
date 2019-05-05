---
layout: asideleft
title: "Notes et conseils"
group: "HTML"
category: ""
weight: 5
---

## Méta-tag compatible X-UA

Une autre caractéristique IE obsolète: `<meta http-equiv="X-UA-Compatible" content="IE=Edge">`.

Sur les sites de réseau local, IE 8-10 utilisent automatiquement un mode "rétrocompatible" pour rendre la page, en essayant d'imiter IE 7. Cette balise indique à IE d'éviter cela. IE 11 et Edge ont arrêté cette absurdité.

## Type par défaut pour les styles

Ce n'est pas essentiel, mais vous pouvez supprimer les attributs `type` sur la feuille de style lorsqu'il utilise la valeure `text/css` par défaut.

```html
  <link rel="stylesheet" type="text/css" href="/js/main.js">
  <style type="text/css">/* code */</style>

  <!-- Bon -->
  <link rel="stylesheet" href="/js/main.js">
  <style>/* code */</style>
```

## Type par défaut pour les scripts

Ce n'est pas essentiel, mais vous pouvez supprimer les attributs `type` sur les appels de script lorsqu'il utilise la valeure `text/javascript` par défaut.

```html
  <script type="text/javascript" src="/js/main.js"></script>
  <script type="text/javascript">…</script>

  <!-- Bon -->
  <script src="/js/main.js"></script>
  <script>…</script>
```

