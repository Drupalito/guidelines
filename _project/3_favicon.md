---
layout: asideleft
title: "Favicon"
description: ""
group: "Project"
category: ""
weight: 3
---

Génération du `favicon` via le service Web [Real Favicon Generator](https://realfavicongenerator.net/){:rel="external"}.

Placer les fichiers `favicon` (`favicon.ico`, `apple-touch-icon.png`, etc.) à la racine de votre site Web.

L'image qui va générer le favicon doit avoir les dimensions `260x260`, PNG ou mieux SVG.

```html
  <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
  <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png" />
  <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png" />
  <link rel="manifest" href="/manifest.json" />
  <meta name="theme-color" content="#ffffff" />
```

[Favicon Style Cheat](https://github.com/audreyr/favicon-cheat-sheet){:rel="external"}
