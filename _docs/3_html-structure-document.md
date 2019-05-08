---
layout: asideleft
title: "Structure du document"
group: "HTML"
category: ""
weight: 3
---

La structure de base d'une page HTML doit avoir:

* Le doctype HTML5: `<!DOCTYPE html>` ;
* Un seul élément racine: `<html>` ;
* Avec deux éléments enfants: `<head>` et `<body>`.

```html
<!DOCTYPE html>
<html lang="fr" dir="ltr">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Titre la page</title>
  <meta name="description" content="Description de la page."/>
  <link rel="stylesheet" href="screen-base.min.css"/>
</head>
<body>
  <!-- Visible content -->
  <script src="/js/main.js"></script>
</body>
</html>
```

## Déclaration des langues

Toujours fournir un attribut `lang` sur l'élément racine, coupler avec `dir`. S'assurer qu'il affiche la langue correcte pour chaque page, en particulier sur les sites multilingues.

Drupal gère cela très bien. Le thème prend en charge les manques.

## Métadonnées

La déclaration d'encodage est obligatoire. Elle évite le risque de problèmes d’affichage des caractères.

`<title>` et `meta-description` doivent renseigner un contenu spécifique pour chaque page.

## Styles

Utiliser `<link rel="stylesheet" href="screen-base.min.css"/>` entre les balises `<head/>`.

**Nous essayons de limiter le nombre de feuilles de style à 3.**  
Pour chaque feuille de style, le navigateur fait une requête HTTP, et bloque le rendu de la page jusqu'à ce que tout le CSS arrive.

Des styles en lignes peuvent être utilisés pour gérer des couleurs de thème ou des préférences utilisateurs.

## Scripts

Utiliser `<script src="/js/main.js"></script>` après le contenu de la page. Mettre les balises de scripts avant la fermeture de `</body>`.

## Encodage et caractères

* **Toujours utiliser UTF-8** ;
* Dans le contenu du texte, utilisez des caractères typographiquement corrects, par exemple `’` (apostrophe) ou `…`(ellipse) ;
* Éviter les références de caractères (Fançais, pas Fran&#231;ais), sauf pour les caractères invisibles (`&nbsp;`). Accentuer les majuscules.
